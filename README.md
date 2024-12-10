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





