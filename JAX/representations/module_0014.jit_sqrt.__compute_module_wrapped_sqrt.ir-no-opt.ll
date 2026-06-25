; ModuleID = '__compute_module___compute_module_wrapped_sqrt'
source_filename = "__compute_module___compute_module_wrapped_sqrt"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

define ptr @wrapped_sqrt(ptr %0) {
  %2 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !invariant.load !3
  %6 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 1, i32 0
  %7 = load ptr, ptr %6, align 8, !invariant.load !3
  %8 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %kernel_dim3, ptr %9, i32 0, i32 0
  %11 = load i64, ptr %10, align 4, !invariant.load !3
  %12 = call i64 @llvm.smax.i64(i64 %11, i64 0)
  %13 = call i64 @llvm.smin.i64(i64 %12, i64 1)
  br label %14

14:                                               ; preds = %17, %1
  %15 = phi i64 [ %18, %17 ], [ %13, %1 ]
  %16 = icmp slt i64 %15, 1
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  call void @wrapped_sqrt_impl(ptr %5, ptr %5, i64 0, ptr %7, ptr %7, i64 0, i64 %15)
  %18 = add i64 %15, 1
  br label %14

19:                                               ; preds = %14
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @wrapped_sqrt_impl(ptr %0, ptr %1, i64 %2, ptr %3, ptr %4, i64 %5, i64 %6) #0 {
  %8 = alloca float, i64 1, align 4
  %9 = getelementptr float, ptr %1, i64 %2
  call void @llvm.memcpy.p0.p0.i64(ptr %8, ptr %9, i64 4, i1 false)
  %10 = load float, ptr %8, align 4
  %11 = call float @llvm.sqrt.f32(float %10)
  %12 = alloca float, i64 1, align 64
  store float %11, ptr %12, align 4
  %13 = getelementptr float, ptr %4, i64 %5
  call void @llvm.memcpy.p0.p0.i64(ptr %13, ptr %12, i64 4, i1 false)
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { alwaysinline }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__tiled_emitter__hlo_opcode__fusion"}
!3 = !{}
