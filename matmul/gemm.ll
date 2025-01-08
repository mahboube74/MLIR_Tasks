; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @gemm(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20) {
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, ptr %1, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %2, 2
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %3, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %5, 4, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %4, 3, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 %6, 4, 1
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %7, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, ptr %8, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 %9, 2
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 %10, 3, 0
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 %12, 4, 0
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 %11, 3, 1
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, i64 %13, 4, 1
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %14, 0
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, ptr %15, 1
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 %16, 2
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 %17, 3, 0
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 %19, 4, 0
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 %18, 3, 1
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 %20, 4, 1
  br label %43

43:                                               ; preds = %75, %21
  %44 = phi i64 [ %76, %75 ], [ 0, %21 ]
  %45 = icmp slt i64 %44, 2
  br i1 %45, label %46, label %77

46:                                               ; preds = %43
  br label %47

47:                                               ; preds = %73, %46
  %48 = phi i64 [ %74, %73 ], [ 0, %46 ]
  %49 = icmp slt i64 %48, 2
  br i1 %49, label %50, label %75

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %54, %50
  %52 = phi i64 [ %72, %54 ], [ 0, %50 ]
  %53 = icmp slt i64 %52, 2
  br i1 %53, label %54, label %73

54:                                               ; preds = %51
  %55 = mul i64 %44, 2
  %56 = add i64 %55, %52
  %57 = getelementptr float, ptr %1, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = mul i64 %52, 2
  %60 = add i64 %59, %48
  %61 = getelementptr float, ptr %8, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = mul i64 %44, 2
  %64 = add i64 %63, %48
  %65 = getelementptr float, ptr %15, i64 %64
  %66 = load float, ptr %65, align 4
  %67 = fmul float %58, %62
  %68 = fadd float %66, %67
  %69 = mul i64 %44, 2
  %70 = add i64 %69, %48
  %71 = getelementptr float, ptr %15, i64 %70
  store float %68, ptr %71, align 4
  %72 = add i64 %52, 1
  br label %51

73:                                               ; preds = %51
  %74 = add i64 %48, 1
  br label %47

75:                                               ; preds = %47
  %76 = add i64 %44, 1
  br label %43

77:                                               ; preds = %43
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
