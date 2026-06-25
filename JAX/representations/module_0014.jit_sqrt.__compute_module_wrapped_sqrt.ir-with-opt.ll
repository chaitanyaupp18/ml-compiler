; ModuleID = '__compute_module___compute_module_wrapped_sqrt'
source_filename = "__compute_module___compute_module_wrapped_sqrt"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none)
define noalias noundef ptr @wrapped_sqrt(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr %3, align 4, !invariant.load !3
  %5 = icmp slt i64 %4, 1
  br i1 %5, label %.lr.ph, label %13

.lr.ph:                                           ; preds = %1
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %7 = load ptr, ptr %6, align 8, !invariant.load !3
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  %9 = load ptr, ptr %8, align 8, !invariant.load !3
  %10 = load ptr, ptr %7, align 8, !invariant.load !3
  %11 = load float, ptr %10, align 1
  %12 = tail call float @llvm.sqrt.f32(float %11)
  store float %12, ptr %9, align 1
  br label %13

13:                                               ; preds = %.lr.ph, %1
  ret ptr null
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none) }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__tiled_emitter__hlo_opcode__fusion"}
!3 = !{}
