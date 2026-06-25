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
  %8 = load ptr, ptr %7, align 8, !invariant.load !3, !dereferenceable !6
  %9 = getelementptr inbounds nuw i8, ptr %3, i64 48
  %10 = load ptr, ptr %9, align 8, !invariant.load !3, !dereferenceable !6
  %11 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %12 = load ptr, ptr %11, align 8, !invariant.load !3, !dereferenceable !4
  %13 = getelementptr inbounds nuw i8, ptr %3, i64 80
  %14 = load ptr, ptr %13, align 8, !invariant.load !3, !dereferenceable !6
  tail call void @llvm.experimental.noalias.scope.decl(metadata !7)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !16)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !18)
  %15 = load i32, ptr %6, align 4, !invariant.load !3, !alias.scope !10, !noalias !20
  %.fr12 = freeze i32 %15
  %16 = sub i32 32, %.fr12
  %17 = icmp ult i32 %.fr12, 32
  %18 = icmp ult i32 %16, 32
  %19 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %20 = load i32, ptr %19, align 4, !invariant.load !3, !alias.scope !10, !noalias !20
  %.fr = freeze i32 %20
  %21 = sub i32 32, %.fr
  %22 = icmp ult i32 %.fr, 32
  %23 = icmp ult i32 %21, 32
  %24 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %25 = load i32, ptr %24, align 4, !invariant.load !3, !alias.scope !10, !noalias !20
  %.fr13 = freeze i32 %25
  %26 = sub i32 32, %.fr13
  %27 = icmp ult i32 %.fr13, 32
  %28 = icmp ult i32 %26, 32
  %29 = getelementptr inbounds nuw i8, ptr %6, i64 12
  %30 = load i32, ptr %29, align 4, !invariant.load !3, !alias.scope !10, !noalias !20
  %.fr14 = freeze i32 %30
  %31 = sub i32 32, %.fr14
  %32 = icmp ult i32 %.fr14, 32
  %33 = icmp ult i32 %31, 32
  %34 = load i32, ptr %4, align 4, !invariant.load !3, !alias.scope !7, !noalias !21
  %35 = load i32, ptr %12, align 4, !invariant.load !3, !alias.scope !16, !noalias !22
  %36 = add i32 %34, 1
  %37 = add i32 %36, %35
  br i1 %17, label %.split4.us, label %.split

.split4.us:                                       ; preds = %1
  br i1 %18, label %.split4.us.split.us, label %.split.us.us

.split4.us.split.us:                              ; preds = %.split4.us
  br i1 %22, label %.split4.us.split.us.split.us, label %.split.us.us.us

.split4.us.split.us.split.us:                     ; preds = %.split4.us.split.us
  br i1 %23, label %.split4.us.split.us.split.us.split.us, label %.split.us.us.us.us

.split4.us.split.us.split.us.split.us:            ; preds = %.split4.us.split.us.split.us
  br i1 %27, label %.split4.us.split.us.split.us.split.us.split.us, label %.split.us.us.us.us.us

.split4.us.split.us.split.us.split.us.split.us:   ; preds = %.split4.us.split.us.split.us.split.us
  br i1 %28, label %.split4.us.split.us.split.us.split.us.split.us.split.us, label %.split.us.us.us.us.us.us

.split4.us.split.us.split.us.split.us.split.us.split.us: ; preds = %.split4.us.split.us.split.us.split.us.split.us
  br i1 %32, label %.split4.us.split.us.split.us.split.us.split.us.split.us.split.us, label %.split.us.us.us.us.us.us.us

.split4.us.split.us.split.us.split.us.split.us.split.us.split.us: ; preds = %.split4.us.split.us.split.us.split.us.split.us.split.us
  br i1 %33, label %.split.us.us.us.us.us.us.us.us.us, label %.split.us.us.us.us.us.us.us.us

.split.us.us.us.us.us.us.us.us.us:                ; preds = %.split4.us.split.us.split.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us.us.us.us
  %38 = phi i64 [ %93, %.split.us.us.us.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us.split.us.split.us ]
  %39 = shl nuw nsw i64 %38, 1
  %40 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %39
  %41 = load i32, ptr %40, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %42 = shl i32 %41, %.fr12
  %43 = lshr i32 %41, %16
  %44 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %39
  %45 = load i32, ptr %44, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %46 = or disjoint i32 %42, %43
  %47 = add i32 %45, %41
  %48 = xor i32 %46, %47
  %49 = shl i32 %48, %.fr
  %50 = lshr i32 %48, %21
  %51 = or disjoint i32 %49, %50
  %52 = add i32 %48, %47
  %53 = xor i32 %51, %52
  %54 = shl i32 %53, %.fr13
  %55 = lshr i32 %53, %26
  %56 = or disjoint i32 %54, %55
  %57 = add i32 %53, %52
  %58 = xor i32 %56, %57
  %59 = shl i32 %58, %.fr14
  %60 = lshr i32 %58, %31
  %61 = add i32 %58, %57
  %62 = or disjoint i32 %59, %60
  %63 = xor i32 %62, %61
  %64 = add i32 %37, %63
  %65 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %39
  store i32 %64, ptr %65, align 4, !alias.scope !18, !noalias !25
  %66 = or disjoint i64 %39, 1
  %67 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %66
  %68 = load i32, ptr %67, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %69 = shl i32 %68, %.fr12
  %70 = lshr i32 %68, %16
  %71 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %66
  %72 = load i32, ptr %71, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %73 = or disjoint i32 %69, %70
  %74 = add i32 %72, %68
  %75 = xor i32 %73, %74
  %76 = shl i32 %75, %.fr
  %77 = lshr i32 %75, %21
  %78 = or disjoint i32 %76, %77
  %79 = add i32 %75, %74
  %80 = xor i32 %78, %79
  %81 = shl i32 %80, %.fr13
  %82 = lshr i32 %80, %26
  %83 = or disjoint i32 %81, %82
  %84 = add i32 %80, %79
  %85 = xor i32 %83, %84
  %86 = shl i32 %85, %.fr14
  %87 = lshr i32 %85, %31
  %88 = add i32 %85, %84
  %89 = or disjoint i32 %86, %87
  %90 = xor i32 %89, %88
  %91 = add i32 %37, %90
  %92 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %66
  store i32 %91, ptr %92, align 4, !alias.scope !18, !noalias !25
  %93 = add nuw nsw i64 %38, 1
  %exitcond30.not = icmp eq i64 %93, 10
  br i1 %exitcond30.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us.us.us.us.us.us, !llvm.loop !26

.split.us.us.us.us.us.us.us.us:                   ; preds = %.split4.us.split.us.split.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us.us.us
  %94 = phi i64 [ %145, %.split.us.us.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us.split.us.split.us ]
  %95 = shl nuw nsw i64 %94, 1
  %96 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %95
  %97 = load i32, ptr %96, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %98 = shl i32 %97, %.fr12
  %99 = lshr i32 %97, %16
  %100 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %95
  %101 = load i32, ptr %100, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %102 = or disjoint i32 %98, %99
  %103 = add i32 %101, %97
  %104 = xor i32 %102, %103
  %105 = shl i32 %104, %.fr
  %106 = lshr i32 %104, %21
  %107 = or disjoint i32 %105, %106
  %108 = add i32 %104, %103
  %109 = xor i32 %107, %108
  %110 = shl i32 %109, %.fr13
  %111 = lshr i32 %109, %26
  %112 = or disjoint i32 %110, %111
  %113 = add i32 %109, %108
  %114 = xor i32 %112, %113
  %115 = shl i32 %114, %.fr14
  %116 = add i32 %114, %113
  %117 = xor i32 %115, %116
  %118 = add i32 %37, %117
  %119 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %95
  store i32 %118, ptr %119, align 4, !alias.scope !18, !noalias !25
  %120 = or disjoint i64 %95, 1
  %121 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %120
  %122 = load i32, ptr %121, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %123 = shl i32 %122, %.fr12
  %124 = lshr i32 %122, %16
  %125 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %120
  %126 = load i32, ptr %125, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %127 = or disjoint i32 %123, %124
  %128 = add i32 %126, %122
  %129 = xor i32 %127, %128
  %130 = shl i32 %129, %.fr
  %131 = lshr i32 %129, %21
  %132 = or disjoint i32 %130, %131
  %133 = add i32 %129, %128
  %134 = xor i32 %132, %133
  %135 = shl i32 %134, %.fr13
  %136 = lshr i32 %134, %26
  %137 = or disjoint i32 %135, %136
  %138 = add i32 %134, %133
  %139 = xor i32 %137, %138
  %140 = shl i32 %139, %.fr14
  %141 = add i32 %139, %138
  %142 = xor i32 %140, %141
  %143 = add i32 %37, %142
  %144 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %120
  store i32 %143, ptr %144, align 4, !alias.scope !18, !noalias !25
  %145 = add nuw nsw i64 %94, 1
  %exitcond29.not = icmp eq i64 %145, 10
  br i1 %exitcond29.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us.us.us.us.us, !llvm.loop !26

.split.us.us.us.us.us.us.us:                      ; preds = %.split4.us.split.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us.us
  %146 = phi i64 [ %199, %.split.us.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us.split.us ]
  %147 = shl nuw nsw i64 %146, 1
  %148 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %147
  %149 = load i32, ptr %148, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %150 = shl i32 %149, %.fr12
  %151 = lshr i32 %149, %16
  %152 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %147
  %153 = load i32, ptr %152, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %154 = or disjoint i32 %150, %151
  %155 = add i32 %153, %149
  %156 = xor i32 %154, %155
  %157 = shl i32 %156, %.fr
  %158 = lshr i32 %156, %21
  %159 = or disjoint i32 %157, %158
  %160 = add i32 %156, %155
  %161 = xor i32 %159, %160
  %162 = shl i32 %161, %.fr13
  %163 = lshr i32 %161, %26
  %164 = or disjoint i32 %162, %163
  %165 = add i32 %161, %160
  %166 = xor i32 %164, %165
  %167 = lshr i32 %166, %31
  %168 = select i1 %33, i32 %167, i32 0
  %169 = add i32 %166, %165
  %170 = xor i32 %168, %169
  %171 = add i32 %37, %170
  %172 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %147
  store i32 %171, ptr %172, align 4, !alias.scope !18, !noalias !25
  %173 = or disjoint i64 %147, 1
  %174 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %173
  %175 = load i32, ptr %174, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %176 = shl i32 %175, %.fr12
  %177 = lshr i32 %175, %16
  %178 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %173
  %179 = load i32, ptr %178, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %180 = or disjoint i32 %176, %177
  %181 = add i32 %179, %175
  %182 = xor i32 %180, %181
  %183 = shl i32 %182, %.fr
  %184 = lshr i32 %182, %21
  %185 = or disjoint i32 %183, %184
  %186 = add i32 %182, %181
  %187 = xor i32 %185, %186
  %188 = shl i32 %187, %.fr13
  %189 = lshr i32 %187, %26
  %190 = or disjoint i32 %188, %189
  %191 = add i32 %187, %186
  %192 = xor i32 %190, %191
  %193 = lshr i32 %192, %31
  %194 = select i1 %33, i32 %193, i32 0
  %195 = add i32 %192, %191
  %196 = xor i32 %194, %195
  %197 = add i32 %37, %196
  %198 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %173
  store i32 %197, ptr %198, align 4, !alias.scope !18, !noalias !25
  %199 = add nuw nsw i64 %146, 1
  %exitcond28.not = icmp eq i64 %199, 10
  br i1 %exitcond28.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us.us.us.us, !llvm.loop !26

.split.us.us.us.us.us.us:                         ; preds = %.split4.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us
  %200 = phi i64 [ %255, %.split.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us ]
  %201 = shl nuw nsw i64 %200, 1
  %202 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %201
  %203 = load i32, ptr %202, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %204 = shl i32 %203, %.fr12
  %205 = lshr i32 %203, %16
  %206 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %201
  %207 = load i32, ptr %206, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %208 = or disjoint i32 %204, %205
  %209 = add i32 %207, %203
  %210 = xor i32 %208, %209
  %211 = shl i32 %210, %.fr
  %212 = lshr i32 %210, %21
  %213 = or disjoint i32 %211, %212
  %214 = add i32 %210, %209
  %215 = xor i32 %213, %214
  %216 = shl i32 %215, %.fr13
  %217 = add i32 %215, %214
  %218 = xor i32 %216, %217
  %219 = shl i32 %218, %.fr14
  %220 = select i1 %32, i32 %219, i32 0
  %221 = lshr i32 %218, %31
  %222 = select i1 %33, i32 %221, i32 0
  %223 = add i32 %218, %217
  %224 = or i32 %220, %222
  %225 = xor i32 %224, %223
  %226 = add i32 %37, %225
  %227 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %201
  store i32 %226, ptr %227, align 4, !alias.scope !18, !noalias !25
  %228 = or disjoint i64 %201, 1
  %229 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %228
  %230 = load i32, ptr %229, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %231 = shl i32 %230, %.fr12
  %232 = lshr i32 %230, %16
  %233 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %228
  %234 = load i32, ptr %233, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %235 = or disjoint i32 %231, %232
  %236 = add i32 %234, %230
  %237 = xor i32 %235, %236
  %238 = shl i32 %237, %.fr
  %239 = lshr i32 %237, %21
  %240 = or disjoint i32 %238, %239
  %241 = add i32 %237, %236
  %242 = xor i32 %240, %241
  %243 = shl i32 %242, %.fr13
  %244 = add i32 %242, %241
  %245 = xor i32 %243, %244
  %246 = shl i32 %245, %.fr14
  %247 = select i1 %32, i32 %246, i32 0
  %248 = lshr i32 %245, %31
  %249 = select i1 %33, i32 %248, i32 0
  %250 = add i32 %245, %244
  %251 = or i32 %247, %249
  %252 = xor i32 %251, %250
  %253 = add i32 %37, %252
  %254 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %228
  store i32 %253, ptr %254, align 4, !alias.scope !18, !noalias !25
  %255 = add nuw nsw i64 %200, 1
  %exitcond27.not = icmp eq i64 %255, 10
  br i1 %exitcond27.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us.us.us, !llvm.loop !26

.split.us.us.us.us.us:                            ; preds = %.split4.us.split.us.split.us.split.us, %.split.us.us.us.us.us
  %256 = phi i64 [ %313, %.split.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us ]
  %257 = shl nuw nsw i64 %256, 1
  %258 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %257
  %259 = load i32, ptr %258, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %260 = shl i32 %259, %.fr12
  %261 = lshr i32 %259, %16
  %262 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %257
  %263 = load i32, ptr %262, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %264 = or disjoint i32 %260, %261
  %265 = add i32 %263, %259
  %266 = xor i32 %264, %265
  %267 = shl i32 %266, %.fr
  %268 = lshr i32 %266, %21
  %269 = or disjoint i32 %267, %268
  %270 = add i32 %266, %265
  %271 = xor i32 %269, %270
  %272 = lshr i32 %271, %26
  %273 = select i1 %28, i32 %272, i32 0
  %274 = add i32 %271, %270
  %275 = xor i32 %273, %274
  %276 = shl i32 %275, %.fr14
  %277 = select i1 %32, i32 %276, i32 0
  %278 = lshr i32 %275, %31
  %279 = select i1 %33, i32 %278, i32 0
  %280 = add i32 %275, %274
  %281 = or i32 %277, %279
  %282 = xor i32 %281, %280
  %283 = add i32 %37, %282
  %284 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %257
  store i32 %283, ptr %284, align 4, !alias.scope !18, !noalias !25
  %285 = or disjoint i64 %257, 1
  %286 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %285
  %287 = load i32, ptr %286, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %288 = shl i32 %287, %.fr12
  %289 = lshr i32 %287, %16
  %290 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %285
  %291 = load i32, ptr %290, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %292 = or disjoint i32 %288, %289
  %293 = add i32 %291, %287
  %294 = xor i32 %292, %293
  %295 = shl i32 %294, %.fr
  %296 = lshr i32 %294, %21
  %297 = or disjoint i32 %295, %296
  %298 = add i32 %294, %293
  %299 = xor i32 %297, %298
  %300 = lshr i32 %299, %26
  %301 = select i1 %28, i32 %300, i32 0
  %302 = add i32 %299, %298
  %303 = xor i32 %301, %302
  %304 = shl i32 %303, %.fr14
  %305 = select i1 %32, i32 %304, i32 0
  %306 = lshr i32 %303, %31
  %307 = select i1 %33, i32 %306, i32 0
  %308 = add i32 %303, %302
  %309 = or i32 %305, %307
  %310 = xor i32 %309, %308
  %311 = add i32 %37, %310
  %312 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %285
  store i32 %311, ptr %312, align 4, !alias.scope !18, !noalias !25
  %313 = add nuw nsw i64 %256, 1
  %exitcond26.not = icmp eq i64 %313, 10
  br i1 %exitcond26.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us.us, !llvm.loop !26

.split.us.us.us.us:                               ; preds = %.split4.us.split.us.split.us, %.split.us.us.us.us
  %314 = phi i64 [ %373, %.split.us.us.us.us ], [ 0, %.split4.us.split.us.split.us ]
  %315 = shl nuw nsw i64 %314, 1
  %316 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %315
  %317 = load i32, ptr %316, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %318 = shl i32 %317, %.fr12
  %319 = lshr i32 %317, %16
  %320 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %315
  %321 = load i32, ptr %320, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %322 = or disjoint i32 %318, %319
  %323 = add i32 %321, %317
  %324 = xor i32 %322, %323
  %325 = shl i32 %324, %.fr
  %326 = add i32 %324, %323
  %327 = xor i32 %325, %326
  %328 = shl i32 %327, %.fr13
  %329 = select i1 %27, i32 %328, i32 0
  %330 = lshr i32 %327, %26
  %331 = select i1 %28, i32 %330, i32 0
  %332 = or i32 %329, %331
  %333 = add i32 %327, %326
  %334 = xor i32 %332, %333
  %335 = shl i32 %334, %.fr14
  %336 = select i1 %32, i32 %335, i32 0
  %337 = lshr i32 %334, %31
  %338 = select i1 %33, i32 %337, i32 0
  %339 = add i32 %334, %333
  %340 = or i32 %336, %338
  %341 = xor i32 %340, %339
  %342 = add i32 %37, %341
  %343 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %315
  store i32 %342, ptr %343, align 4, !alias.scope !18, !noalias !25
  %344 = or disjoint i64 %315, 1
  %345 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %344
  %346 = load i32, ptr %345, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %347 = shl i32 %346, %.fr12
  %348 = lshr i32 %346, %16
  %349 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %344
  %350 = load i32, ptr %349, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %351 = or disjoint i32 %347, %348
  %352 = add i32 %350, %346
  %353 = xor i32 %351, %352
  %354 = shl i32 %353, %.fr
  %355 = add i32 %353, %352
  %356 = xor i32 %354, %355
  %357 = shl i32 %356, %.fr13
  %358 = select i1 %27, i32 %357, i32 0
  %359 = lshr i32 %356, %26
  %360 = select i1 %28, i32 %359, i32 0
  %361 = or i32 %358, %360
  %362 = add i32 %356, %355
  %363 = xor i32 %361, %362
  %364 = shl i32 %363, %.fr14
  %365 = select i1 %32, i32 %364, i32 0
  %366 = lshr i32 %363, %31
  %367 = select i1 %33, i32 %366, i32 0
  %368 = add i32 %363, %362
  %369 = or i32 %365, %367
  %370 = xor i32 %369, %368
  %371 = add i32 %37, %370
  %372 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %344
  store i32 %371, ptr %372, align 4, !alias.scope !18, !noalias !25
  %373 = add nuw nsw i64 %314, 1
  %exitcond25.not = icmp eq i64 %373, 10
  br i1 %exitcond25.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us.us, !llvm.loop !26

.split.us.us.us:                                  ; preds = %.split4.us.split.us, %.split.us.us.us
  %374 = phi i64 [ %435, %.split.us.us.us ], [ 0, %.split4.us.split.us ]
  %375 = shl nuw nsw i64 %374, 1
  %376 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %375
  %377 = load i32, ptr %376, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %378 = shl i32 %377, %.fr12
  %379 = lshr i32 %377, %16
  %380 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %375
  %381 = load i32, ptr %380, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %382 = or disjoint i32 %378, %379
  %383 = add i32 %381, %377
  %384 = xor i32 %382, %383
  %385 = lshr i32 %384, %21
  %386 = select i1 %23, i32 %385, i32 0
  %387 = add i32 %384, %383
  %388 = xor i32 %386, %387
  %389 = shl i32 %388, %.fr13
  %390 = select i1 %27, i32 %389, i32 0
  %391 = lshr i32 %388, %26
  %392 = select i1 %28, i32 %391, i32 0
  %393 = or i32 %390, %392
  %394 = add i32 %388, %387
  %395 = xor i32 %393, %394
  %396 = shl i32 %395, %.fr14
  %397 = select i1 %32, i32 %396, i32 0
  %398 = lshr i32 %395, %31
  %399 = select i1 %33, i32 %398, i32 0
  %400 = add i32 %395, %394
  %401 = or i32 %397, %399
  %402 = xor i32 %401, %400
  %403 = add i32 %37, %402
  %404 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %375
  store i32 %403, ptr %404, align 4, !alias.scope !18, !noalias !25
  %405 = or disjoint i64 %375, 1
  %406 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %405
  %407 = load i32, ptr %406, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %408 = shl i32 %407, %.fr12
  %409 = lshr i32 %407, %16
  %410 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %405
  %411 = load i32, ptr %410, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %412 = or disjoint i32 %408, %409
  %413 = add i32 %411, %407
  %414 = xor i32 %412, %413
  %415 = lshr i32 %414, %21
  %416 = select i1 %23, i32 %415, i32 0
  %417 = add i32 %414, %413
  %418 = xor i32 %416, %417
  %419 = shl i32 %418, %.fr13
  %420 = select i1 %27, i32 %419, i32 0
  %421 = lshr i32 %418, %26
  %422 = select i1 %28, i32 %421, i32 0
  %423 = or i32 %420, %422
  %424 = add i32 %418, %417
  %425 = xor i32 %423, %424
  %426 = shl i32 %425, %.fr14
  %427 = select i1 %32, i32 %426, i32 0
  %428 = lshr i32 %425, %31
  %429 = select i1 %33, i32 %428, i32 0
  %430 = add i32 %425, %424
  %431 = or i32 %427, %429
  %432 = xor i32 %431, %430
  %433 = add i32 %37, %432
  %434 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %405
  store i32 %433, ptr %434, align 4, !alias.scope !18, !noalias !25
  %435 = add nuw nsw i64 %374, 1
  %exitcond24.not = icmp eq i64 %435, 10
  br i1 %exitcond24.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us.us, !llvm.loop !26

.split.us.us:                                     ; preds = %.split4.us, %.split.us.us
  %436 = phi i64 [ %499, %.split.us.us ], [ 0, %.split4.us ]
  %437 = shl nuw nsw i64 %436, 1
  %438 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %437
  %439 = load i32, ptr %438, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %440 = shl i32 %439, %.fr12
  %441 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %437
  %442 = load i32, ptr %441, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %443 = add i32 %442, %439
  %444 = xor i32 %440, %443
  %445 = shl i32 %444, %.fr
  %446 = select i1 %22, i32 %445, i32 0
  %447 = lshr i32 %444, %21
  %448 = select i1 %23, i32 %447, i32 0
  %449 = or i32 %446, %448
  %450 = add i32 %444, %443
  %451 = xor i32 %449, %450
  %452 = shl i32 %451, %.fr13
  %453 = select i1 %27, i32 %452, i32 0
  %454 = lshr i32 %451, %26
  %455 = select i1 %28, i32 %454, i32 0
  %456 = or i32 %453, %455
  %457 = add i32 %451, %450
  %458 = xor i32 %456, %457
  %459 = shl i32 %458, %.fr14
  %460 = select i1 %32, i32 %459, i32 0
  %461 = lshr i32 %458, %31
  %462 = select i1 %33, i32 %461, i32 0
  %463 = add i32 %458, %457
  %464 = or i32 %460, %462
  %465 = xor i32 %464, %463
  %466 = add i32 %37, %465
  %467 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %437
  store i32 %466, ptr %467, align 4, !alias.scope !18, !noalias !25
  %468 = or disjoint i64 %437, 1
  %469 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %468
  %470 = load i32, ptr %469, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %471 = shl i32 %470, %.fr12
  %472 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %468
  %473 = load i32, ptr %472, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %474 = add i32 %473, %470
  %475 = xor i32 %471, %474
  %476 = shl i32 %475, %.fr
  %477 = select i1 %22, i32 %476, i32 0
  %478 = lshr i32 %475, %21
  %479 = select i1 %23, i32 %478, i32 0
  %480 = or i32 %477, %479
  %481 = add i32 %475, %474
  %482 = xor i32 %480, %481
  %483 = shl i32 %482, %.fr13
  %484 = select i1 %27, i32 %483, i32 0
  %485 = lshr i32 %482, %26
  %486 = select i1 %28, i32 %485, i32 0
  %487 = or i32 %484, %486
  %488 = add i32 %482, %481
  %489 = xor i32 %487, %488
  %490 = shl i32 %489, %.fr14
  %491 = select i1 %32, i32 %490, i32 0
  %492 = lshr i32 %489, %31
  %493 = select i1 %33, i32 %492, i32 0
  %494 = add i32 %489, %488
  %495 = or i32 %491, %493
  %496 = xor i32 %495, %494
  %497 = add i32 %37, %496
  %498 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %468
  store i32 %497, ptr %498, align 4, !alias.scope !18, !noalias !25
  %499 = add nuw nsw i64 %436, 1
  %exitcond23.not = icmp eq i64 %499, 10
  br i1 %exitcond23.not, label %broadcast_add_fusion_wrapped.exit, label %.split.us.us, !llvm.loop !26

.split:                                           ; preds = %1, %.split
  %500 = phi i64 [ %565, %.split ], [ 0, %1 ]
  %501 = shl nuw nsw i64 %500, 1
  %502 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %501
  %503 = load i32, ptr %502, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %504 = lshr i32 %503, %16
  %505 = select i1 %18, i32 %504, i32 0
  %506 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %501
  %507 = load i32, ptr %506, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %508 = add i32 %507, %503
  %509 = xor i32 %505, %508
  %510 = shl i32 %509, %.fr
  %511 = select i1 %22, i32 %510, i32 0
  %512 = lshr i32 %509, %21
  %513 = select i1 %23, i32 %512, i32 0
  %514 = or i32 %511, %513
  %515 = add i32 %509, %508
  %516 = xor i32 %514, %515
  %517 = shl i32 %516, %.fr13
  %518 = select i1 %27, i32 %517, i32 0
  %519 = lshr i32 %516, %26
  %520 = select i1 %28, i32 %519, i32 0
  %521 = or i32 %518, %520
  %522 = add i32 %516, %515
  %523 = xor i32 %521, %522
  %524 = shl i32 %523, %.fr14
  %525 = select i1 %32, i32 %524, i32 0
  %526 = lshr i32 %523, %31
  %527 = select i1 %33, i32 %526, i32 0
  %528 = add i32 %523, %522
  %529 = or i32 %525, %527
  %530 = xor i32 %529, %528
  %531 = add i32 %37, %530
  %532 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %501
  store i32 %531, ptr %532, align 4, !alias.scope !18, !noalias !25
  %533 = or disjoint i64 %501, 1
  %534 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %533
  %535 = load i32, ptr %534, align 4, !invariant.load !3, !alias.scope !12, !noalias !23
  %536 = lshr i32 %535, %16
  %537 = select i1 %18, i32 %536, i32 0
  %538 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %533
  %539 = load i32, ptr %538, align 4, !invariant.load !3, !alias.scope !14, !noalias !24
  %540 = add i32 %539, %535
  %541 = xor i32 %537, %540
  %542 = shl i32 %541, %.fr
  %543 = select i1 %22, i32 %542, i32 0
  %544 = lshr i32 %541, %21
  %545 = select i1 %23, i32 %544, i32 0
  %546 = or i32 %543, %545
  %547 = add i32 %541, %540
  %548 = xor i32 %546, %547
  %549 = shl i32 %548, %.fr13
  %550 = select i1 %27, i32 %549, i32 0
  %551 = lshr i32 %548, %26
  %552 = select i1 %28, i32 %551, i32 0
  %553 = or i32 %550, %552
  %554 = add i32 %548, %547
  %555 = xor i32 %553, %554
  %556 = shl i32 %555, %.fr14
  %557 = select i1 %32, i32 %556, i32 0
  %558 = lshr i32 %555, %31
  %559 = select i1 %33, i32 %558, i32 0
  %560 = add i32 %555, %554
  %561 = or i32 %557, %559
  %562 = xor i32 %561, %560
  %563 = add i32 %37, %562
  %564 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %533
  store i32 %563, ptr %564, align 4, !alias.scope !18, !noalias !25
  %565 = add nuw nsw i64 %500, 1
  %exitcond.not = icmp eq i64 %565, 10
  br i1 %exitcond.not, label %broadcast_add_fusion_wrapped.exit, label %.split, !llvm.loop !26

broadcast_add_fusion_wrapped.exit:                ; preds = %.split, %.split.us.us, %.split.us.us.us, %.split.us.us.us.us, %.split.us.us.us.us.us, %.split.us.us.us.us.us.us, %.split.us.us.us.us.us.us.us, %.split.us.us.us.us.us.us.us.us, %.split.us.us.us.us.us.us.us.us.us
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
!4 = !{i64 4}
!5 = !{i64 16}
!6 = !{i64 80}
!7 = !{!8}
!8 = distinct !{!8, !9, !"broadcast_add_fusion_wrapped: argument 0"}
!9 = distinct !{!9, !"broadcast_add_fusion_wrapped"}
!10 = !{!11}
!11 = distinct !{!11, !9, !"broadcast_add_fusion_wrapped: argument 1"}
!12 = !{!13}
!13 = distinct !{!13, !9, !"broadcast_add_fusion_wrapped: argument 2"}
!14 = !{!15}
!15 = distinct !{!15, !9, !"broadcast_add_fusion_wrapped: argument 3"}
!16 = !{!17}
!17 = distinct !{!17, !9, !"broadcast_add_fusion_wrapped: argument 4"}
!18 = !{!19}
!19 = distinct !{!19, !9, !"broadcast_add_fusion_wrapped: argument 5"}
!20 = !{!8, !13, !15, !17, !19}
!21 = !{!11, !13, !15, !17, !19}
!22 = !{!8, !11, !13, !15, !19}
!23 = !{!8, !11, !15, !17, !19}
!24 = !{!8, !11, !13, !17, !19}
!25 = !{!8, !11, !13, !15, !17}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
