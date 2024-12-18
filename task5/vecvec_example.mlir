func.func @vecvec_example(%arg0: tensor<4xf32>, %arg1: tensor<4xf32>, %init: tensor<f32>) -> tensor<f32> {
  %result = linalg.vecvec
    ins(%arg0, %arg1) outs(%init)
    {
      ^bb0(%in1: f32, %in2: f32):
        %prod = arith.mulf %in1, %in2 : f32
        linalg.yield %prod : f32
    } : tensor<4xf32>, tensor<4xf32> -> tensor<f32>
  return %result : tensor<f32>
}