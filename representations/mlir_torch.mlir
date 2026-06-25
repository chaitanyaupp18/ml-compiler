module {
  func.func @main(%arg0: !torch.vtensor<[3,5],f32>) -> !torch.vtensor<[3,2],f32> {
    %0 = torch.vtensor.literal(dense_resource<torch_tensor_2_torch.float32> : tensor<2xf32>) : !torch.vtensor<[2],f32>
    %1 = torch.vtensor.literal(dense_resource<torch_tensor_2_10_torch.float32> : tensor<2x10xf32>) : !torch.vtensor<[2,10],f32>
    %2 = torch.vtensor.literal(dense_resource<torch_tensor_10_5_torch.float32> : tensor<10x5xf32>) : !torch.vtensor<[10,5],f32>
    %3 = torch.vtensor.literal(dense_resource<torch_tensor_10_torch.float32> : tensor<10xf32>) : !torch.vtensor<[10],f32>
    %int0 = torch.constant.int 0
    %int1 = torch.constant.int 1
    %4 = torch.aten.transpose.int %2, %int0, %int1 : !torch.vtensor<[10,5],f32>, !torch.int, !torch.int -> !torch.vtensor<[5,10],f32>
    %5 = torch.aten.mm %arg0, %4 : !torch.vtensor<[3,5],f32>, !torch.vtensor<[5,10],f32> -> !torch.vtensor<[3,10],f32>
    %6 = torch.aten.add.Tensor %5, %3, %int1 : !torch.vtensor<[3,10],f32>, !torch.vtensor<[10],f32>, !torch.int -> !torch.vtensor<[3,10],f32>
    %7 = torch.aten.transpose.int %1, %int0, %int1 : !torch.vtensor<[2,10],f32>, !torch.int, !torch.int -> !torch.vtensor<[10,2],f32>
    %8 = torch.aten.mm %6, %7 : !torch.vtensor<[3,10],f32>, !torch.vtensor<[10,2],f32> -> !torch.vtensor<[3,2],f32>
    %9 = torch.aten.add.Tensor %8, %0, %int1 : !torch.vtensor<[3,2],f32>, !torch.vtensor<[2],f32>, !torch.int -> !torch.vtensor<[3,2],f32>
    %10 = torch.aten.relu %9 : !torch.vtensor<[3,2],f32> -> !torch.vtensor<[3,2],f32>
    return %10 : !torch.vtensor<[3,2],f32>
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
