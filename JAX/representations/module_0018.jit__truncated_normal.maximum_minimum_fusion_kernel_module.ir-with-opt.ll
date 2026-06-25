; ModuleID = '__compute_module_maximum_minimum_fusion_kernel_module'
source_filename = "__compute_module_maximum_minimum_fusion_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: uwtable
define noalias noundef ptr @maximum_minimum_fusion(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !4
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %8 = load ptr, ptr %7, align 8, !invariant.load !3, !dereferenceable !5
  %9 = getelementptr inbounds nuw i8, ptr %3, i64 48
  %10 = load ptr, ptr %9, align 8, !invariant.load !3, !dereferenceable !5
  %11 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %12 = load ptr, ptr %11, align 8, !invariant.load !3, !dereferenceable !4
  %13 = getelementptr inbounds nuw i8, ptr %3, i64 80
  %14 = load ptr, ptr %13, align 8, !invariant.load !3, !dereferenceable !4
  %15 = getelementptr inbounds nuw i8, ptr %3, i64 96
  %16 = load ptr, ptr %15, align 8, !invariant.load !3, !dereferenceable !5
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !11)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !13)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !19)
  %17 = load float, ptr %4, align 4, !invariant.load !3, !alias.scope !6, !noalias !21
  %18 = load float, ptr %6, align 4, !invariant.load !3, !alias.scope !9, !noalias !22
  %19 = fsub float %17, %18
  %20 = load i32, ptr %12, align 4, !invariant.load !3, !alias.scope !15, !noalias !23
  %21 = sitofp i32 %20 to float
  %22 = bitcast float %21 to i32
  %23 = tail call float @llvm.fabs.f32(float %21)
  %24 = bitcast float %23 to i32
  %25 = icmp samesign ugt i32 %24, 2139095040
  %26 = icmp slt i32 %20, 0
  %27 = or i1 %26, %25
  %28 = select i1 %27, i32 -1, i32 1
  %29 = icmp eq i32 %24, 0
  %30 = add i32 %28, %22
  %31 = bitcast i32 %30 to float
  %32 = select i1 %29, float 1.401300e-45, float %31
  %33 = load i32, ptr %14, align 4, !invariant.load !3, !alias.scope !17, !noalias !24
  %34 = sitofp i32 %33 to float
  %35 = bitcast float %34 to i32
  %36 = tail call float @llvm.fabs.f32(float %34)
  %37 = bitcast float %36 to i32
  %38 = icmp samesign ugt i32 %37, 2139095040
  %39 = icmp sgt i32 %33, -1
  %40 = or i1 %39, %38
  %41 = select i1 %40, i32 -1, i32 1
  %42 = icmp eq i32 %37, 0
  %43 = add i32 %41, %35
  %44 = bitcast i32 %43 to float
  %45 = select i1 %42, float -1.401300e-45, float %44
  br label %46

46:                                               ; preds = %1, %155
  %47 = phi i64 [ 0, %1 ], [ %156, %155 ]
  %48 = mul nuw nsw i64 %47, 10
  br label %49

49:                                               ; preds = %46, %49
  %50 = phi i64 [ 0, %46 ], [ %154, %49 ]
  %51 = add nuw nsw i64 %50, %48
  %52 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %51
  %53 = load i32, ptr %52, align 4, !invariant.load !3, !alias.scope !11, !noalias !25
  %54 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %51
  %55 = load i32, ptr %54, align 4, !invariant.load !3, !alias.scope !13, !noalias !26
  %56 = xor i32 %55, %53
  %57 = lshr i32 %56, 9
  %58 = or disjoint i32 %57, 1065353216
  %59 = bitcast i32 %58 to float
  %60 = fadd nnan float %59, -1.000000e+00
  %61 = fmul float %19, %60
  %62 = fadd float %18, %61
  %63 = tail call float @llvm.maximum.f32(float %18, float %62)
  %64 = fneg float %63
  %65 = fmul float %63, %64
  %66 = fadd float %65, 1.000000e+00
  %67 = insertelement <1 x float> poison, float %66, i64 0
  %log_f32.i.i = fcmp ule <1 x float> %67, zeroinitializer
  %log_f323.i.i = fcmp une <1 x float> %67, zeroinitializer
  %log_f326.i.i = fcmp une <1 x float> %67, splat (float +inf)
  %.inv = fcmp ogt <1 x float> %67, splat (float f0x00800000)
  %68 = select <1 x i1> %.inv, <1 x float> %67, <1 x float> splat (float f0x00800000)
  %69 = bitcast <1 x float> %68 to <1 x i32>
  %70 = lshr <1 x i32> %69, splat (i32 23)
  %log_f3210.i.i = and <1 x i32> %69, splat (i32 -2139095041)
  %log_f3212.i.i = or disjoint <1 x i32> %log_f3210.i.i, splat (i32 1056964608)
  %log_f3213.i.i = bitcast <1 x i32> %log_f3212.i.i to <1 x float>
  %71 = add nsw <1 x i32> %70, splat (i32 -127)
  %72 = sitofp <1 x i32> %71 to <1 x float>
  %log_f3214.i.i = fadd <1 x float> %72, splat (float 1.000000e+00)
  %log_f3215.i.i = fcmp olt <1 x float> %log_f3213.i.i, splat (float f0x3F3504F3)
  %73 = select <1 x i1> %log_f3215.i.i, <1 x float> %log_f3213.i.i, <1 x float> zeroinitializer
  %74 = fadd <1 x float> %log_f3213.i.i, splat (float -1.000000e+00)
  %75 = select <1 x i1> %log_f3215.i.i, <1 x float> splat (float 1.000000e+00), <1 x float> zeroinitializer
  %76 = fsub <1 x float> %log_f3214.i.i, %75
  %log_f3223.i.i = fadd <1 x float> %74, %73
  %log_f3224.i.i = fmul <1 x float> %log_f3223.i.i, %log_f3223.i.i
  %log_f3225.i.i = fmul <1 x float> %log_f3224.i.i, %log_f3223.i.i
  %log_f3226.i.i = fmul <1 x float> %log_f3223.i.i, splat (float f0x3D9021BB)
  %log_f3227.i.i = fadd <1 x float> %log_f3226.i.i, splat (float f0xBDEBD1B8)
  %log_f3228.i.i = fmul <1 x float> %log_f3223.i.i, splat (float f0xBDFE5D4F)
  %log_f3229.i.i = fadd <1 x float> %log_f3228.i.i, splat (float f0x3E11E9BF)
  %log_f3230.i.i = fmul <1 x float> %log_f3223.i.i, splat (float f0x3E4CCEAC)
  %log_f3231.i.i = fadd <1 x float> %log_f3230.i.i, splat (float f0xBE7FFFFC)
  %log_f3232.i.i = fmul <1 x float> %log_f3227.i.i, %log_f3223.i.i
  %log_f3233.i.i = fadd <1 x float> %log_f3232.i.i, splat (float f0x3DEF251A)
  %log_f3234.i.i = fmul <1 x float> %log_f3229.i.i, %log_f3223.i.i
  %log_f3235.i.i = fadd <1 x float> %log_f3234.i.i, splat (float f0xBE2AAE50)
  %log_f3236.i.i = fmul <1 x float> %log_f3231.i.i, %log_f3223.i.i
  %log_f3237.i.i = fadd <1 x float> %log_f3236.i.i, splat (float f0x3EAAAAAA)
  %log_f3238.i.i = fmul <1 x float> %log_f3233.i.i, %log_f3225.i.i
  %log_f3239.i.i = fadd <1 x float> %log_f3235.i.i, %log_f3238.i.i
  %log_f3240.i.i = fmul <1 x float> %log_f3239.i.i, %log_f3225.i.i
  %log_f3241.i.i = fadd <1 x float> %log_f3237.i.i, %log_f3240.i.i
  %log_f3242.i.i = fmul <1 x float> %log_f3241.i.i, %log_f3225.i.i
  %log_f3243.i.i = fmul nnan <1 x float> %76, splat (float f0xB95E8083)
  %log_f3244.i.i = fmul <1 x float> %log_f3224.i.i, splat (float 5.000000e-01)
  %log_f3245.i.i = fadd <1 x float> %log_f3242.i.i, %log_f3243.i.i
  %77 = fsub <1 x float> %log_f3223.i.i, %log_f3244.i.i
  %log_f3246.i.i = fmul nnan <1 x float> %76, splat (float f0x3F318000)
  %log_f3247.i.i = fadd <1 x float> %77, %log_f3245.i.i
  %log_f3248.i.i = fadd <1 x float> %log_f3247.i.i, %log_f3246.i.i
  %log_f3252.i.i = select <1 x i1> %log_f326.i.i, <1 x i32> zeroinitializer, <1 x i32> splat (i32 2139095040)
  %log_f3255.i.i = select <1 x i1> %log_f323.i.i, <1 x i32> %log_f3252.i.i, <1 x i32> splat (i32 -8388608)
  %log_f3257.i.i = bitcast <1 x float> %log_f3248.i.i to <1 x i32>
  %log_f3259.i.i = select <1 x i1> %log_f32.i.i, <1 x i32> splat (i32 -1), <1 x i32> %log_f3257.i.i
  %log_f3263.i.i4.not = and <1 x i1> %log_f323.i.i, %log_f326.i.i
  %log_f3269.i.i = select <1 x i1> %log_f3263.i.i4.not, <1 x i32> %log_f3259.i.i, <1 x i32> zeroinitializer
  %log_f3272.i.i = or <1 x i32> %log_f3255.i.i, %log_f3269.i.i
  %log_f3273.i.i = bitcast <1 x i32> %log_f3272.i.i to <1 x float>
  %78 = extractelement <1 x float> %log_f3273.i.i, i64 0
  %79 = fmul float %65, %65
  %80 = fmul float %65, 0.000000e+00
  %81 = fadd float %80, 1.000000e+00
  %82 = fmul float %81, %65
  %83 = fadd float %82, f0x417101AD
  %84 = fmul float %83, %65
  %85 = fadd float %84, f0x42A6185B
  %86 = fmul float %85, %65
  %87 = fadd float %86, f0x435DC32D
  %88 = fmul float %87, %65
  %89 = fadd float %88, f0x439A8CA3
  %90 = fmul float %89, %65
  %91 = fadd float %90, f0x43586D8A
  %92 = fmul float %91, %65
  %93 = fadd float %92, f0x42707982
  %94 = fadd float %80, 4.527000e-05
  %95 = fmul float %94, %65
  %96 = fadd float %95, f0x3EFF40C5
  %97 = fmul float %96, %65
  %98 = fadd float %97, f0x40D284FA
  %99 = fmul float %98, %65
  %100 = fadd float %99, f0x41EF4B9C
  %101 = fmul float %100, %65
  %102 = fadd float %101, f0x4273CC76
  %103 = fmul float %102, %65
  %104 = fadd float %103, f0x426473AD
  %105 = fmul float %104, %65
  %106 = fadd float %105, f0x41A05101
  %107 = fdiv float %106, %93
  %108 = fmul float %65, %79
  %109 = fmul float %108, %107
  %110 = fmul float %79, -5.000000e-01
  %111 = fadd float %110, %109
  %112 = fadd float %65, %111
  %113 = call float @llvm.fabs.f32(float %65)
  %114 = fcmp olt float %113, f0x3ED413CD
  %115 = select i1 %114, float %112, float %78
  %116 = fneg float %115
  %117 = fcmp ogt float %115, -5.000000e+00
  %118 = select i1 %117, float f0x32F16588, float f0xB951F09B
  %119 = select i1 %117, float f0x34B84B36, float f0x38D3B56B
  %120 = tail call float @llvm.sqrt.f32(float %116)
  %121 = fsub float -2.500000e+00, %115
  %122 = fadd float %120, -3.000000e+00
  %123 = select i1 %117, float %121, float %122
  %124 = fmul float %118, %123
  %125 = fadd float %119, %124
  %126 = select i1 %117, float f0xB66C7357, float f0x3AB0DC72
  %127 = fmul float %123, %125
  %128 = fadd float %126, %127
  %129 = select i1 %117, float f0xB6935AC1, float f0xBB70BDE7
  %130 = fmul float %123, %128
  %131 = fadd float %129, %130
  %132 = select i1 %117, float f0x396532DB, float f0x3BBC127B
  %133 = fmul float %123, %131
  %134 = fadd float %132, %133
  %135 = select i1 %117, float f0xBAA45408, float f0xBBF9C5D7
  %136 = fmul float %123, %134
  %137 = fadd float %135, %136
  %138 = select i1 %117, float f0xBB88E4EF, float f0x3C1AA57E
  %139 = fmul float %123, %137
  %140 = fadd float %138, %139
  %141 = select i1 %117, float f0x3E7C8F63, float f0x3F8036DB
  %142 = fmul float %123, %140
  %143 = fadd float %141, %142
  %144 = select i1 %117, float f0x3FC02E2F, float f0x40354F7E
  %145 = fmul float %123, %143
  %146 = tail call float @llvm.fabs.f32(float %63)
  %147 = fadd float %144, %145
  %148 = fcmp oeq float %146, 1.000000e+00
  %.v = select i1 %148, float +inf, float %147
  %149 = fmul float %63, %.v
  %150 = fmul float %149, f0x3FB504F3
  %151 = tail call float @llvm.maximum.f32(float %32, float %150)
  %152 = tail call float @llvm.minimum.f32(float %45, float %151)
  %153 = getelementptr inbounds nuw [4 x i8], ptr %16, i64 %51
  store float %152, ptr %153, align 4, !alias.scope !19, !noalias !27
  %154 = add nuw nsw i64 %50, 1
  %exitcond.not = icmp eq i64 %154, 10
  br i1 %exitcond.not, label %155, label %49

155:                                              ; preds = %49
  %156 = add nuw nsw i64 %47, 1
  %exitcond2.not = icmp eq i64 %156, 5
  br i1 %exitcond2.not, label %maximum_minimum_fusion_wrapped.exit, label %46, !llvm.loop !28

maximum_minimum_fusion_wrapped.exit:              ; preds = %155
  ret ptr null
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #2

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 4}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 4}
!5 = !{i64 200}
!6 = !{!7}
!7 = distinct !{!7, !8, !"maximum_minimum_fusion_wrapped: argument 0"}
!8 = distinct !{!8, !"maximum_minimum_fusion_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"maximum_minimum_fusion_wrapped: argument 1"}
!11 = !{!12}
!12 = distinct !{!12, !8, !"maximum_minimum_fusion_wrapped: argument 2"}
!13 = !{!14}
!14 = distinct !{!14, !8, !"maximum_minimum_fusion_wrapped: argument 3"}
!15 = !{!16}
!16 = distinct !{!16, !8, !"maximum_minimum_fusion_wrapped: argument 4"}
!17 = !{!18}
!18 = distinct !{!18, !8, !"maximum_minimum_fusion_wrapped: argument 5"}
!19 = !{!20}
!20 = distinct !{!20, !8, !"maximum_minimum_fusion_wrapped: argument 6"}
!21 = !{!10, !12, !14, !16, !18, !20}
!22 = !{!7, !12, !14, !16, !18, !20}
!23 = !{!7, !10, !12, !14, !18, !20}
!24 = !{!7, !10, !12, !14, !16, !20}
!25 = !{!7, !10, !14, !16, !18, !20}
!26 = !{!7, !10, !12, !16, !18, !20}
!27 = !{!7, !10, !12, !14, !16, !18}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.unroll.disable"}
