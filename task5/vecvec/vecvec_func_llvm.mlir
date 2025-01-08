module attributes {llvm.data_layout = ""} {
  llvm.func @vecvec(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr<f32>, %arg6: !llvm.ptr<f32>, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr<f32>, %arg11: !llvm.ptr<f32>, %arg12: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = builtin.unrealized_conversion_cast %5 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> to memref<4xf32>
    %7 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %8 = llvm.insertvalue %arg5, %7[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg6, %8[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg7, %9[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg9, %11[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = builtin.unrealized_conversion_cast %12 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> to memref<4xf32>
    %14 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %15 = llvm.insertvalue %arg10, %14[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %16 = llvm.insertvalue %arg11, %15[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %17 = llvm.insertvalue %arg12, %16[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %18 = builtin.unrealized_conversion_cast %17 : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> to memref<f32>
    %19 = llvm.mlir.constant(0 : index) : i64
    %20 = llvm.mlir.constant(4 : index) : i64
    %21 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%19 : i64)
  ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb2
    %23 = builtin.unrealized_conversion_cast %22 : i64 to index
    %24 = llvm.icmp "slt" %22, %20 : i64
    llvm.cond_br %24, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %25 = memref.load %6[%23] : memref<4xf32>
    %26 = memref.load %13[%23] : memref<4xf32>
    %27 = memref.load %18[] : memref<f32>
    %28 = llvm.fmul %25, %26  : f32
    %29 = llvm.fadd %27, %28  : f32
    memref.store %29, %18[] : memref<f32>
    %30 = llvm.add %22, %21  : i64
    llvm.br ^bb1(%30 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() {
    %alloc = memref.alloc() : memref<4xf32>
    %0 = builtin.unrealized_conversion_cast %alloc : memref<4xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %alloc_0 = memref.alloc() : memref<4xf32>
    %1 = builtin.unrealized_conversion_cast %alloc_0 : memref<4xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %alloc_1 = memref.alloc() : memref<f32>
    %2 = builtin.unrealized_conversion_cast %alloc_1 : memref<f32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%3 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb2
    %7 = builtin.unrealized_conversion_cast %6 : i64 to index
    %8 = llvm.icmp "slt" %6, %4 : i64
    llvm.cond_br %8, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %9 = llvm.trunc %6 : i64 to i32
    %10 = llvm.sitofp %9 : i32 to f32
    memref.store %10, %alloc[%7] : memref<4xf32>
    memref.store %10, %alloc_0[%7] : memref<4xf32>
    %11 = llvm.add %6, %5  : i64
    llvm.br ^bb1(%11 : i64)
  ^bb3:  // pred: ^bb1
    %12 = llvm.extractvalue %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.extractvalue %0[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.extractvalue %1[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.extractvalue %1[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.extractvalue %1[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.extractvalue %1[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.extractvalue %2[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %23 = llvm.extractvalue %2[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %24 = llvm.extractvalue %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    llvm.call @vecvec(%12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64) -> ()
    llvm.return
  }
}

