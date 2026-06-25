; ModuleID = '__compute_module_broadcast_add_fusion_kernel_module'
source_filename = "__compute_module_broadcast_add_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !5
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %8 = load ptr, ptr %7, align 8, !invariant.load !3, !dereferenceable !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !11)
  %.pre = load float, ptr %6, align 4, !invariant.load !3, !alias.scope !9, !noalias !13
  %.phi.trans.insert = getelementptr inbounds nuw i8, ptr %6, i64 4
  %.pre2 = load float, ptr %.phi.trans.insert, align 4, !invariant.load !3, !alias.scope !9, !noalias !13
  br label %9

9:                                                ; preds = %1, %9
  %10 = phi i64 [ 0, %1 ], [ %21, %9 ]
  %11 = shl nuw nsw i64 %10, 1
  %12 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %11
  %13 = load float, ptr %12, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %14 = fadd float %13, %.pre
  %15 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %11
  store float %14, ptr %15, align 4, !alias.scope !11, !noalias !15
  %16 = or disjoint i64 %11, 1
  %17 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %16
  %18 = load float, ptr %17, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %19 = fadd float %18, %.pre2
  %20 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %16
  store float %19, ptr %20, align 4, !alias.scope !11, !noalias !15
  %21 = add nuw nsw i64 %10, 1
  %exitcond.not = icmp eq i64 %21, 3
  br i1 %exitcond.not, label %broadcast_add_fusion_wrapped.exit, label %9, !llvm.loop !16

broadcast_add_fusion_wrapped.exit:                ; preds = %9
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 24}
!5 = !{i64 8}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_add_fusion_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_add_fusion_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_add_fusion_wrapped: argument 1"}
!11 = !{!12}
!12 = distinct !{!12, !8, !"broadcast_add_fusion_wrapped: argument 2"}
!13 = !{!7, !12}
!14 = !{!10, !12}
!15 = !{!7, !10}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
