; ModuleID = 'gemm'
source_filename = "gemm"

; Declare malloc to allocate memory
declare i8* @malloc(i64)

; Function declaration for GEMM
define void @gemm(float* %A, float* %B, float* %C) {
entry:
  ; Declare loop counters and initialize
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  store i64 0, i64* %i, align 8

  ; Outer loop over rows of A
  br label %loop_i

loop_i:                                          ; Loop label for "i"
  %i_val = load i64, i64* %i, align 8
  %cmp_i = icmp slt i64 %i_val, 16384
  br i1 %cmp_i, label %loop_j_init, label %end

loop_j_init:
  ; Initialize "j" loop variable
  store i64 0, i64* %j, align 8
  br label %loop_j

loop_j:                                          ; Loop label for "j"
  %j_val = load i64, i64* %j, align 8
  %cmp_j = icmp slt i64 %j_val, 16384
  br i1 %cmp_j, label %inner_k_init, label %increment_i

inner_k_init:
  ; Initialize "k" loop variable
  store i64 0, i64* %k, align 8
  br label %inner_k

inner_k:                                         ; Loop label for "k"
  %k_val = load i64, i64* %k, align 8
  %cmp_k = icmp slt i64 %k_val, 16384
  br i1 %cmp_k, label %compute, label %loop_j_increment

compute:
  ; Compute memory indices for A, B, and C
  %a_index = mul i64 %i_val, 16384
  %a_index_offset = add i64 %a_index, %k_val
  %a_ptr = getelementptr float, float* %A, i64 %a_index_offset

  %b_index = mul i64 %k_val, 16384
  %b_index_offset = add i64 %b_index, %j_val
  %b_ptr = getelementptr float, float* %B, i64 %b_index_offset

  %c_index = mul i64 %i_val, 16384
  %c_index_offset = add i64 %c_index, %j_val
  %c_ptr = getelementptr float, float* %C, i64 %c_index_offset

  ; Load values from A, B, and C
  %a_val = load float, float* %a_ptr, align 4
  %b_val = load float, float* %b_ptr, align 4
  %c_val = load float, float* %c_ptr, align 4

  ; Perform the computation: C[i][j] += A[i][k] * B[k][j]
  %prod = fmul float %a_val, %b_val
  %sum = fadd float %prod, %c_val
  store float %sum, float* %c_ptr, align 4
  br label %inner_k_increment

inner_k_increment:
  %k_val_next = add i64 %k_val, 1
  store i64 %k_val_next, i64* %k, align 8
  br label %inner_k

loop_j_increment:
  %j_val_next = add i64 %j_val, 1
  store i64 %j_val_next, i64* %j, align 8
  br label %loop_j

increment_i:
  %i_val_next = add i64 %i_val, 1
  store i64 %i_val_next, i64* %i, align 8
  br label %loop_i

end:
  ret void
}
