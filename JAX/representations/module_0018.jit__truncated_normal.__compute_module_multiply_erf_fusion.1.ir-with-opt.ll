; ModuleID = '__compute_module___compute_module_multiply_erf_fusion.1'
source_filename = "__compute_module___compute_module_multiply_erf_fusion.1"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none)
define noalias noundef ptr @multiply_erf_fusion.1(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr %3, align 4, !invariant.load !3
  %5 = icmp slt i64 %4, 1
  br i1 %5, label %.lr.ph, label %33

.lr.ph:                                           ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %7 = load ptr, ptr %6, align 8, !invariant.load !3
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  %9 = load ptr, ptr %8, align 8, !invariant.load !3
  %10 = load ptr, ptr %7, align 8, !invariant.load !3
  %11 = load i32, ptr %10, align 1
  %12 = sitofp i32 %11 to float
  %13 = fmul nnan float %12, f0x3F3504F3
  %14 = tail call float @llvm.fabs.f32(float %13)
  %15 = fcmp oge float %14, f0x406F9C68
  %16 = tail call float @llvm.copysign.f32(float 1.000000e+00, float %13)
  %17 = tail call float @llvm.maximum.f32(float %13, float f0xC06F9C68)
  %18 = tail call float @llvm.minimum.f32(float %17, float f0x406F9C68)
  %19 = fmul nnan float %18, %18
  %20 = tail call nnan float @llvm.fma.f32(float %19, float f0x39702D51, float f0x3B5F5DA2)
  %21 = tail call float @llvm.fma.f32(float %20, float %19, float f0x3D50B6EB)
  %22 = tail call float @llvm.fma.f32(float %21, float %19, float f0x3E3DA740)
  %23 = tail call float @llvm.fma.f32(float %22, float %19, float f0x3F906EBA)
  %24 = fmul float %18, %23
  %25 = tail call float @llvm.fma.f32(float %19, float f0xB3FD3906, float f0x37C588DF)
  %26 = tail call float @llvm.fma.f32(float %25, float %19, float f0x3A856D28)
  %27 = tail call float @llvm.fma.f32(float %26, float %19, float f0x3C6687D4)
  %28 = tail call float @llvm.fma.f32(float %27, float %19, float f0x3DE34C21)
  %29 = tail call float @llvm.fma.f32(float %28, float %19, float f0x3EFEB44A)
  %30 = tail call float @llvm.fma.f32(float %29, float %19, float 1.000000e+00)
  %31 = fdiv float %24, %30
  %32 = select i1 %15, float %16, float %31
  store float %32, ptr %9, align 1
  br label %33

33:                                               ; preds = %.lr.ph, %1
  ret ptr null
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 5}
!2 = !{!"xla_cpu_emitter__tiled_emitter__hlo_opcode__fusion"}
!3 = !{}
