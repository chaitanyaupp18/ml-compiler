; ModuleID = '__compute_module_call_computation_kernel_module'
source_filename = "__compute_module_call_computation_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable
define noalias noundef ptr @call_kernel(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg19_gep = getelementptr i8, ptr %args, i64 304
  %arg19 = load ptr, ptr %arg19_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg20_gep = getelementptr i8, ptr %args, i64 320
  %arg20 = load ptr, ptr %arg20_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg21_gep = getelementptr i8, ptr %args, i64 336
  %arg21 = load ptr, ptr %arg21_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg22_gep = getelementptr i8, ptr %args, i64 352
  %arg22 = load ptr, ptr %arg22_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg23_gep = getelementptr i8, ptr %args, i64 368
  %arg23 = load ptr, ptr %arg23_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg25_gep = getelementptr i8, ptr %args, i64 400
  %arg25 = load ptr, ptr %arg25_gep, align 8, !invariant.load !3, !dereferenceable !6, !align !5
  %arg27_gep = getelementptr i8, ptr %args, i64 432
  %arg27 = load ptr, ptr %arg27_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg28_gep = getelementptr i8, ptr %args, i64 448
  %arg28 = load ptr, ptr %arg28_gep, align 8, !invariant.load !3, !dereferenceable !7, !align !5
  %arg29_gep = getelementptr i8, ptr %args, i64 464
  %arg29 = load ptr, ptr %arg29_gep, align 8, !invariant.load !3, !dereferenceable !6, !align !5
  %arg30_gep = getelementptr i8, ptr %args, i64 480
  %arg30 = load ptr, ptr %arg30_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg31_gep = getelementptr i8, ptr %args, i64 496
  %arg31 = load ptr, ptr %arg31_gep, align 8, !invariant.load !3, !dereferenceable !5, !align !5
  %arg32_gep = getelementptr i8, ptr %args, i64 512
  %arg32 = load ptr, ptr %arg32_gep, align 8, !invariant.load !3, !dereferenceable !6, !align !5
  %arg33_gep = getelementptr i8, ptr %args, i64 528
  %arg33 = load ptr, ptr %arg33_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg34_gep = getelementptr i8, ptr %args, i64 544
  %arg34 = load ptr, ptr %arg34_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg35_gep = getelementptr i8, ptr %args, i64 560
  %arg35 = load ptr, ptr %arg35_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg36_gep = getelementptr i8, ptr %args, i64 576
  %arg36 = load ptr, ptr %arg36_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg37_gep = getelementptr i8, ptr %args, i64 592
  %arg37 = load ptr, ptr %arg37_gep, align 8, !invariant.load !3, !dereferenceable !4, !align !5
  %arg38_gep = getelementptr i8, ptr %args, i64 608
  %arg38 = load ptr, ptr %arg38_gep, align 8, !invariant.load !3, !dereferenceable !6, !align !5
  %2 = load i32, ptr %arg30, align 64, !alias.scope !8, !noalias !11
  %3 = icmp slt i32 %2, 5
  %4 = zext i1 %3 to i8
  store i8 %4, ptr %arg28, align 64, !alias.scope !18, !noalias !19
  br i1 %3, label %while.6.body.i.lr.ph, label %return

while.6.body.i.lr.ph:                             ; preds = %1
  %5 = getelementptr inbounds nuw i8, ptr %arg29, i64 4
  %6 = getelementptr inbounds nuw i8, ptr %arg29, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %arg29, i64 12
  %8 = getelementptr inbounds nuw i8, ptr %arg31, i64 8
  %9 = getelementptr inbounds nuw i8, ptr %arg31, i64 16
  %10 = getelementptr inbounds nuw i8, ptr %arg31, i64 24
  %11 = getelementptr inbounds nuw i8, ptr %arg31, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %arg31, i64 40
  %13 = getelementptr inbounds nuw i8, ptr %arg31, i64 48
  %14 = getelementptr inbounds nuw i8, ptr %arg31, i64 56
  br label %while.6.body.i

while.6.body.i:                                   ; preds = %while.6.body.i.lr.ph, %while.6.body.i
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg25, ptr noundef nonnull align 64 dereferenceable(16) %arg38, i64 16, i1 false), !noalias !20
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg29, ptr noundef nonnull align 64 dereferenceable(16) %arg32, i64 16, i1 false), !noalias !20
  %15 = load i32, ptr %arg33, align 64, !noalias !20
  store i32 %15, ptr %arg23, align 64, !noalias !20
  %16 = load i32, ptr %arg37, align 64, !noalias !20
  store i32 %16, ptr %arg21, align 64, !noalias !20
  %17 = load i32, ptr %arg36, align 64, !noalias !20
  store i32 %17, ptr %arg35, align 64, !noalias !20
  %18 = load i32, ptr %arg27, align 64, !noalias !20
  store i32 %18, ptr %arg20, align 64, !noalias !20
  %19 = load i32, ptr %arg22, align 64, !noalias !20
  store i32 %19, ptr %arg34, align 64, !noalias !20
  %20 = load i32, ptr %arg30, align 64, !noalias !20
  store i32 %20, ptr %arg19, align 64, !noalias !20
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg38, ptr noundef nonnull align 64 dereferenceable(16) %arg29, i64 16, i1 false), !noalias !20
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg32, ptr noundef nonnull align 64 dereferenceable(16) %arg25, i64 16, i1 false), !noalias !20
  %21 = load i32, ptr %arg23, align 64, !noalias !20
  store i32 %21, ptr %arg37, align 64, !noalias !20
  %22 = load i32, ptr %arg35, align 64, !noalias !20
  store i32 %22, ptr %arg33, align 64, !noalias !20
  %23 = load i32, ptr %arg21, align 64, !noalias !20
  store i32 %23, ptr %arg36, align 64, !noalias !20
  %24 = load i32, ptr %arg34, align 64, !alias.scope !23, !noalias !25
  %25 = load i32, ptr %arg20, align 64, !alias.scope !33, !noalias !34
  %26 = add i32 %25, %24
  %27 = load i32, ptr %arg29, align 64, !alias.scope !35, !noalias !36
  %28 = shl i32 %25, %27
  %shft.chk.i.i = icmp ult i32 %27, 32
  %29 = select i1 %shft.chk.i.i, i32 %28, i32 0
  %30 = sub i32 32, %27
  %31 = lshr i32 %25, %30
  %shft.chk1.i.i = icmp ult i32 %30, 32
  %32 = select i1 %shft.chk1.i.i, i32 %31, i32 0
  %33 = or i32 %32, %29
  %34 = xor i32 %33, %26
  %35 = add i32 %34, %26
  %36 = load i32, ptr %5, align 4, !alias.scope !35, !noalias !36
  %37 = shl i32 %34, %36
  %shft.chk2.i.i = icmp ult i32 %36, 32
  %38 = select i1 %shft.chk2.i.i, i32 %37, i32 0
  %39 = sub i32 32, %36
  %40 = lshr i32 %34, %39
  %shft.chk4.i.i = icmp ult i32 %39, 32
  %41 = select i1 %shft.chk4.i.i, i32 %40, i32 0
  %42 = or i32 %38, %41
  %43 = xor i32 %42, %35
  %44 = add i32 %43, %35
  %45 = load i32, ptr %6, align 8, !alias.scope !35, !noalias !36
  %46 = shl i32 %43, %45
  %shft.chk5.i.i = icmp ult i32 %45, 32
  %47 = select i1 %shft.chk5.i.i, i32 %46, i32 0
  %48 = sub i32 32, %45
  %49 = lshr i32 %43, %48
  %shft.chk7.i.i = icmp ult i32 %48, 32
  %50 = select i1 %shft.chk7.i.i, i32 %49, i32 0
  %51 = or i32 %47, %50
  %52 = xor i32 %51, %44
  %53 = load i32, ptr %arg35, align 64, !alias.scope !39, !noalias !40
  %54 = add i32 %44, %53
  %55 = add i32 %54, %52
  store i32 %55, ptr %arg22, align 64, !alias.scope !43, !noalias !44
  %56 = add i32 %52, %44
  %57 = load i32, ptr %7, align 4, !alias.scope !35, !noalias !36
  %58 = shl i32 %52, %57
  %shft.chk17.i.i = icmp ult i32 %57, 32
  %59 = select i1 %shft.chk17.i.i, i32 %58, i32 0
  %60 = sub i32 32, %57
  %61 = lshr i32 %52, %60
  %shft.chk19.i.i = icmp ult i32 %60, 32
  %62 = select i1 %shft.chk19.i.i, i32 %61, i32 0
  %63 = or i32 %59, %62
  %64 = xor i32 %63, %56
  %65 = load i32, ptr %arg21, align 64, !alias.scope !47, !noalias !48
  %66 = load i32, ptr %arg19, align 64, !alias.scope !49, !noalias !50
  %67 = add i32 %65, 1
  %68 = add i32 %67, %66
  %69 = add i32 %68, %64
  store i32 %69, ptr %arg27, align 64, !alias.scope !52, !noalias !53
  %70 = add i32 %66, 1
  store i32 %70, ptr %arg30, align 64, !alias.scope !8, !noalias !54
  store ptr %arg30, ptr %arg31, align 64, !alias.scope !55, !noalias !56
  store ptr %arg22, ptr %8, align 8, !alias.scope !55, !noalias !56
  store ptr %arg27, ptr %9, align 16, !alias.scope !55, !noalias !56
  store ptr %arg36, ptr %10, align 8, !alias.scope !55, !noalias !56
  store ptr %arg37, ptr %11, align 32, !alias.scope !55, !noalias !56
  store ptr %arg33, ptr %12, align 8, !alias.scope !55, !noalias !56
  store ptr %arg32, ptr %13, align 16, !alias.scope !55, !noalias !56
  store ptr %arg38, ptr %14, align 8, !alias.scope !55, !noalias !56
  %71 = icmp slt i32 %70, 5
  %72 = zext i1 %71 to i8
  store i8 %72, ptr %arg28, align 64, !alias.scope !18, !noalias !19
  br i1 %71, label %while.6.body.i, label %return

return:                                           ; preds = %while.6.body.i, %1
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!xla_cpu_memory_region_name = !{!0, !1}
!llvm.module.flags = !{!2}

!0 = !{!"xla_cpu_emitter__computation_kernel_emitter__hlo_opcode__call"}
!1 = !{!"ir_emitter"}
!2 = !{i32 1, !"xla_dylib_index", i64 0}
!3 = !{}
!4 = !{i64 4}
!5 = !{i64 64}
!6 = !{i64 16}
!7 = !{i64 1}
!8 = !{!9}
!9 = !{!"buffer: {index:3, offset:0, size:4}", !10}
!10 = !{!"XLA global AA domain"}
!11 = !{!12, !13, !14, !16}
!12 = !{!"buffer: {index:7, offset:0, size:4}", !10}
!13 = !{!"buffer: {index:8, offset:64, size:1}", !10}
!14 = distinct !{!14, !15, !"while.6__1: %buffer_table"}
!15 = distinct !{!15, !"while.6__1"}
!16 = distinct !{!16, !17, !"while.5_computation: %buffer_table"}
!17 = distinct !{!17, !"while.5_computation"}
!18 = !{!13}
!19 = !{!9, !12, !14, !16}
!20 = !{!21, !16}
!21 = distinct !{!21, !22, !"while.6: %buffer_table"}
!22 = distinct !{!22, !"while.6"}
!23 = !{!24}
!24 = !{!"buffer: {index:8, offset:448, size:4}", !10}
!25 = !{!26, !27, !28, !29, !30, !31, !32, !21, !16}
!26 = !{!"buffer: {index:8, offset:64, size:16}", !10}
!27 = !{!"buffer: {index:8, offset:320, size:4}", !10}
!28 = !{!"buffer: {index:8, offset:384, size:4}", !10}
!29 = !{!"buffer: {index:8, offset:512, size:4}", !10}
!30 = !{!"buffer: {index:8, offset:576, size:4}", !10}
!31 = !{!"buffer: {index:8, offset:704, size:4}", !10}
!32 = !{!"buffer: {index:8, offset:768, size:4}", !10}
!33 = !{!28}
!34 = !{!26, !27, !24, !29, !30, !31, !32, !21, !16}
!35 = !{!26}
!36 = !{!37, !38, !27, !28, !24, !29, !30, !31, !32, !21, !16}
!37 = !{!"buffer: {index:8, offset:192, size:16}", !10}
!38 = !{!"buffer: {index:8, offset:256, size:16}", !10}
!39 = !{!30}
!40 = !{!26, !28, !24, !31, !41, !42, !21, !16}
!41 = !{!"buffer: {index:8, offset:832, size:4}", !10}
!42 = !{!"buffer: {index:8, offset:960, size:4}", !10}
!43 = !{!31}
!44 = !{!9, !45, !26, !37, !38, !28, !24, !30, !32, !41, !46, !42, !21, !16}
!45 = !{!"buffer: {index:8, offset:0, size:64}", !10}
!46 = !{!"buffer: {index:8, offset:896, size:4}", !10}
!47 = !{!27}
!48 = !{!26, !28, !24, !29, !32, !41, !46, !21, !16}
!49 = !{!29}
!50 = !{!51, !9, !26, !27, !28, !24, !32, !21, !16}
!51 = !{!"buffer: {index:0, offset:0, size:4}", !10}
!52 = !{!32}
!53 = !{!9, !45, !26, !37, !38, !27, !28, !24, !29, !31, !41, !46, !42, !21, !16}
!54 = !{!51, !45, !37, !38, !29, !31, !32, !41, !46, !42, !21, !16}
!55 = !{!45}
!56 = !{!9, !37, !38, !31, !32, !41, !46, !42, !21, !16}
