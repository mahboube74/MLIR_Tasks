module {
  func.func @vecvec(%A: memref<4xf32>, %B: memref<4xf32>, %C: memref<f32>) {
    linalg.generic {
      indexing_maps = [
        affine_map<(d0) -> (d0)>, // A[i]
        affine_map<(d0) -> (d0)>, // B[i]
        affine_map<(d0) -> ()>    // C (scalar, reduced over d0)
      ],
      iterator_types = ["reduction"] // Single reduction loop
    } ins(%A, %B : memref<4xf32>, memref<4xf32>)
      outs(%C : memref<f32>) {
        ^bb0(%a: f32, %b: f32, %c: f32):
          %prod = arith.mulf %a, %b : f32
          %sum = arith.addf %c, %prod : f32
          linalg.yield %sum : f32
      }
    return
  }
}
