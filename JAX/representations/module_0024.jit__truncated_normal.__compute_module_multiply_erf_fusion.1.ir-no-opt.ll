; ModuleID = '__compute_module___compute_module_multiply_erf_fusion.1'
source_filename = "__compute_module___compute_module_multiply_erf_fusion.1"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

define ptr @multiply_erf_fusion.1(ptr %0) {
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
  call void @multiply_erf_fusion.1_impl(ptr %5, ptr %5, i64 0, ptr %7, ptr %7, i64 0, i64 %15)
  %18 = add i64 %15, 1
  br label %14

19:                                               ; preds = %14
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @multiply_erf_fusion.1_impl(ptr %0, ptr %1, i64 %2, ptr %3, ptr %4, i64 %5, i64 %6) #0 {
  %8 = alloca i32, i64 1, align 4
  %9 = getelementptr i32, ptr %1, i64 %2
  call void @llvm.memcpy.p0.p0.i64(ptr %8, ptr %9, i64 4, i1 false)
  %10 = load i32, ptr %8, align 4
  %11 = sitofp i32 %10 to float
  %12 = fmul float %11, f0x3F3504F3
  %13 = call float @llvm.fabs.f32(float %12)
  %14 = fcmp oge float %13, f0x406F9C68
  %15 = call float @llvm.copysign.f32(float 1.000000e+00, float %12)
  %16 = call float @llvm.maximum.f32(float %12, float f0xC06F9C68)
  %17 = call float @llvm.minimum.f32(float %16, float f0x406F9C68)
  %18 = fmul float %17, %17
  %19 = call float @llvm.fma.f32(float f0x39702D51, float %18, float f0x3B5F5DA2)
  %20 = call float @llvm.fma.f32(float %19, float %18, float f0x3D50B6EB)
  %21 = call float @llvm.fma.f32(float %20, float %18, float f0x3E3DA740)
  %22 = call float @llvm.fma.f32(float %21, float %18, float f0x3F906EBA)
  %23 = fmul float %17, %22
  %24 = call float @llvm.fma.f32(float f0xB3FD3906, float %18, float f0x37C588DF)
  %25 = call float @llvm.fma.f32(float %24, float %18, float f0x3A856D28)
  %26 = call float @llvm.fma.f32(float %25, float %18, float f0x3C6687D4)
  %27 = call float @llvm.fma.f32(float %26, float %18, float f0x3DE34C21)
  %28 = call float @llvm.fma.f32(float %27, float %18, float f0x3EFEB44A)
  %29 = call float @llvm.fma.f32(float %28, float %18, float 1.000000e+00)
  %30 = fdiv float %23, %29
  %31 = select i1 %14, float %15, float %30
  %32 = alloca float, i64 1, align 64
  store float %31, ptr %32, align 4
  %33 = getelementptr float, ptr %4, i64 %5
  call void @llvm.memcpy.p0.p0.i64(ptr %33, ptr %32, i64 4, i1 false)
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #1

attributes #0 = { alwaysinline }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 5}
!2 = !{!"xla_cpu_emitter__tiled_emitter__hlo_opcode__fusion"}
!3 = !{}
