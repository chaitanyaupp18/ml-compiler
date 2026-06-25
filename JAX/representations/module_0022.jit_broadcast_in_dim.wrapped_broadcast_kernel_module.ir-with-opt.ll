; ModuleID = '__compute_module_wrapped_broadcast_kernel_module'
source_filename = "__compute_module_wrapped_broadcast_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @wrapped_broadcast(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
wrapped_broadcast_wrapped.exit:
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %2 = load ptr, ptr %1, align 8, !invariant.load !3
  %3 = load ptr, ptr %2, align 8, !invariant.load !3, !dereferenceable !4
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %5 = load ptr, ptr %4, align 8, !invariant.load !3, !dereferenceable !5
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  %6 = load float, ptr %3, align 4, !invariant.load !3, !alias.scope !6, !noalias !9
  store float %6, ptr %5, align 4, !alias.scope !9, !noalias !6
  %7 = getelementptr inbounds nuw i8, ptr %5, i64 4
  store float %6, ptr %7, align 4, !alias.scope !9, !noalias !6
  %8 = getelementptr inbounds nuw i8, ptr %5, i64 8
  store float %6, ptr %8, align 4, !alias.scope !9, !noalias !6
  %9 = getelementptr inbounds nuw i8, ptr %5, i64 12
  store float %6, ptr %9, align 4, !alias.scope !9, !noalias !6
  %10 = getelementptr inbounds nuw i8, ptr %5, i64 16
  store float %6, ptr %10, align 4, !alias.scope !9, !noalias !6
  %11 = getelementptr inbounds nuw i8, ptr %5, i64 20
  store float %6, ptr %11, align 4, !alias.scope !9, !noalias !6
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 24
  store float %6, ptr %12, align 4, !alias.scope !9, !noalias !6
  %13 = getelementptr inbounds nuw i8, ptr %5, i64 28
  store float %6, ptr %13, align 4, !alias.scope !9, !noalias !6
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 32
  store float %6, ptr %14, align 4, !alias.scope !9, !noalias !6
  %15 = getelementptr inbounds nuw i8, ptr %5, i64 36
  store float %6, ptr %15, align 4, !alias.scope !9, !noalias !6
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 4}
!5 = !{i64 40}
!6 = !{!7}
!7 = distinct !{!7, !8, !"wrapped_broadcast_wrapped: argument 0"}
!8 = distinct !{!8, !"wrapped_broadcast_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"wrapped_broadcast_wrapped: argument 1"}
