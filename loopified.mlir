module {
  func.func @gemm(%arg0: tensor<16384x16384xf32>, %arg1: tensor<16384x16384xf32>, %arg2: tensor<16384x16384xf32>) -> tensor<16384x16384xf32> attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c16384 = arith.constant 16384 : index
    %c1 = arith.constant 1 : index
    %0 = bufferization.to_memref %arg1 : memref<16384x16384xf32>
    %1 = bufferization.to_memref %arg0 : memref<16384x16384xf32>
    %2 = bufferization.to_memref %arg2 : memref<16384x16384xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16384x16384xf32>
    memref.copy %2, %alloc : memref<16384x16384xf32> to memref<16384x16384xf32>
    scf.for %arg3 = %c0 to %c16384 step %c1 {
      scf.for %arg4 = %c0 to %c16384 step %c1 {
        scf.for %arg5 = %c0 to %c16384 step %c1 {
          %4 = memref.load %1[%arg3, %arg5] : memref<16384x16384xf32>
          %5 = memref.load %0[%arg5, %arg4] : memref<16384x16384xf32>
          %6 = memref.load %alloc[%arg3, %arg4] : memref<16384x16384xf32>
          %7 = arith.mulf %4, %5 : f32
          %8 = arith.addf %7, %6 : f32
          memref.store %8, %alloc[%arg3, %arg4] : memref<16384x16384xf32>
        }
      }
    }
    %3 = bufferization.to_tensor %alloc : memref<16384x16384xf32>
    return %3 : tensor<16384x16384xf32>
  }
}
