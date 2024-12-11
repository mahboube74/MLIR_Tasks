; ModuleID = 'lowered_output.mlir'
source_filename = "lowered_output.mlir"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define <10 x float> @main(<10 x float> %arg0, <10 x float> %arg1) {
entry:
  %result = fmul <10 x float> %arg0, %arg1
  ret <10 x float> %result
}
