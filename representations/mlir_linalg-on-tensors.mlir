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
      torch_tensor_2_torch.float32: "0x04000000FDE1E5BD3980013E",
      torch_tensor_2_10_torch.float32: "0x040000008558D43DB7F44FBE67A0713DFF4B823EA68953BD2DD48E3E77A6813E6E8A0C3EDCFC45BEE043A8BD05AA123E805B903E468518BBA861893EAB76843E3FA86DBDF76A95BE52354F3E8A55313D17D16F3C",
      torch_tensor_10_5_torch.float32: "0x040000007F68313D294492BD5597E8BD01F0C9BED01BD73E035FCFBE7432AA3D1F46B4BDCBC807BD841CDABED6BBCBBADA0E16BE7DF28DBEC4D3ADBEA4E41A3CCB8C22BE0F427A3E16F6143E3524AD3D359E1BBE342D70BE0A3B94BE34E2733EF7DE4FBE4939B43EE13131BD109662BD928419BEC7D2E1BEC76ECABD118BC4BE3281B83E2048DCBD179D78BE3412153E6B463C3EA5279E3E65C33A3EEB4D613EAF5E993E373BD33E162C6A3CB2CBB6BE22FEA6BE647A43BEBA14D3BE20B6A6BD4DA391BD4D0E05BD0F91CF3E",
      torch_tensor_10_torch.float32: "0x040000002018A63E61219F3EFC92143EE974D1BACD54C53BA48AD0BE11EB98BDBC45DF3E639F813D7D987D3D"
    }
  }
#-}
