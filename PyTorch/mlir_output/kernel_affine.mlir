module {
  memref.global "private" constant @__constant_10xf32 : memref<10xf32> = dense<[0.324402809, 0.310801536, 0.145091951, -0.00159802765, 0.00602207193, -0.407307744, -7.466710e-02, 0.436078906, 0.0632922873, 0.0619130022]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_10x5xf32 : memref<10x5xf32> = dense<[[0.0433125459, -0.0714190677, -0.113569893, -0.394409209, 0.420134068], [-0.405021757, 0.0831040441, -0.0880243703, -0.0331504755, -0.425998807], [-0.00155436504, -0.146541029, -0.277240664, -0.339506269, 0.00945392623], [-0.158740208, 0.244392619, 1.454700e-01, 0.0845417156, -0.151970699], [-0.234547436, -0.289512932, 0.238167584, -0.202998981, 0.351999551], [-0.0432604589, -0.055318892, -0.149919778, -0.441061229, -9.884410e-02], [-0.383873492, 0.360360682, -0.107559443, -0.24278675, 0.145577252], [0.183862373, 0.308896214, 1.823860e-01, 0.220023796, 0.299550503], [0.412561148, 0.0142927375, -0.357022822, -0.326157629, -0.190896571], [-0.412267506, -0.0814020633, -0.0711122528, -0.0324843414, 0.405403584]]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_2x10xf32 : memref<2x10xf32> = dense<[[0.103684463, -0.203081951, 0.0589908622, 0.254486054, -0.0516449437, 0.278962523, 0.253223151, 0.137246817, -0.193347394, -0.0821607112], [0.143226698, 0.28194809, -0.00232727965, 0.268323183, 0.258717865, -0.0580217801, -0.291831702, 0.202351838, 0.043294467, 0.0146372532]]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_2xf32 : memref<2xf32> = dense<[-0.112247445, 0.126465693]> {alignment = 64 : i64}
  func.func @main(%arg0: memref<3x5xf32>, %arg1: memref<3x2xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_2xf32 : memref<2xf32>
    %1 = memref.get_global @__constant_2x10xf32 : memref<2x10xf32>
    %2 = memref.get_global @__constant_10x5xf32 : memref<10x5xf32>
    %3 = memref.get_global @__constant_10xf32 : memref<10xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<5x10xf32>
    affine.for %arg2 = 0 to 5 {
      affine.for %arg3 = 0 to 10 {
        %4 = affine.load %2[%arg3, %arg2] : memref<10x5xf32>
        affine.store %4, %alloc[%arg2, %arg3] : memref<5x10xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<3x10xf32>
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 10 {
        affine.store %cst, %alloc_0[%arg2, %arg3] : memref<3x10xf32>
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 5 {
          %4 = affine.load %arg0[%arg2, %arg4] : memref<3x5xf32>
          %5 = affine.load %alloc[%arg4, %arg3] : memref<5x10xf32>
          %6 = affine.load %alloc_0[%arg2, %arg3] : memref<3x10xf32>
          %7 = arith.mulf %4, %5 : f32
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %alloc_0[%arg2, %arg3] : memref<3x10xf32>
        }
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 10 {
        %4 = affine.load %alloc_0[%arg2, %arg3] : memref<3x10xf32>
        %5 = affine.load %3[%arg3] : memref<10xf32>
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %alloc_0[%arg2, %arg3] : memref<3x10xf32>
      }
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<10x2xf32>
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 2 {
        %4 = affine.load %1[%arg3, %arg2] : memref<2x10xf32>
        affine.store %4, %alloc_1[%arg2, %arg3] : memref<10x2xf32>
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 2 {
        affine.store %cst, %arg1[%arg2, %arg3] : memref<3x2xf32>
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 2 {
        affine.for %arg4 = 0 to 10 {
          %4 = affine.load %alloc_0[%arg2, %arg4] : memref<3x10xf32>
          %5 = affine.load %alloc_1[%arg4, %arg3] : memref<10x2xf32>
          %6 = affine.load %arg1[%arg2, %arg3] : memref<3x2xf32>
          %7 = arith.mulf %4, %5 : f32
          %8 = arith.addf %6, %7 : f32
          affine.store %8, %arg1[%arg2, %arg3] : memref<3x2xf32>
        }
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 2 {
        %4 = affine.load %arg1[%arg2, %arg3] : memref<3x2xf32>
        %5 = affine.load %0[%arg3] : memref<2xf32>
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %arg1[%arg2, %arg3] : memref<3x2xf32>
      }
    }
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 2 {
        %4 = affine.load %arg1[%arg2, %arg3] : memref<3x2xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        affine.store %6, %arg1[%arg2, %arg3] : memref<3x2xf32>
      }
    }
    return
  }
}

