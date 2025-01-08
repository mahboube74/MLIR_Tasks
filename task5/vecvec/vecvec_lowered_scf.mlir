module {
  func.func @vecvec(%arg0: memref<4xf32>, %arg1: memref<4xf32>, %arg2: memref<f32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %2 = memref.load %arg0[%0] : memref<4xf32>
    %3 = memref.load %arg1[%0] : memref<4xf32>
    %4 = memref.load %arg2[] : memref<f32>
    %5 = arith.mulf %2, %3 : f32
    %6 = arith.addf %4, %5 : f32
    memref.store %6, %arg2[] : memref<f32>
    %7 = arith.addi %0, %c1 : index
    cf.br ^bb1(%7 : index)
  ^bb3:  // pred: ^bb1
    return
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<4xf32>
    %alloc_0 = memref.alloc() : memref<4xf32>
    %alloc_1 = memref.alloc() : memref<f32>
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %2 = arith.index_cast %0 : index to i32
    %3 = arith.sitofp %2 : i32 to f32
    memref.store %3, %alloc[%0] : memref<4xf32>
    memref.store %3, %alloc_0[%0] : memref<4xf32>
    %4 = arith.addi %0, %c1 : index
    cf.br ^bb1(%4 : index)
  ^bb3:  // pred: ^bb1
    call @vecvec(%alloc, %alloc_0, %alloc_1) : (memref<4xf32>, memref<4xf32>, memref<f32>) -> ()
    return
  }
}

