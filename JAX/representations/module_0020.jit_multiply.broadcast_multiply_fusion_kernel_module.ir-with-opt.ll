; ModuleID = '__compute_module_broadcast_multiply_fusion_kernel_module'
source_filename = "__compute_module_broadcast_multiply_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @broadcast_multiply_fusion(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
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
  %9 = load float, ptr %6, align 4, !invariant.load !3, !alias.scope !9, !noalias !13
  br label %10

10:                                               ; preds = %1, %10
  %11 = phi i64 [ 0, %1 ], [ %62, %10 ]
  %12 = mul nuw nsw i64 %11, 10
  %13 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %12
  %14 = load float, ptr %13, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %15 = fmul float %9, %14
  %16 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %12
  store float %15, ptr %16, align 4, !alias.scope !11, !noalias !15
  %17 = or disjoint i64 %12, 1
  %18 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %17
  %19 = load float, ptr %18, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %20 = fmul float %9, %19
  %21 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %17
  store float %20, ptr %21, align 4, !alias.scope !11, !noalias !15
  %22 = add nuw nsw i64 %12, 2
  %23 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %22
  %24 = load float, ptr %23, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %25 = fmul float %9, %24
  %26 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %22
  store float %25, ptr %26, align 4, !alias.scope !11, !noalias !15
  %27 = add nuw nsw i64 %12, 3
  %28 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %27
  %29 = load float, ptr %28, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %30 = fmul float %9, %29
  %31 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %27
  store float %30, ptr %31, align 4, !alias.scope !11, !noalias !15
  %32 = add nuw nsw i64 %12, 4
  %33 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %32
  %34 = load float, ptr %33, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %35 = fmul float %9, %34
  %36 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %32
  store float %35, ptr %36, align 4, !alias.scope !11, !noalias !15
  %37 = add nuw nsw i64 %12, 5
  %38 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %37
  %39 = load float, ptr %38, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %40 = fmul float %9, %39
  %41 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %37
  store float %40, ptr %41, align 4, !alias.scope !11, !noalias !15
  %42 = add nuw nsw i64 %12, 6
  %43 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %42
  %44 = load float, ptr %43, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %45 = fmul float %9, %44
  %46 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %42
  store float %45, ptr %46, align 4, !alias.scope !11, !noalias !15
  %47 = add nuw nsw i64 %12, 7
  %48 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %47
  %49 = load float, ptr %48, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %50 = fmul float %9, %49
  %51 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %47
  store float %50, ptr %51, align 4, !alias.scope !11, !noalias !15
  %52 = add nuw nsw i64 %12, 8
  %53 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %52
  %54 = load float, ptr %53, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %55 = fmul float %9, %54
  %56 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %52
  store float %55, ptr %56, align 4, !alias.scope !11, !noalias !15
  %57 = add nuw nsw i64 %12, 9
  %58 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %57
  %59 = load float, ptr %58, align 4, !invariant.load !3, !alias.scope !6, !noalias !14
  %60 = fmul float %9, %59
  %61 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %57
  store float %60, ptr %61, align 4, !alias.scope !11, !noalias !15
  %62 = add nuw nsw i64 %11, 1
  %exitcond.not = icmp eq i64 %62, 5
  br i1 %exitcond.not, label %broadcast_multiply_fusion_wrapped.exit, label %10, !llvm.loop !16

broadcast_multiply_fusion_wrapped.exit:           ; preds = %10
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
!4 = !{i64 200}
!5 = !{i64 4}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_multiply_fusion_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_multiply_fusion_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_multiply_fusion_wrapped: argument 1"}
!11 = !{!12}
!12 = distinct !{!12, !8, !"broadcast_multiply_fusion_wrapped: argument 2"}
!13 = !{!7, !12}
!14 = !{!10, !12}
!15 = !{!7, !10}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
