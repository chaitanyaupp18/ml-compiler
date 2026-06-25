; ModuleID = '__compute_module_broadcast_add_fusion.2_kernel_module'
source_filename = "__compute_module_broadcast_add_fusion.2_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.2(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !5
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  %7 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %8 = load i32, ptr %7, align 4, !invariant.load !3, !alias.scope !6, !noalias !9
  br label %9

9:                                                ; preds = %1, %9
  %10 = phi i64 [ 0, %1 ], [ %19, %9 ]
  %11 = shl nuw nsw i64 %10, 1
  %.idx = shl nuw nsw i64 %10, 3
  %12 = getelementptr i8, ptr %6, i64 %.idx
  %13 = trunc nuw nsw i64 %11 to i32
  %14 = add i32 %8, %13
  store i32 %14, ptr %12, align 4, !alias.scope !9, !noalias !6
  %15 = trunc i64 %11 to i32
  %16 = or disjoint i32 %15, 1
  %17 = add i32 %8, %16
  %18 = getelementptr i8, ptr %12, i64 4
  store i32 %17, ptr %18, align 4, !alias.scope !9, !noalias !6
  %19 = add nuw nsw i64 %10, 1
  %exitcond.not = icmp eq i64 %19, 10
  br i1 %exitcond.not, label %broadcast_add_fusion.2_wrapped.exit, label %9, !llvm.loop !11

broadcast_add_fusion.2_wrapped.exit:              ; preds = %9
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 2}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 8}
!5 = !{i64 80}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_add_fusion.2_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_add_fusion.2_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_add_fusion.2_wrapped: argument 1"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
