; ModuleID = '__compute_module___compute_module_wrapped_compare'
source_filename = "__compute_module___compute_module_wrapped_compare"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

define ptr @wrapped_compare(ptr %0) {
  %2 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !invariant.load !3
  %6 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 1, i32 0
  %7 = load ptr, ptr %6, align 8, !invariant.load !3
  %8 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 2, i32 0
  %9 = load ptr, ptr %8, align 8, !invariant.load !3
  %10 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %kernel_dim3, ptr %11, i32 0, i32 0
  %13 = load i64, ptr %12, align 4, !invariant.load !3
  %14 = call i64 @llvm.smax.i64(i64 %13, i64 0)
  %15 = call i64 @llvm.smin.i64(i64 %14, i64 1)
  br label %16

16:                                               ; preds = %19, %1
  %17 = phi i64 [ %20, %19 ], [ %15, %1 ]
  %18 = icmp slt i64 %17, 1
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  call void @wrapped_compare_impl(ptr %5, ptr %5, i64 0, ptr %7, ptr %7, i64 0, ptr %9, ptr %9, i64 0, i64 %17)
  %20 = add i64 %17, 1
  br label %16

21:                                               ; preds = %16
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @wrapped_compare_impl(ptr %0, ptr %1, i64 %2, ptr %3, ptr %4, i64 %5, ptr %6, ptr %7, i64 %8, i64 %9) #0 {
  %11 = alloca i32, i64 1, align 4
  %12 = getelementptr i32, ptr %1, i64 %2
  call void @llvm.memcpy.p0.p0.i64(ptr %11, ptr %12, i64 4, i1 false)
  %13 = load i32, ptr %11, align 4
  %14 = alloca i32, i64 1, align 4
  %15 = getelementptr i32, ptr %4, i64 %5
  call void @llvm.memcpy.p0.p0.i64(ptr %14, ptr %15, i64 4, i1 false)
  %16 = load i32, ptr %14, align 4
  %17 = icmp slt i32 %13, %16
  %18 = zext i1 %17 to i8
  %19 = alloca i8, i64 1, align 64
  store i8 %18, ptr %19, align 1
  %20 = getelementptr i8, ptr %7, i64 %8
  call void @llvm.memcpy.p0.p0.i64(ptr %20, ptr %19, i64 1, i1 false)
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

attributes #0 = { alwaysinline }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 9}
!2 = !{!"xla_cpu_emitter__tiled_emitter__hlo_opcode__fusion"}
!3 = !{}
