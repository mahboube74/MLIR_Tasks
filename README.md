# MLIR_Tasks

Task 1:

Matrix-Matrix Multiplication (GEMM) using Linalg Generic
The function takes matrices A, B, and C as arguments, with appropriate dimensions.
Use the linalg.generic operation to specify matrix multiplication. MLIR code is in "gemm.mlir". The code            represents a high-level matrix multiplication in the Linalg dialect.

Task 2:

Lowering to Affine Dialect and Applying Loop-Unroll Transformation
Use MLIR passes to lower Linalg operations to the Affine dialect. This converts the linalg.generic operation into nested affine loops. Apply the affine-loop-unroll pass to unroll loops for better performance.
I run the following commands to lower and transform:

    mlir-opt --convert-linalg-to-affine-loops gemm.mlir -o gemm_affine.mlir

Task 3:

Generate LLVM IR (Convert the transformed Affine MLIR code to LLVM IR)
To generate the LLVM IR from the transformed Affine dialect code, we need to lower the MLIR to LLVM IR.

    mlir-opt --lower-affine gemm_affine.mlir -o gemm_lowered_affine.mlir
    mlir-opt --convert-scf-to-cf gemm_lowered_affine.mlir -o gemm_lowered_scf.mlir
    mlir-opt --convert-func-to-llvm gemm_lowered_scf.mlir -o gemm_func_llvm.mlir
    mlir-opt --convert-memref-to-llvm gemm_func_llvm.mlir -o gemm_llvm_with_casts.mlir
    mlir-opt --reconcile-unrealized-casts gemm_llvm_with_casts.mlir -o gemm_llvm.mlir
    mlir-translate --mlir-to-llvmir gemm_llvm.mlir -o gemm.ll

    
Task 4:
first solution: 
In this task, we added a custom operation (linalg.vecvec) to the Linalg dialect in MLIR. This operation computes the dot product of two vectors and produces a scalar result. 

1. Modify LinalgStructuredOps.td
We defined the new operation linalg.vecvec in the LinalgOps.td file. This file contains all structured operations in the Linalg dialect.

```mlir
def Linalg_VecVecOp : Linalg_Op<"vecvec",
    [DestinationStyleOpInterface,
     PredOpTrait<"input and output have same element type", TCopVTEtIsSameAs<0, 1>>,
     DeclareOpInterfaceMethods<ReifyRankedShapedTypeOpInterface>,
     DeclareOpInterfaceMethods<MemoryEffectsOpInterface>,
     DeclareOpInterfaceMethods<TilingInterface,
      ["getIterationDomain",
       "getLoopIteratorTypes",
       "getResultTilePosition",
       "getTiledImplementation"]>]> {
  let summary = "Vector-vector multiplication operation";
  let description = [{
    This operation performs vector-vector multiplication, resulting in a scalar output.
    Specifically, given two vectors `v1` and `v2` of the same size, the operation computes:
      `result = sum(v1[i] * v2[i]) for all i`.
  }];

  let arguments = (ins AnyRankedTensor:$vector1,
                       AnyRankedTensor:$vector2,
                       AnyRankedTensor:$output);

  let results = (outs Variadic<AnyRankedTensor>:$result);
  let hasFolder = 1;
  let assemblyFormat = [{
    attr-dict
    `ins` `(` $vector1 `:` type($vector1) `,` $vector2 `:` type($vector2) `)`
    `outs` `(` $output `:` type($output) `)`
    (`->` type($result)^)?
  }];

  let extraClassDeclaration = [{
    ShapedType getVector1OperandType() {
      return cast<ShapedType>(getVector1().getType());
    }
    ShapedType getVector2OperandType() {
      return cast<ShapedType>(getVector2().getType());
    }
    ShapedType getOutputOperandType() {
      return cast<ShapedType>(getOutput().getType());
    }
    MutableOperandRange getDpsInitsMutable() { return getOutputMutable(); }
  }];
  let hasVerifier = 1;
}

```

2. Update LinalgOps.cpp
We implemented the builder function for VecVecOp in LinalgOps.cpp to handle operands, indexing maps, and iterator types.

```cpp
// Task 4
LogicalResult VecVecOp::verify() {
    ShapedType vector1Type = getVector1OperandType();
    ShapedType vector2Type = getVector2OperandType();
    ShapedType outputType = getOutputOperandType();

    if (!vector1Type.hasRank() || !vector2Type.hasRank() || !outputType.hasRank())
      return emitOpError("all operands must have ranked types");

    if (vector1Type.getRank() != 1 || vector2Type.getRank() != 1)
      return emitOpError("inputs must be 1D vectors");

    if (vector1Type.getDimSize(0) != vector2Type.getDimSize(0))
      return emitOpError("input vectors must have the same size");

    if (outputType.getRank() != 0)
      return emitOpError("output must be a scalar");

    return success();
  }

  SmallVector<Range> VecVecOp::getIterationDomain(OpBuilder &builder) {
  Location loc = getLoc();
  Value zero = builder.create<arith::ConstantIndexOp>(loc, 0);
  Value one = builder.create<arith::ConstantIndexOp>(loc, 1);
  Value vector1 = getVector1();
  int64_t size = getVector1OperandType().getDimSize(0);

  SmallVector<Range> loopBounds(1);
  loopBounds[0].offset = zero;
  Value sizeValue = builder.create<arith::ConstantIndexOp>(loc, size);
  loopBounds[0].size = getValueOrCreateConstantIndexOp(builder, loc, sizeValue);
  loopBounds[0].stride = one;

  return loopBounds;
}


  SmallVector<utils::IteratorType> VecVecOp::getLoopIteratorTypes() {
    return {utils::IteratorType::reduction};
  }

  FailureOr<TilingResult>
  VecVecOp::getTiledImplementation(OpBuilder &builder,
                                    ArrayRef<OpFoldResult> offsets,
                                    ArrayRef<OpFoldResult> sizes) {
    return emitOpError("Tiling not supported for VecVecOp");
  }

  LogicalResult VecVecOp::getResultTilePosition(
      OpBuilder &builder, unsigned resultNumber, ArrayRef<OpFoldResult> offsets,
      ArrayRef<OpFoldResult> sizes, SmallVector<OpFoldResult> &resultOffsets,
      SmallVector<OpFoldResult> &resultSizes) {
    return failure();
  }
  void VecVecOp::getEffects(
    SmallVectorImpl<SideEffects::EffectInstance<MemoryEffects::Effect>> &effects) {
  for (auto [index, operand] : llvm::enumerate(getDpsInputs())) {
    if (!llvm::isa<MemRefType>(operand.getType()))
      continue;
    effects.emplace_back(MemoryEffects::Read::get(),
                         &getOperation()->getOpOperand(index), /*stage=*/0,
                         /*effectOnFullRegion=*/true,
                         SideEffects::DefaultResource::get());
  }


  for (OpOperand &operand : getDpsInitsMutable()) {
    if (!llvm::isa<MemRefType>(operand.get().getType()))
      continue;
    effects.emplace_back(MemoryEffects::Read::get(), &operand, /*stage=*/0,
                         /*effectOnFullRegion=*/true,
                         SideEffects::DefaultResource::get());
    effects.emplace_back(MemoryEffects::Write::get(), &operand, /*stage=*/0,
                         /*effectOnFullRegion=*/true,
                         SideEffects::DefaultResource::get());
  }
}
LogicalResult VecVecOp::reifyResultShapes(
    OpBuilder &b, ReifiedRankedShapedTypeDims &reifiedReturnShapes) {
  auto loc = getLoc();
  auto outputType = getOutputOperandType();
  SmallVector<OpFoldResult> shapes;

  for (int64_t dim : llvm::seq<int64_t>(0, outputType.getRank())) {
    if (!outputType.isDynamicDim(dim)) {
      shapes.push_back(b.getIndexAttr(outputType.getDimSize(dim)));
    } else {
      OpFoldResult dimValue = createOrFoldDimOp(b, loc, getOutput(), dim);
      shapes.push_back(getValueOrCreateConstantIndexOp(b, loc, dimValue));
    }
  }
  reifiedReturnShapes.emplace_back(std::move(shapes));
  return success();
}
LogicalResult VecVecOp::fold(FoldAdaptor adaptor,
                             SmallVectorImpl<OpFoldResult> &results) {
  return memref::foldMemRefCast(*this);
}

```


4. Compile the Code
   
After implementing the custom operator, we recompiled the project:
Here is the implementation:

    cmake -G Ninja .. -DLLVM_ENABLE_PROJECTS=mlir
    ninja


Second solution:


task 5: 

To lower this code to LLVM IR, follow these steps:
```bash
./bin/mlir-opt --lower-affine vecvec_example.mlir -o affine_lowered.mlir

./bin/mlir-opt --convert-linalg-to-loops \
         --convert-linalg-to-llvm \
         --convert-scf-to-cf \
         --convert-memref-to-llvm \
         affine_lowered.mlir -o llvm_lowered.mlir

mlir-translate --mlir-to-llvmir llvm_lowered.mlir -o vecvec.ll
