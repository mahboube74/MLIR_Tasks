; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @vecvec(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, ptr %10, ptr %11, i64 %12) {
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %1, 1
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 %2, 2
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 %3, 3, 0
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 %4, 4, 0
  %19 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %5, 0
  %20 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, ptr %6, 1
  %21 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, i64 %7, 2
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, i64 %8, 3, 0
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, i64 %9, 4, 0
  %24 = insertvalue { ptr, ptr, i64 } undef, ptr %10, 0
  %25 = insertvalue { ptr, ptr, i64 } %24, ptr %11, 1
  %26 = insertvalue { ptr, ptr, i64 } %25, i64 %12, 2
  br label %27

27:                                               ; preds = %30, %13
  %28 = phi i64 [ %38, %30 ], [ 0, %13 ]
  %29 = icmp slt i64 %28, 4
  br i1 %29, label %30, label %39

30:                                               ; preds = %27
  %31 = getelementptr float, ptr %1, i64 %28
  %32 = load float, ptr %31, align 4
  %33 = getelementptr float, ptr %6, i64 %28
  %34 = load float, ptr %33, align 4
  %35 = load float, ptr %11, align 4
  %36 = fmul float %32, %34
  %37 = fadd float %35, %36
  store float %37, ptr %11, align 4
  %38 = add i64 %28, 1
  br label %27

39:                                               ; preds = %27
  ret void
}

define void @main() {
  %1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 4) to i64))
  %2 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 4, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 1, 4, 0
  %7 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 4) to i64))
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %7, 0
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, ptr %7, 1
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 0, 2
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 4, 3, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 1, 4, 0
  %13 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64))
  %14 = insertvalue { ptr, ptr, i64 } undef, ptr %13, 0
  %15 = insertvalue { ptr, ptr, i64 } %14, ptr %13, 1
  %16 = insertvalue { ptr, ptr, i64 } %15, i64 0, 2
  br label %17

17:                                               ; preds = %20, %0
  %18 = phi i64 [ %25, %20 ], [ 0, %0 ]
  %19 = icmp slt i64 %18, 4
  br i1 %19, label %20, label %26

20:                                               ; preds = %17
  %21 = trunc i64 %18 to i32
  %22 = sitofp i32 %21 to float
  %23 = getelementptr float, ptr %1, i64 %18
  store float %22, ptr %23, align 4
  %24 = getelementptr float, ptr %7, i64 %18
  store float %22, ptr %24, align 4
  %25 = add i64 %18, 1
  br label %17

26:                                               ; preds = %17
  %27 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 0
  %28 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 1
  %29 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 2
  %30 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 3, 0
  %31 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 4, 0
  %32 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 0
  %33 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 1
  %34 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 2
  %35 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 3, 0
  %36 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, 4, 0
  %37 = extractvalue { ptr, ptr, i64 } %16, 0
  %38 = extractvalue { ptr, ptr, i64 } %16, 1
  %39 = extractvalue { ptr, ptr, i64 } %16, 2
  call void @vecvec(ptr %27, ptr %28, i64 %29, i64 %30, i64 %31, ptr %32, ptr %33, i64 %34, i64 %35, i64 %36, ptr %37, ptr %38, i64 %39)
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
