#mapA = affine_map<(d0, d1, d2) -> (d0, d2)>
#mapB = affine_map<(d0, d1, d2) -> (d2, d1)>
#mapC = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @gemm(%A: tensor<2x2xf32>, %B: tensor<2x2xf32>, %C: tensor<2x2xf32>) -> tensor<2x2xf32> attributes {llvm.emit_c_interface} {
    %D = linalg.generic
      { indexing_maps = [#mapA, #mapB, #mapC],
        iterator_types = ["parallel", "parallel", "reduction"] }
      ins(%A, %B : tensor<2x2xf32>, tensor<2x2xf32>)
      outs(%C : tensor<2x2xf32>) {
        ^bb0(%a: f32, %b: f32, %c: f32):
          %1 = arith.mulf %a, %b : f32
          %2 = arith.addf %1, %c : f32
          linalg.yield %2 : f32
      } -> tensor<2x2xf32>
    return %D : tensor<2x2xf32>
  }
}
