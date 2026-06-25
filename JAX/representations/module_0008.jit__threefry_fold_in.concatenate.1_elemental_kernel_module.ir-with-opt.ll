; ModuleID = '__compute_module_concatenate.1_elemental_kernel_module'
source_filename = "__compute_module_concatenate.1_elemental_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable
define noalias noundef ptr @concatenate.1_kernel(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
return:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !2, !dereferenceable !3, !align !4
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !2, !dereferenceable !3, !align !4
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !2, !dereferenceable !5, !align !4
  %1 = load i32, ptr %arg0, align 64, !invariant.load !2, !noalias !6
  store i32 %1, ptr %arg2, align 64, !alias.scope !6
  %2 = getelementptr inbounds nuw i8, ptr %arg2, i64 4
  %3 = load i32, ptr %arg1, align 64, !invariant.load !2, !noalias !6
  store i32 %3, ptr %2, align 4, !alias.scope !6
  ret ptr null
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!xla_cpu_memory_region_name = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"xla_cpu_emitter__concatenate_kernel_emitter__hlo_opcode__concatenate"}
!1 = !{i32 1, !"xla_dylib_index", i64 1}
!2 = !{}
!3 = !{i64 4}
!4 = !{i64 64}
!5 = !{i64 8}
!6 = !{!7}
!7 = !{!"result slice: {index:3, offset:0, size:8}", !8}
!8 = !{!"XLA host kernel concatenate.1_kernel AA domain"}
