#mapA = affine_map<(d0, d1, d2) -> (d0, d2)>
#mapB = affine_map<(d0, d1, d2) -> (d2, d1)>
#mapC = affine_map<(d0, d1, d2) -> (d0, d1)>

module {
  func.func @gemm(%A: memref<2x2xf32>, %B: memref<2x2xf32>, %C: memref<2x2xf32>) {
    linalg.generic {
      indexing_maps = [
        #mapA, // A[i, k]
        #mapB, // B[k, j]
        #mapC  // C[i, j]
      ],
      iterator_types = ["parallel", "parallel", "reduction"] // Two parallel loops and one reduction
    } ins(%A, %B : memref<2x2xf32>, memref<2x2xf32>)
      outs(%C : memref<2x2xf32>) {
        ^bb0(%a: f32, %b: f32, %c: f32):
          %prod = arith.mulf %a, %b : f32
          %sum = arith.addf %c, %prod : f32
          linalg.yield %sum : f32
      }
    return
  }
}

