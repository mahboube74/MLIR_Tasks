module {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  func.func @gemm(%arg0: tensor<16384x16384xf32>, %arg1: tensor<16384x16384xf32>, %arg2: tensor<16384x16384xf32>) -> tensor<16384x16384xf32> attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c16384 = arith.constant 16384 : index
    %c1 = arith.constant 1 : index
    %0 = bufferization.to_memref %arg1 : memref<16384x16384xf32>
    %1 = builtin.unrealized_conversion_cast %0 : memref<16384x16384xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %2 = bufferization.to_memref %arg0 : memref<16384x16384xf32>
    %3 = builtin.unrealized_conversion_cast %2 : memref<16384x16384xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %4 = bufferization.to_memref %arg2 : memref<16384x16384xf32>
    %5 = builtin.unrealized_conversion_cast %4 : memref<16384x16384xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %6 = llvm.mlir.constant(16384 : index) : i64
    %7 = llvm.mlir.constant(16384 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(268435456 : index) : i64
    %10 = llvm.mlir.null : !llvm.ptr<f32>
    %11 = llvm.getelementptr %10[%9] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %12 = llvm.ptrtoint %11 : !llvm.ptr<f32> to i64
    %13 = llvm.mlir.constant(64 : index) : i64
    %14 = llvm.add %12, %13  : i64
    %15 = llvm.call @malloc(%14) : (i64) -> !llvm.ptr<i8>
    %16 = llvm.bitcast %15 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %17 = llvm.ptrtoint %16 : !llvm.ptr<f32> to i64
    %18 = llvm.mlir.constant(1 : index) : i64
    %19 = llvm.sub %13, %18  : i64
    %20 = llvm.add %17, %19  : i64
    %21 = llvm.urem %20, %13  : i64
    %22 = llvm.sub %20, %21  : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr<f32>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %16, %24[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %26 = llvm.insertvalue %23, %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %6, %28[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %7, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %31 = llvm.insertvalue %7, %30[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %32 = llvm.insertvalue %8, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %33 = builtin.unrealized_conversion_cast %32 : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> to memref<16384x16384xf32>
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.extractvalue %5[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %36 = llvm.mul %34, %35  : i64
    %37 = llvm.extractvalue %5[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %38 = llvm.mul %36, %37  : i64
    %39 = llvm.mlir.null : !llvm.ptr<f32>
    %40 = llvm.getelementptr %39[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %41 = llvm.ptrtoint %40 : !llvm.ptr<f32> to i64
    %42 = llvm.mul %38, %41  : i64
    %43 = llvm.extractvalue %5[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %44 = llvm.extractvalue %5[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %45 = llvm.getelementptr %43[%44] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %46 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %47 = llvm.extractvalue %32[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %48 = llvm.getelementptr %46[%47] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %49 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%48, %45, %42, %49) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    scf.for %arg3 = %c0 to %c16384 step %c1 {
        %52 = builtin.unrealized_conversion_cast %arg4 : index to i64
        scf.for %arg5 = %c0 to %c16384 step %c1 {
          %53 = builtin.unrealized_conversion_cast %arg5 : index to i64
          %54 = llvm.extractvalue %3[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
          %55 = llvm.mlir.constant(16384 : index) : i64
          %56 = llvm.mul %51, %55  : i64
          %57 = llvm.add %56, %53  : i64
          %58 = llvm.getelementptr %54[%57] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
          %59 = llvm.load %58 : !llvm.ptr<f32>
          %60 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
          %61 = llvm.mlir.constant(16384 : index) : i64
          %62 = llvm.mul %53, %61  : i64
          %63 = llvm.add %62, %52  : i64
          %64 = llvm.getelementptr %60[%63] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
          %65 = llvm.load %64 : !llvm.ptr<f32>
          %66 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
          %67 = llvm.mlir.constant(16384 : index) : i64
          %68 = llvm.mul %51, %67  : i64
          %69 = llvm.add %68, %52  : i64
          %70 = llvm.getelementptr %66[%69] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
          %71 = llvm.load %70 : !llvm.ptr<f32>
          %72 = arith.mulf %59, %65 : f32
          %73 = arith.addf %72, %71 : f32
          %74 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
          %75 = llvm.mlir.constant(16384 : index) : i64
          %76 = llvm.mul %51, %75  : i64
          %77 = llvm.add %76, %52  : i64
          %78 = llvm.getelementptr %74[%77] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
          llvm.store %73, %78 : !llvm.ptr<f32>
        }
      }
    }
    %50 = bufferization.to_tensor %33 : memref<16384x16384xf32>
    return %50 : tensor<16384x16384xf32>
  }
}



