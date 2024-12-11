module {
  func.func @main(%arg0: vector<10xf32>, %arg1: vector<10xf32>) -> vector<10xf32> {
    %result = arith.mulf %arg0, %arg1 : vector<10xf32>
    return %result : vector<10xf32>
  }
}
