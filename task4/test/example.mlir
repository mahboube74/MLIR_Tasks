func @vecvec_example(%vec1: vector<4xf32>, %vec2: vector<4xf32>) -> f32 {
  %result = "vec.myop"(%vec1, %vec2) : (vector<4xf32>, vector<4xf32>) -> f32
  return %result : f32
}

