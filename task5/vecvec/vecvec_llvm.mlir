module attributes {llvm.data_layout = ""} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @vecvec(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr<f32>, %arg6: !llvm.ptr<f32>, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr<f32>, %arg11: !llvm.ptr<f32>, %arg12: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %7 = llvm.insertvalue %arg5, %6[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg6, %7[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg7, %8[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg8, %9[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg9, %10[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %13 = llvm.insertvalue %arg10, %12[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %14 = llvm.insertvalue %arg11, %13[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %15 = llvm.insertvalue %arg12, %14[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.mlir.constant(4 : index) : i64
    %18 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%16 : i64)
  ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb2
    %20 = llvm.icmp "slt" %19, %17 : i64
    llvm.cond_br %20, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %21 = llvm.getelementptr %arg1[%19] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %22 = llvm.load %21 : !llvm.ptr<f32>
    %23 = llvm.getelementptr %arg6[%19] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %24 = llvm.load %23 : !llvm.ptr<f32>
    %25 = llvm.load %arg11 : !llvm.ptr<f32>
    %26 = llvm.fmul %22, %24  : f32
    %27 = llvm.fadd %25, %26  : f32
    llvm.store %27, %arg11 : !llvm.ptr<f32>
    %28 = llvm.add %19, %18  : i64
    llvm.br ^bb1(%28 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.null : !llvm.ptr<f32>
    %3 = llvm.getelementptr %2[4] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %4 = llvm.ptrtoint %3 : !llvm.ptr<f32> to i64
    %5 = llvm.call @malloc(%4) : (i64) -> !llvm.ptr<i8>
    %6 = llvm.bitcast %5 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %7 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %8 = llvm.insertvalue %6, %7[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %6, %8[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.mlir.constant(0 : index) : i64
    %11 = llvm.insertvalue %10, %9[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %0, %11[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %1, %12[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(4 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.null : !llvm.ptr<f32>
    %17 = llvm.getelementptr %16[4] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %18 = llvm.ptrtoint %17 : !llvm.ptr<f32> to i64
    %19 = llvm.call @malloc(%18) : (i64) -> !llvm.ptr<i8>
    %20 = llvm.bitcast %19 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %21 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.insertvalue %20, %21[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.insertvalue %20, %22[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %14, %25[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %15, %26[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.mlir.constant(1 : index) : i64
    %29 = llvm.mlir.null : !llvm.ptr<f32>
    %30 = llvm.getelementptr %29[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %31 = llvm.ptrtoint %30 : !llvm.ptr<f32> to i64
    %32 = llvm.call @malloc(%31) : (i64) -> !llvm.ptr<i8>
    %33 = llvm.bitcast %32 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %34 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %35 = llvm.insertvalue %33, %34[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %36 = llvm.insertvalue %33, %35[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.insertvalue %37, %36[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %39 = llvm.mlir.constant(0 : index) : i64
    %40 = llvm.mlir.constant(4 : index) : i64
    %41 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%39 : i64)
  ^bb1(%42: i64):  // 2 preds: ^bb0, ^bb2
    %43 = llvm.icmp "slt" %42, %40 : i64
    llvm.cond_br %43, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %44 = llvm.trunc %42 : i64 to i32
    %45 = llvm.sitofp %44 : i32 to f32
    %46 = llvm.getelementptr %6[%42] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %45, %46 : !llvm.ptr<f32>
    %47 = llvm.getelementptr %20[%42] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %45, %47 : !llvm.ptr<f32>
    %48 = llvm.add %42, %41  : i64
    llvm.br ^bb1(%48 : i64)
  ^bb3:  // pred: ^bb1
    %49 = llvm.extractvalue %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.extractvalue %13[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %51 = llvm.extractvalue %13[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %52 = llvm.extractvalue %13[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.extractvalue %13[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %54 = llvm.extractvalue %27[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %55 = llvm.extractvalue %27[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %56 = llvm.extractvalue %27[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %57 = llvm.extractvalue %27[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.extractvalue %27[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.extractvalue %38[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %60 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %61 = llvm.extractvalue %38[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    llvm.call @vecvec(%49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64) -> ()
    llvm.return
  }
}

