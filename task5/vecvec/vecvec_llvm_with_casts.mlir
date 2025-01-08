module attributes {llvm.data_layout = ""} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
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
    %25 = llvm.extractvalue %5[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.getelementptr %25[%22] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %27 = llvm.load %26 : !llvm.ptr<f32>
    %28 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.getelementptr %28[%22] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %30 = llvm.load %29 : !llvm.ptr<f32>
    %31 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %32 = llvm.load %31 : !llvm.ptr<f32>
    %33 = llvm.fmul %27, %30  : f32
    %34 = llvm.fadd %32, %33  : f32
    %35 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    llvm.store %34, %35 : !llvm.ptr<f32>
    %36 = llvm.add %22, %21  : i64
    llvm.br ^bb1(%36 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.null : !llvm.ptr<f32>
    %3 = llvm.getelementptr %2[%0] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
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
    %14 = builtin.unrealized_conversion_cast %13 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> to memref<4xf32>
    %15 = builtin.unrealized_conversion_cast %14 : memref<4xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %16 = llvm.mlir.constant(4 : index) : i64
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.mlir.null : !llvm.ptr<f32>
    %19 = llvm.getelementptr %18[%16] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %20 = llvm.ptrtoint %19 : !llvm.ptr<f32> to i64
    %21 = llvm.call @malloc(%20) : (i64) -> !llvm.ptr<i8>
    %22 = llvm.bitcast %21 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %23 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %24 = llvm.insertvalue %22, %23[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %22, %24[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.mlir.constant(0 : index) : i64
    %27 = llvm.insertvalue %26, %25[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %16, %27[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %17, %28[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = builtin.unrealized_conversion_cast %29 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> to memref<4xf32>
    %31 = builtin.unrealized_conversion_cast %30 : memref<4xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.mlir.null : !llvm.ptr<f32>
    %34 = llvm.getelementptr %33[%32] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %35 = llvm.ptrtoint %34 : !llvm.ptr<f32> to i64
    %36 = llvm.call @malloc(%35) : (i64) -> !llvm.ptr<i8>
    %37 = llvm.bitcast %36 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %38 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %39 = llvm.insertvalue %37, %38[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %40 = llvm.insertvalue %37, %39[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %41 = llvm.mlir.constant(0 : index) : i64
    %42 = llvm.insertvalue %41, %40[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> to memref<f32>
    %44 = builtin.unrealized_conversion_cast %43 : memref<f32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64)>
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(4 : index) : i64
    %47 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%45 : i64)
  ^bb1(%48: i64):  // 2 preds: ^bb0, ^bb2
    %49 = builtin.unrealized_conversion_cast %48 : i64 to index
    %50 = llvm.icmp "slt" %48, %46 : i64
    llvm.cond_br %50, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %51 = llvm.trunc %48 : i64 to i32
    %52 = llvm.sitofp %51 : i32 to f32
    %53 = llvm.extractvalue %13[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %54 = llvm.getelementptr %53[%48] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %52, %54 : !llvm.ptr<f32>
    %55 = llvm.extractvalue %29[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %56 = llvm.getelementptr %55[%48] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %52, %56 : !llvm.ptr<f32>
    %57 = llvm.add %48, %47  : i64
    llvm.br ^bb1(%57 : i64)
  ^bb3:  // pred: ^bb1
    %58 = llvm.extractvalue %15[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.extractvalue %15[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %60 = llvm.extractvalue %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %61 = llvm.extractvalue %15[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %62 = llvm.extractvalue %15[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.extractvalue %31[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.extractvalue %31[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.extractvalue %31[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.extractvalue %31[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.extractvalue %31[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.extractvalue %44[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %69 = llvm.extractvalue %44[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    %70 = llvm.extractvalue %44[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64)> 
    llvm.call @vecvec(%58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64, i64, i64, !llvm.ptr<f32>, !llvm.ptr<f32>, i64) -> ()
    llvm.return
  }
}

