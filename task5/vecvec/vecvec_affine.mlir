module {
  func.func @vecvec(%arg0: memref<4xf32>, %arg1: memref<4xf32>, %arg2: memref<f32>) {
    affine.for %arg3 = 0 to 4 {
      %0 = affine.load %arg0[%arg3] : memref<4xf32>
      %1 = affine.load %arg1[%arg3] : memref<4xf32>
      %2 = affine.load %arg2[] : memref<f32>
      %3 = arith.mulf %0, %1 : f32
      %4 = arith.addf %2, %3 : f32
      affine.store %4, %arg2[] : memref<f32>
    }
    return
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<4xf32>
    %alloc_0 = memref.alloc() : memref<4xf32>
    %alloc_1 = memref.alloc() : memref<f32>
    affine.for %arg0 = 0 to 4 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %alloc[%arg0] : memref<4xf32>
      memref.store %1, %alloc_0[%arg0] : memref<4xf32>
    }
    call @vecvec(%alloc, %alloc_0, %alloc_1) : (memref<4xf32>, memref<4xf32>, memref<f32>) -> ()
    return
  }
}

