# MLIR_Tasks

Task 1:

Matrix-Matrix Multiplication (GEMM) using Linalg Generic
The function takes matrices A, B, and C as arguments, with appropriate dimensions.
Use the linalg.generic operation to specify matrix multiplication. MLIR code is in "gemm.mlir". The code            represents a high-level matrix multiplication in the Linalg dialect.

Task 2:

Lowering to Affine Dialect and Applying Loop-Unroll Transformation
Use MLIR passes to lower Linalg operations to the Affine dialect. This converts the linalg.generic operation into nested affine loops. Apply the affine-loop-unroll pass to unroll loops for better performance.
I run the following commands to lower and transform:

    mlir-opt --linalg-bufferize gemm.mlir -o bufferized.mlir
    mlir-opt --convert-linalg-to-loops bufferized.mlir -o loopified.mlir
    mlir-opt --convert-linalg-to-affine-loops loopified.mlir -o affine_loops.mlir

Task 3:

Generate LLVM IR (Convert the transformed Affine MLIR code to LLVM IR)
To generate the LLVM IR from the transformed Affine dialect code, we need to lower the MLIR to LLVM IR.

    mlir-opt affine_loops.mlir --convert-memref-to-llvm -o llvm.mlir
    
Task 4:

In this task, we added a custom operation (linalg.vecvec) to the Linalg dialect in MLIR. This operation computes the dot product of two vectors and produces a scalar result. 

1. Modify LinalgStructuredOps.td
We defined the new operation linalg.vecvec in the LinalgStructuredOps.td file. This file contains all structured operations in the Linalg dialect.

```mlir
def Linalg_VecVecOp : LinalgStructuredBase_Op<"vecvec", [
    DeclareOpInterfaceMethods<OpAsmOpInterface>,
    DestinationStyleOpInterface,
    SingleBlockImplicitTerminator<"YieldOp">]> {

  let summary = "Vector-vector multiplication operation";
  let description = [{
    Computes the dot product of two vectors and produces a scalar result.
    Example:
    ```
    %result = linalg.vecvec
        ins(%v1: tensor<4xf32>, %v2: tensor<4xf32>)
        outs(%init: tensor<f32>)
        (%in1: f32, %in2: f32) {
          %prod = arith.mulf %in1, %in2: f32
          linalg.yield %prod: f32
        }
    ```
  }];

  let arguments = (ins
    Variadic<TensorOrMemref>:$inputs,
    TensorOrMemref:$init
  );
  let results = (outs Variadic<AnyTensor>:$result);

  let regions = (region SizedRegion<1>:$reducer);

  let traits = [
    SingleBlockImplicitTerminator<"YieldOp">,
    DestinationStyleOpInterface
  ];

  let builders = [
    OpBuilder<(ins "ValueRange":$inputs, "ValueRange":$inits,
               "function_ref<void(OpBuilder &, Location, ValueRange)>":$bodyBuild,
               CArg<"ArrayRef<NamedAttribute>", "{}">:$attributes)>
  ];

  let extraClassDeclaration = structuredOpsBaseDecls # [{
    SmallVector<utils::IteratorType> getIteratorTypesArray() {
      return {utils::IteratorType::parallel};
    }

    ArrayAttr getIndexingMaps() {
      MLIRContext *context = getContext();
      return ArrayAttr::get(context, {
        AffineMapAttr::get(AffineMap::get(1, 0, getAffineDimExpr(0, context), context)),
        AffineMapAttr::get(AffineMap::get(1, 0, getAffineDimExpr(0, context), context)),
        AffineMapAttr::get(AffineMap::get(0, 0, {}, context))
      });
    }
    MutableOperandRange getDpsInitsMutable() { return getInitMutable(); }
  }];
}
```

2. Update LinalgOps.cpp
We implemented the builder function for VecVecOp in LinalgOps.cpp to handle operands, indexing maps, and iterator types.

```cpp
// Task 4
void VecVecOp::build(OpBuilder &builder, OperationState &state,
                     ValueRange inputs, ValueRange inits,
                     function_ref<void(OpBuilder &, Location, ValueRange)> bodyBuild,
                     ArrayRef<NamedAttribute> attributes) {
  assert(inputs.size() == 2 && "Expected exactly two input vectors");
  assert(inits.size() == 1 && "Expected exactly one init tensor");

  // Add operands
  state.addOperands(inputs);
  state.addOperands(inits);

  // Add result types
  state.addTypes(inits[0].getType());

  // Add attributes
  state.addAttributes(attributes);
  state.addAttribute(
      "operandSegmentSizes",
      builder.getDenseI32ArrayAttr({static_cast<int32_t>(inputs.size()),
                                    static_cast<int32_t>(inits.size())}));

  // Add indexing maps
  auto context = builder.getContext();
  state.addAttribute("indexing_maps",
                     builder.getArrayAttr({
                         AffineMapAttr::get(AffineMap::get(1, 0,
                             getAffineDimExpr(0, context), context)),
                         AffineMapAttr::get(AffineMap::get(1, 0,
                             getAffineDimExpr(0, context), context)),
                         AffineMapAttr::get(AffineMap::get(0, 0, {}, context)),
                     }));

  // Add iterator types
  state.addAttribute("iterator_types",
                     builder.getArrayAttr({builder.getStringAttr("parallel")}));

  // Add a region
  Region &region = *state.addRegion();
  if (bodyBuild) {
    OpBuilder::InsertionGuard guard(builder);
    builder.createBlock(&region, {}, TypeRange(inputs[0].getType()));
    builder.setInsertionPointToStart(&region.front());
    bodyBuild(builder, state.location, region.front().getArguments());
  }
}
```


3. Register the Operation
We registered the operation in the Linalg dialect by updating LinalgDialect.cpp:

```cpp
addOperations<
    mlir::linalg::VecVecOp
>();
```

4. Compile the Code
   
After implementing the custom operator, we recompiled the project:
Here is the implementation:

    cmake -G Ninja .. -DLLVM_ENABLE_PROJECTS=mlir
    ninja



task 5: 

To lower this code to LLVM IR, follow these steps:
```bash
mlir-opt --lower-affine vecvec_example.mlir -o affine_lowered.mlir

mlir-opt --convert-linalg-to-loops \
         --convert-linalg-to-llvm \
         --convert-scf-to-cf \
         --convert-memref-to-llvm \
         affine_lowered.mlir -o llvm_lowered.mlir

mlir-translate --mlir-to-llvmir llvm_lowered.mlir -o vecvec.ll
