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

  func.func @main() {
    // Allocate memory for input vectors and output scalar
    %A = memref.alloc() : memref<4xf32>
    %B = memref.alloc() : memref<4xf32>
    %C = memref.alloc() : memref<f32>

    // Initialize the input vectors
    affine.for %i = 0 to 4 {
      %int_val = arith.index_cast %i : index to i32
      %float_val = arith.sitofp %int_val : i32 to f32
      memref.store %float_val, %A[%i] : memref<4xf32>
      memref.store %float_val, %B[%i] : memref<4xf32>
    }

    // Call the vecvec function
    call @vecvec(%A, %B, %C) : (memref<4xf32>, memref<4xf32>, memref<f32>) -> ()

    return
  }
}

