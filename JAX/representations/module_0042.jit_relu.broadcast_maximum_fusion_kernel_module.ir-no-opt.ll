; ModuleID = '__compute_module_broadcast_maximum_fusion_kernel_module'
source_filename = "__compute_module_broadcast_maximum_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

; Function Attrs: uwtable
define ptr @broadcast_maximum_fusion(ptr %0) #0 {
  %2 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !invariant.load !3, !dereferenceable !4
  %6 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 1, i32 0
  %7 = load ptr, ptr %6, align 8, !invariant.load !3, !dereferenceable !4
  %8 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 0
  %11 = load i64, ptr %10, align 4, !invariant.load !3
  %12 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 1
  %13 = load i64, ptr %12, align 4, !invariant.load !3
  %14 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 2
  %15 = load i64, ptr %14, align 4, !invariant.load !3
  call void @broadcast_maximum_fusion_wrapped(ptr %5, ptr %7, i64 %11, i64 %13, i64 %15)
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @broadcast_maximum_fusion_wrapped(ptr noalias align 64 dereferenceable(24) %0, ptr noalias align 64 dereferenceable(24) %1, i64 %2, i64 %3, i64 %4) #1 {
  br label %6

6:                                                ; preds = %21, %5
  %7 = phi i64 [ %22, %21 ], [ 0, %5 ]
  %8 = icmp slt i64 %7, 3
  br i1 %8, label %9, label %23

9:                                                ; preds = %6
  %10 = mul nsw i64 %7, 2
  br label %11

11:                                               ; preds = %14, %9
  %12 = phi i64 [ %20, %14 ], [ 0, %9 ]
  %13 = icmp slt i64 %12, 2
  br i1 %13, label %14, label %21

14:                                               ; preds = %11
  %15 = add nsw i64 %10, %12
  %16 = getelementptr inbounds [6 x float], ptr %0, i32 0, i64 %15
  %17 = load float, ptr %16, align 4, !invariant.load !3
  %18 = call float @llvm.maximum.f32(float %17, float 0.000000e+00)
  %19 = getelementptr inbounds [6 x float], ptr %1, i32 0, i64 %15
  store float %18, ptr %19, align 4
  %20 = add i64 %12, 1
  br label %11

21:                                               ; preds = %11
  %22 = add i64 %7, 1
  br label %6, !llvm.loop !5

23:                                               ; preds = %6
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #2

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 24}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
