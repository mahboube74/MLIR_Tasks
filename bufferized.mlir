#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @gemm(%arg0: tensor<16384x16384xf32>, %arg1: tensor<16384x16384xf32>, %arg2: tensor<16384x16384xf32>) -> tensor<16384x16384xf32> attributes {llvm.emit_c_interface} {
    %0 = bufferization.to_memref %arg1 : memref<16384x16384xf32>
    %1 = bufferization.to_memref %arg0 : memref<16384x16384xf32>
    %2 = bufferization.to_memref %arg2 : memref<16384x16384xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16384x16384xf32>
    memref.copy %2, %alloc : memref<16384x16384xf32> to memref<16384x16384xf32>
    %3 = bufferization.to_tensor %alloc : memref<16384x16384xf32>
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%1, %0 : memref<16384x16384xf32>, memref<16384x16384xf32>) outs(%alloc : memref<16384x16384xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %5 = arith.mulf %in, %in_0 : f32
      %6 = arith.addf %5, %out : f32
      linalg.yield %6 : f32
    }
    %4 = bufferization.to_tensor %alloc : memref<16384x16384xf32>
    return %4 : tensor<16384x16384xf32>
  }
}
