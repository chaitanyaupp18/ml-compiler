#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @main(%arg0: tensor<3x5xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense_resource<torch_tensor_2_torch.float32> : tensor<2xf32>
    %cst_1 = arith.constant dense_resource<torch_tensor_2_10_torch.float32> : tensor<2x10xf32>
    %cst_2 = arith.constant dense_resource<torch_tensor_10_5_torch.float32> : tensor<10x5xf32>
    %cst_3 = arith.constant dense_resource<torch_tensor_10_torch.float32> : tensor<10xf32>
    %0 = tensor.empty() : tensor<5x10xf32>
    %transposed = linalg.transpose ins(%cst_2 : tensor<10x5xf32>) outs(%0 : tensor<5x10xf32>) permutation = [1, 0] 
    %1 = tensor.empty() : tensor<3x10xf32>
    %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<3x10xf32>) -> tensor<3x10xf32>
    %3 = linalg.matmul ins(%arg0, %transposed : tensor<3x5xf32>, tensor<5x10xf32>) outs(%2 : tensor<3x10xf32>) -> tensor<3x10xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_3 : tensor<3x10xf32>, tensor<10xf32>) outs(%1 : tensor<3x10xf32>) {
    ^bb0(%in: f32, %in_5: f32, %out: f32):
      %11 = arith.addf %in, %in_5 : f32
      linalg.yield %11 : f32
    } -> tensor<3x10xf32>
    %5 = tensor.empty() : tensor<10x2xf32>
    %transposed_4 = linalg.transpose ins(%cst_1 : tensor<2x10xf32>) outs(%5 : tensor<10x2xf32>) permutation = [1, 0] 
    %6 = tensor.empty() : tensor<3x2xf32>
    %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<3x2xf32>) -> tensor<3x2xf32>
    %8 = linalg.matmul ins(%4, %transposed_4 : tensor<3x10xf32>, tensor<10x2xf32>) outs(%7 : tensor<3x2xf32>) -> tensor<3x2xf32>
    %9 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%8, %cst_0 : tensor<3x2xf32>, tensor<2xf32>) outs(%6 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %in_5: f32, %out: f32):
      %11 = arith.addf %in, %in_5 : f32
      linalg.yield %11 : f32
    } -> tensor<3x2xf32>
    %10 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%9 : tensor<3x2xf32>) outs(%6 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      %11 = arith.cmpf ugt, %in, %cst : f32
      %12 = arith.select %11, %in, %cst : f32
      linalg.yield %12 : f32
    } -> tensor<3x2xf32>
    return %10 : tensor<3x2xf32>
  }
}

{-#
  dialect_resources: {
    builtin: {
      torch_tensor_2_torch.float32: "0x04000000284D00BE0158CD3D",
      torch_tensor_2_10_torch.float32: "0x04000000643A8B3E3C6A1EBD17A8933D902D123EDECEA03EF2F2803E813684BECDC5683CD39286BE8FD9E73DFD54283C25AB1F3EDC618A3EB012D3BDA06A86BE4FE608BED317D93DBA7D6CBE836642BE107F04BE",
      torch_tensor_10_5_torch.float32: "0x04000000F18E9A3D90BF30BD09197FBE4F9F5F3E15B1BFBDC8D8B9BE092097BEB4C9CD3E30189F3D33A4FE3C8EF0633E8E53C5BE88D337BE4716C63E64F9D5BEB86149BD15ACFDBD959A3F3E1F49A6BEA6BDD6BDF0A8A93D33EE923E95A5DFBE3B6E4A3E5B58C5BE41E7A9BED7E8CCBE610AC73E10F713BE8465543DD7E6C3BD610FE93D28BB63BE1877BC3EDC3390BDA44DE23DB8AC90BEE55530BE83475DBE52C9C53E9FC5713E04F52F3EA89B173C2FD3DEBEE51CA4BED999E8BD2CE024BE94DAD03EA27873BEBB598E3E",
      torch_tensor_10_torch.float32: "0x04000000DC7BC83EA3A4893E23F3E0BDBF25C6BEE7B6B73E456B0E3E2B9142BE5AC2D03E8253C23E5ACE1CBE"
    }
  }
#-}
