#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @main(%arg0: tensor<3x5xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[-0.11224744468927383, 0.12646569311618805]> : tensor<2xf32>
    %cst_1 = arith.constant dense<[[0.10368446260690689, -0.20308195054531097, 0.05899086222052574, 0.2544860541820526, -0.0516449436545372, 0.27896252274513245, 0.25322315096855164, 0.13724681735038757, -0.19334739446640015, -0.08216071128845215], [0.14322669804096222, 0.2819480895996094, -0.0023272796534001827, 0.2683231830596924, 0.2587178647518158, -0.05802178010344505, -0.29183170199394226, 0.20235183835029602, 0.04329446703195572, 0.014637253247201443]]> : tensor<2x10xf32>
    %cst_2 = arith.constant dense<[[0.043312545865774155, -0.07141906768083572, -0.11356989294290543, -0.3944092094898224, 0.4201340675354004], [-0.4050217568874359, 0.08310404419898987, -0.08802437037229538, -0.03315047547221184, -0.4259988069534302], [-0.00155436503700912, -0.146541029214859, -0.27724066376686096, -0.33950626850128174, 0.009453926235437393], [-0.15874020755290985, 0.24439261853694916, 0.14546999335289001, 0.08454171568155289, -0.15197069942951202], [-0.2345474362373352, -0.2895129323005676, 0.23816758394241333, -0.20299898087978363, 0.35199955105781555], [-0.04326045885682106, -0.05531889200210571, -0.1499197781085968, -0.44106122851371765, -0.09884410351514816], [-0.38387349247932434, 0.36036068201065063, -0.1075594425201416, -0.24278675019741058, 0.14557725191116333], [0.1838623732328415, 0.3088962137699127, 0.18238599598407745, 0.22002379596233368, 0.29955050349235535], [0.4125611484050751, 0.01429273746907711, -0.35702282190322876, -0.3261576294898987, -0.19089657068252563], [-0.4122675061225891, -0.08140206336975098, -0.0711122527718544, -0.03248434141278267, 0.40540358424186707]]> : tensor<10x5xf32>
    %cst_3 = arith.constant dense<[0.3244028091430664, 0.31080153584480286, 0.1450919508934021, -0.0015980276511982083, 0.006022071931511164, -0.4073077440261841, -0.07466710358858109, 0.43607890605926514, 0.06329228729009628, 0.06191300228238106]> : tensor<10xf32>
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

