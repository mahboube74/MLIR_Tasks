# MLIR_Tasks
Task 1: Matrix-Matrix Multiplication (GEMM) using Linalg Generic
The function takes matrices A, B, and C as arguments, with appropriate dimensions.
Use the linalg.generic operation to specify matrix multiplication. MLIR code is in "gemm.mlir". The code represents a high-level matrix multiplication in the Linalg dialect.

Task 2: Lowering to Affine Dialect and Applying Loop-Unroll Transformation
Use MLIR passes to lower Linalg operations to the Affine dialect. This converts the linalg.generic operation into nested affine loops. Apply the affine-loop-unroll pass to unroll loops for better performance.
I run the following commands to lower and transform:

mlir-opt --linalg-bufferize gemm.mlir -o bufferized.mlir
mlir-opt --convert-linalg-to-loops bufferized.mlir -o loopified.mlir
mlir-opt --convert-linalg-to-affine-loops loopified.mlir -o affine_loops.mlir

Task 3: Generate LLVM IR (Convert the transformed Affine MLIR code to LLVM IR)
To generate the LLVM IR from the transformed Affine dialect code, we need to lower the MLIR to LLVM IR.


mlir-opt affine_loops.mlir --convert-memref-to-llvm -o llvm.mlir

Task 4:  focuses on implementing a custom MLIR dialect and operation (vec.myop) to operate on 1D vectors. The task involves defining the operation, its associated dialect, and a lowering pass to transform the custom operation into standard MLIR operations. The overall goal is to produce a valid MLIR transformation pipeline for specific inputs.
1. Define the Operation (MyOp in VecVecOps.h and VecVecOps.cpp): This operation (vec.myop) is designed to take two 1D vectors as input and produce a scalar (f32) result, representing the dot product.  The build function specifies operand and result types, and the verify function checks input validity.
2. Create the Dialect (VecVecDialect in VecVecDialect.h and VecVecDialect.cpp)
3. Implement a Lowering Pass (LowerVecVecPass.cpp)
4. Create an Input MLIR File (test/example.mlir)
5. Transformed MLIR File: The lowering pass converts vec.myop into standard MLIR operations. 







