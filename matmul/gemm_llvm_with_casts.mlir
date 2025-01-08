module attributes {llvm.data_layout = ""} {
  llvm.func @gemm(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<f32>, %arg8: !llvm.ptr<f32>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr<f32>, %arg15: !llvm.ptr<f32>, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = builtin.unrealized_conversion_cast %7 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<2x2xf32>
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %arg7, %9[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg9, %11[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg10, %12[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg12, %13[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg11, %14[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg13, %15[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = builtin.unrealized_conversion_cast %16 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<2x2xf32>
    %18 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.insertvalue %arg14, %18[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg15, %19[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg16, %20[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg17, %21[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg19, %22[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %arg18, %23[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %arg20, %24[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = builtin.unrealized_conversion_cast %25 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<2x2xf32>
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.mlir.constant(2 : index) : i64
    %29 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%27 : i64)
  ^bb1(%30: i64):  // 2 preds: ^bb0, ^bb8
    %31 = builtin.unrealized_conversion_cast %30 : i64 to index
    %32 = llvm.icmp "slt" %30, %28 : i64
    llvm.cond_br %32, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.mlir.constant(2 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%33 : i64)
  ^bb3(%36: i64):  // 2 preds: ^bb2, ^bb7
    %37 = builtin.unrealized_conversion_cast %36 : i64 to index
    %38 = llvm.icmp "slt" %36, %34 : i64
    llvm.cond_br %38, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %39 = llvm.mlir.constant(0 : index) : i64
    %40 = llvm.mlir.constant(2 : index) : i64
    %41 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb5(%39 : i64)
  ^bb5(%42: i64):  // 2 preds: ^bb4, ^bb6
    %43 = builtin.unrealized_conversion_cast %42 : i64 to index
    %44 = llvm.icmp "slt" %42, %40 : i64
    llvm.cond_br %44, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %45 = llvm.extractvalue %7[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.mlir.constant(2 : index) : i64
    %47 = llvm.mul %30, %46  : i64
    %48 = llvm.add %47, %42  : i64
    %49 = llvm.getelementptr %45[%48] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %50 = llvm.load %49 : !llvm.ptr<f32>
    %51 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(2 : index) : i64
    %53 = llvm.mul %42, %52  : i64
    %54 = llvm.add %53, %36  : i64
    %55 = llvm.getelementptr %51[%54] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %56 = llvm.load %55 : !llvm.ptr<f32>
    %57 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = llvm.mlir.constant(2 : index) : i64
    %59 = llvm.mul %30, %58  : i64
    %60 = llvm.add %59, %36  : i64
    %61 = llvm.getelementptr %57[%60] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %62 = llvm.load %61 : !llvm.ptr<f32>
    %63 = llvm.fmul %50, %56  : f32
    %64 = llvm.fadd %62, %63  : f32
    %65 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.mlir.constant(2 : index) : i64
    %67 = llvm.mul %30, %66  : i64
    %68 = llvm.add %67, %36  : i64
    %69 = llvm.getelementptr %65[%68] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %64, %69 : !llvm.ptr<f32>
    %70 = llvm.add %42, %41  : i64
    llvm.br ^bb5(%70 : i64)
  ^bb7:  // pred: ^bb5
    %71 = llvm.add %36, %35  : i64
    llvm.br ^bb3(%71 : i64)
  ^bb8:  // pred: ^bb3
    %72 = llvm.add %30, %29  : i64
    llvm.br ^bb1(%72 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
}

