module {
  func.func @gemm(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>) {
    affine.for %arg3 = 0 to 2 {
      affine.for %arg4 = 0 to 2 {
        affine.for %arg5 = 0 to 2 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<2x2xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<2x2xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<2x2xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<2x2xf32>
        }
      }
    }
    return
  }
}

