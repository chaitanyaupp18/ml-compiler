; ModuleID = '__compute_module_broadcast_maximum_fusion_kernel_module'
source_filename = "__compute_module_broadcast_maximum_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader
  %5 = phi i64 [ 0, %1 ], [ %12, %.preheader ]
  %.idx = shl i64 %5, 3
  %6 = getelementptr i8, ptr %4, i64 %.idx
  %7 = load float, ptr %6, align 4, !alias.scope !5
  %8 = tail call float @llvm.maximum.f32(float %7, float 0.000000e+00)
  store float %8, ptr %6, align 4, !alias.scope !5
  %9 = getelementptr i8, ptr %6, i64 4
  %10 = load float, ptr %9, align 4, !alias.scope !5
  %11 = tail call float @llvm.maximum.f32(float %10, float 0.000000e+00)
  store float %11, ptr %9, align 4, !alias.scope !5
  %12 = add nuw nsw i64 %5, 1
  %exitcond.not = icmp eq i64 %12, 3
  br i1 %exitcond.not, label %broadcast_maximum_fusion_wrapped.exit, label %.preheader, !llvm.loop !8

broadcast_maximum_fusion_wrapped.exit:            ; preds = %.preheader
  ret ptr null
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 24}
!5 = !{!6}
!6 = distinct !{!6, !7, !"broadcast_maximum_fusion_wrapped: argument 0"}
!7 = distinct !{!7, !"broadcast_maximum_fusion_wrapped"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
