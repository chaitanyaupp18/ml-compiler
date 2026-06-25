; ModuleID = '__compute_module_broadcast_maximum_fusion_kernel_module'
source_filename = "__compute_module_broadcast_maximum_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !5)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !8)
  br label %7

7:                                                ; preds = %1, %7
  %8 = phi i64 [ 0, %1 ], [ %19, %7 ]
  %9 = shl nuw nsw i64 %8, 1
  %10 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %9
  %11 = load float, ptr %10, align 4, !invariant.load !3, !alias.scope !5, !noalias !8
  %12 = tail call float @llvm.maximum.f32(float %11, float 0.000000e+00)
  %13 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %9
  store float %12, ptr %13, align 4, !alias.scope !8, !noalias !5
  %14 = or disjoint i64 %9, 1
  %15 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %14
  %16 = load float, ptr %15, align 4, !invariant.load !3, !alias.scope !5, !noalias !8
  %17 = tail call float @llvm.maximum.f32(float %16, float 0.000000e+00)
  %18 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %14
  store float %17, ptr %18, align 4, !alias.scope !8, !noalias !5
  %19 = add nuw nsw i64 %8, 1
  %exitcond.not = icmp eq i64 %19, 3
  br i1 %exitcond.not, label %broadcast_maximum_fusion_wrapped.exit, label %7, !llvm.loop !10

broadcast_maximum_fusion_wrapped.exit:            ; preds = %7
  ret ptr null
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #2

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

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
!8 = !{!9}
!9 = distinct !{!9, !7, !"broadcast_maximum_fusion_wrapped: argument 1"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
