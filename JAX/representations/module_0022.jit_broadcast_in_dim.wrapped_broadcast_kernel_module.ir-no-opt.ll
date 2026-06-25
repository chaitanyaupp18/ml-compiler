; ModuleID = '__compute_module_wrapped_broadcast_kernel_module'
source_filename = "__compute_module_wrapped_broadcast_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

; Function Attrs: uwtable
define ptr @wrapped_broadcast(ptr %0) #0 {
  %2 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !invariant.load !3, !dereferenceable !4
  %6 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 1, i32 0
  %7 = load ptr, ptr %6, align 8, !invariant.load !3, !dereferenceable !5
  %8 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 0
  %11 = load i64, ptr %10, align 4, !invariant.load !3
  %12 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 1
  %13 = load i64, ptr %12, align 4, !invariant.load !3
  %14 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 2
  %15 = load i64, ptr %14, align 4, !invariant.load !3
  call void @wrapped_broadcast_wrapped(ptr %5, ptr %7, i64 %11, i64 %13, i64 %15)
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @wrapped_broadcast_wrapped(ptr noalias align 64 dereferenceable(4) %0, ptr noalias align 64 dereferenceable(40) %1, i64 %2, i64 %3, i64 %4) #1 {
  %6 = getelementptr inbounds [1 x float], ptr %0, i32 0, i32 0
  %7 = load float, ptr %6, align 4, !invariant.load !3
  br label %8

8:                                                ; preds = %11, %5
  %9 = phi i64 [ %13, %11 ], [ 0, %5 ]
  %10 = icmp slt i64 %9, 10
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = getelementptr inbounds [10 x float], ptr %1, i32 0, i64 %9
  store float %7, ptr %12, align 4
  %13 = add i64 %9, 1
  br label %8

14:                                               ; preds = %8
  ret void
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 4}
!5 = !{i64 40}
