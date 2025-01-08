module {
  func.func @vecvec(%arg0: memref<4xf32>, %arg1: memref<4xf32>, %arg2: memref<f32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg3] : memref<4xf32>
      %1 = memref.load %arg1[%arg3] : memref<4xf32>
      %2 = memref.load %arg2[] : memref<f32>
      %3 = arith.mulf %0, %1 : f32
      %4 = arith.addf %2, %3 : f32
      memref.store %4, %arg2[] : memref<f32>
    }
    return
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<4xf32>
    %alloc_0 = memref.alloc() : memref<4xf32>
    %alloc_1 = memref.alloc() : memref<f32>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg0 = %c0 to %c4 step %c1 {
      %0 = arith.index_cast %arg0 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %alloc[%arg0] : memref<4xf32>
      memref.store %1, %alloc_0[%arg0] : memref<4xf32>
    }
    call @vecvec(%alloc, %alloc_0, %alloc_1) : (memref<4xf32>, memref<4xf32>, memref<f32>) -> ()
    return
  }
}

