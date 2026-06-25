#loc1 = loc("args[0]")
module @jit_stage attributes {mhlo.num_partitions = 1 : i32, mhlo.num_replicas = 1 : i32} {
  func.func public @main(%arg0: tensor<3x5xf32> loc("args[0]")) -> (tensor<3x5xf32> {jax.result_info = "result"}) {
    return %arg0 : tensor<3x5xf32> loc(#loc7)
  } loc(#loc)
} loc(#loc)
#loc = loc(unknown)
#loc2 = loc("/Users/chaitanya/Downloads/MLIR/end2end/ml-compiler/JAX/model.py":18:18 to :68)
#loc3 = loc("/Users/chaitanya/Downloads/MLIR/end2end/ml-compiler/JAX/model.py":70:4 to :10)
#loc4 = loc("main"(#loc2))
#loc5 = loc("<module>"(#loc3))
#loc6 = loc(callsite(#loc4 at #loc5))
#loc7 = loc("jit(stage)"(#loc6))
