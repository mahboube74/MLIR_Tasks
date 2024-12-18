; ModuleID = 'vecvec_example'
source_filename = "vecvec_example"

define float @vecvec_example(float* %arg0, float* %arg1, float* %init) {
entry:
  %result = alloca float
  store float 0.0, float* %result
  %0 = load float, float* %arg0
  %1 = load float, float* %arg1
  %prod = fmul float %0, %1
  store float %prod, float* %result
  %res = load float, float* %result
  ret float %res
}
