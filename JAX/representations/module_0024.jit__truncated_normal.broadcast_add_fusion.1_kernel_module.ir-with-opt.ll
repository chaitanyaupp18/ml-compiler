; ModuleID = '__compute_module_broadcast_add_fusion.1_kernel_module'
source_filename = "__compute_module_broadcast_add_fusion.1_kernel_module"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-darwin25.5.0"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.1(ptr nofree readonly captures(none) %0) local_unnamed_addr #0 {
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
  %12 = load ptr, ptr %11, align 8, !invariant.load !3, !dereferenceable !6
  tail call void @llvm.experimental.noalias.scope.decl(metadata !7)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !14)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !16)
  %13 = load i32, ptr %6, align 4, !invariant.load !3, !alias.scope !10, !noalias !18
  %.fr17 = freeze i32 %13
  %14 = sub i32 32, %.fr17
  %15 = icmp ult i32 %.fr17, 32
  %16 = icmp ult i32 %14, 32
  %17 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %18 = load i32, ptr %17, align 4, !invariant.load !3, !alias.scope !10, !noalias !18
  %.fr = freeze i32 %18
  %19 = sub i32 32, %.fr
  %20 = icmp ult i32 %.fr, 32
  %21 = icmp ult i32 %19, 32
  %22 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %23 = load i32, ptr %22, align 4, !invariant.load !3, !alias.scope !10, !noalias !18
  %.fr18 = freeze i32 %23
  %24 = sub i32 32, %.fr18
  %25 = icmp ult i32 %.fr18, 32
  %26 = icmp ult i32 %24, 32
  %27 = load i32, ptr %4, align 4, !invariant.load !3, !alias.scope !7, !noalias !19
  br i1 %15, label %.split4.us, label %.split

.split4.us:                                       ; preds = %1
  br i1 %16, label %.split4.us.split.us, label %.split.us.us

.split4.us.split.us:                              ; preds = %.split4.us
  br i1 %20, label %.split4.us.split.us.split.us, label %.split.us.us.us

.split4.us.split.us.split.us:                     ; preds = %.split4.us.split.us
  br i1 %21, label %.split4.us.split.us.split.us.split.us, label %.split4.us.split.us.split.us.split

.split4.us.split.us.split.us.split.us:            ; preds = %.split4.us.split.us.split.us
  br i1 %25, label %.split4.us.split.us.split.us.split.us.split.us, label %.split4.us.split.us.split.us.split.us.split

.split4.us.split.us.split.us.split.us.split.us:   ; preds = %.split4.us.split.us.split.us.split.us
  br i1 %26, label %.split.us.us.us.us.us.us.us, label %.split.us.us.us.us.us.us

.split.us.us.us.us.us.us.us:                      ; preds = %.split4.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us.us
  %28 = phi i64 [ %75, %.split.us.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us ]
  %29 = shl nuw nsw i64 %28, 1
  %30 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %32 = shl i32 %31, %.fr17
  %33 = lshr i32 %31, %14
  %34 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %29
  %35 = load i32, ptr %34, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %36 = or disjoint i32 %32, %33
  %37 = add i32 %35, %31
  %38 = xor i32 %36, %37
  %39 = shl i32 %38, %.fr
  %40 = lshr i32 %38, %19
  %41 = or disjoint i32 %39, %40
  %42 = add i32 %38, %37
  %43 = xor i32 %41, %42
  %44 = shl i32 %43, %.fr18
  %45 = lshr i32 %43, %24
  %46 = or disjoint i32 %44, %45
  %47 = add i32 %43, %42
  %48 = xor i32 %46, %47
  %49 = add i32 %47, %27
  %50 = add i32 %49, %48
  %51 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %29
  store i32 %50, ptr %51, align 4, !alias.scope !16, !noalias !22
  %52 = or disjoint i64 %29, 1
  %53 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %52
  %54 = load i32, ptr %53, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %55 = shl i32 %54, %.fr17
  %56 = lshr i32 %54, %14
  %57 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %52
  %58 = load i32, ptr %57, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %59 = or disjoint i32 %55, %56
  %60 = add i32 %58, %54
  %61 = xor i32 %59, %60
  %62 = shl i32 %61, %.fr
  %63 = lshr i32 %61, %19
  %64 = or disjoint i32 %62, %63
  %65 = add i32 %61, %60
  %66 = xor i32 %64, %65
  %67 = shl i32 %66, %.fr18
  %68 = lshr i32 %66, %24
  %69 = or disjoint i32 %67, %68
  %70 = add i32 %66, %65
  %71 = xor i32 %69, %70
  %72 = add i32 %70, %27
  %73 = add i32 %72, %71
  %74 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %52
  store i32 %73, ptr %74, align 4, !alias.scope !16, !noalias !22
  %75 = add nuw nsw i64 %28, 1
  %exitcond36.not = icmp eq i64 %75, 10
  br i1 %exitcond36.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us.us.us, !llvm.loop !23

.split.us.us.us.us.us.us:                         ; preds = %.split4.us.split.us.split.us.split.us.split.us, %.split.us.us.us.us.us.us
  %76 = phi i64 [ %119, %.split.us.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split.us ]
  %77 = shl nuw nsw i64 %76, 1
  %78 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %77
  %79 = load i32, ptr %78, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %80 = shl i32 %79, %.fr17
  %81 = lshr i32 %79, %14
  %82 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %77
  %83 = load i32, ptr %82, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %84 = or disjoint i32 %80, %81
  %85 = add i32 %83, %79
  %86 = xor i32 %84, %85
  %87 = shl i32 %86, %.fr
  %88 = lshr i32 %86, %19
  %89 = or disjoint i32 %87, %88
  %90 = add i32 %86, %85
  %91 = xor i32 %89, %90
  %92 = shl i32 %91, %.fr18
  %93 = add i32 %91, %90
  %94 = xor i32 %92, %93
  %95 = add i32 %93, %27
  %96 = add i32 %95, %94
  %97 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %77
  store i32 %96, ptr %97, align 4, !alias.scope !16, !noalias !22
  %98 = or disjoint i64 %77, 1
  %99 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %98
  %100 = load i32, ptr %99, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %101 = shl i32 %100, %.fr17
  %102 = lshr i32 %100, %14
  %103 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %98
  %104 = load i32, ptr %103, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %105 = or disjoint i32 %101, %102
  %106 = add i32 %104, %100
  %107 = xor i32 %105, %106
  %108 = shl i32 %107, %.fr
  %109 = lshr i32 %107, %19
  %110 = or disjoint i32 %108, %109
  %111 = add i32 %107, %106
  %112 = xor i32 %110, %111
  %113 = shl i32 %112, %.fr18
  %114 = add i32 %112, %111
  %115 = xor i32 %113, %114
  %116 = add i32 %114, %27
  %117 = add i32 %116, %115
  %118 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %98
  store i32 %117, ptr %118, align 4, !alias.scope !16, !noalias !22
  %119 = add nuw nsw i64 %76, 1
  %exitcond35.not = icmp eq i64 %119, 10
  br i1 %exitcond35.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us.us, !llvm.loop !23

.split4.us.split.us.split.us.split.us.split:      ; preds = %.split4.us.split.us.split.us.split.us
  br i1 %26, label %.split.us.us.us.us.us.us15, label %.split.us.us.us.us.us

.split.us.us.us.us.us.us15:                       ; preds = %.split4.us.split.us.split.us.split.us.split, %.split.us.us.us.us.us.us15
  %120 = phi i64 [ %163, %.split.us.us.us.us.us.us15 ], [ 0, %.split4.us.split.us.split.us.split.us.split ]
  %121 = shl nuw nsw i64 %120, 1
  %122 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %121
  %123 = load i32, ptr %122, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %124 = shl i32 %123, %.fr17
  %125 = lshr i32 %123, %14
  %126 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %121
  %127 = load i32, ptr %126, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %128 = or disjoint i32 %124, %125
  %129 = add i32 %127, %123
  %130 = xor i32 %128, %129
  %131 = shl i32 %130, %.fr
  %132 = lshr i32 %130, %19
  %133 = or disjoint i32 %131, %132
  %134 = add i32 %130, %129
  %135 = xor i32 %133, %134
  %136 = lshr i32 %135, %24
  %137 = add i32 %135, %134
  %138 = xor i32 %136, %137
  %139 = add i32 %137, %27
  %140 = add i32 %139, %138
  %141 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %121
  store i32 %140, ptr %141, align 4, !alias.scope !16, !noalias !22
  %142 = or disjoint i64 %121, 1
  %143 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %142
  %144 = load i32, ptr %143, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %145 = shl i32 %144, %.fr17
  %146 = lshr i32 %144, %14
  %147 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %142
  %148 = load i32, ptr %147, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %149 = or disjoint i32 %145, %146
  %150 = add i32 %148, %144
  %151 = xor i32 %149, %150
  %152 = shl i32 %151, %.fr
  %153 = lshr i32 %151, %19
  %154 = or disjoint i32 %152, %153
  %155 = add i32 %151, %150
  %156 = xor i32 %154, %155
  %157 = lshr i32 %156, %24
  %158 = add i32 %156, %155
  %159 = xor i32 %157, %158
  %160 = add i32 %158, %27
  %161 = add i32 %160, %159
  %162 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %142
  store i32 %161, ptr %162, align 4, !alias.scope !16, !noalias !22
  %163 = add nuw nsw i64 %120, 1
  %exitcond34.not = icmp eq i64 %163, 10
  br i1 %exitcond34.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us.us15, !llvm.loop !23

.split.us.us.us.us.us:                            ; preds = %.split4.us.split.us.split.us.split.us.split, %.split.us.us.us.us.us
  %164 = phi i64 [ %201, %.split.us.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split.us.split ]
  %165 = shl nuw nsw i64 %164, 1
  %166 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %165
  %167 = load i32, ptr %166, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %168 = shl i32 %167, %.fr17
  %169 = lshr i32 %167, %14
  %170 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %165
  %171 = load i32, ptr %170, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %172 = or disjoint i32 %168, %169
  %173 = add i32 %171, %167
  %174 = xor i32 %172, %173
  %175 = shl i32 %174, %.fr
  %176 = lshr i32 %174, %19
  %177 = or disjoint i32 %175, %176
  %178 = add i32 %174, %173
  %179 = xor i32 %177, %178
  %180 = add i32 %179, %178
  %reass.add = shl i32 %180, 1
  %181 = add i32 %27, %reass.add
  %182 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %165
  store i32 %181, ptr %182, align 4, !alias.scope !16, !noalias !22
  %183 = or disjoint i64 %165, 1
  %184 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %183
  %185 = load i32, ptr %184, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %186 = shl i32 %185, %.fr17
  %187 = lshr i32 %185, %14
  %188 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %183
  %189 = load i32, ptr %188, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %190 = or disjoint i32 %186, %187
  %191 = add i32 %189, %185
  %192 = xor i32 %190, %191
  %193 = shl i32 %192, %.fr
  %194 = lshr i32 %192, %19
  %195 = or disjoint i32 %193, %194
  %196 = add i32 %192, %191
  %197 = xor i32 %195, %196
  %198 = add i32 %197, %196
  %reass.add.1 = shl i32 %198, 1
  %199 = add i32 %27, %reass.add.1
  %200 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %183
  store i32 %199, ptr %200, align 4, !alias.scope !16, !noalias !22
  %201 = add nuw nsw i64 %164, 1
  %exitcond33.not = icmp eq i64 %201, 10
  br i1 %exitcond33.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us, !llvm.loop !23

.split4.us.split.us.split.us.split:               ; preds = %.split4.us.split.us.split.us
  br i1 %25, label %.split4.us.split.us.split.us.split.split.us, label %.split.us.us.us.us

.split4.us.split.us.split.us.split.split.us:      ; preds = %.split4.us.split.us.split.us.split
  br i1 %26, label %.split.us.us.us.us.us10.us, label %.split.us.us.us.us.us10

.split.us.us.us.us.us10.us:                       ; preds = %.split4.us.split.us.split.us.split.split.us, %.split.us.us.us.us.us10.us
  %202 = phi i64 [ %245, %.split.us.us.us.us.us10.us ], [ 0, %.split4.us.split.us.split.us.split.split.us ]
  %203 = shl nuw nsw i64 %202, 1
  %204 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %203
  %205 = load i32, ptr %204, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %206 = shl i32 %205, %.fr17
  %207 = lshr i32 %205, %14
  %208 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %203
  %209 = load i32, ptr %208, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %210 = or disjoint i32 %206, %207
  %211 = add i32 %209, %205
  %212 = xor i32 %210, %211
  %213 = shl i32 %212, %.fr
  %214 = add i32 %212, %211
  %215 = xor i32 %213, %214
  %216 = shl i32 %215, %.fr18
  %217 = lshr i32 %215, %24
  %218 = or disjoint i32 %216, %217
  %219 = add i32 %215, %214
  %220 = xor i32 %218, %219
  %221 = add i32 %219, %27
  %222 = add i32 %221, %220
  %223 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %203
  store i32 %222, ptr %223, align 4, !alias.scope !16, !noalias !22
  %224 = or disjoint i64 %203, 1
  %225 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %224
  %226 = load i32, ptr %225, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %227 = shl i32 %226, %.fr17
  %228 = lshr i32 %226, %14
  %229 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %224
  %230 = load i32, ptr %229, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %231 = or disjoint i32 %227, %228
  %232 = add i32 %230, %226
  %233 = xor i32 %231, %232
  %234 = shl i32 %233, %.fr
  %235 = add i32 %233, %232
  %236 = xor i32 %234, %235
  %237 = shl i32 %236, %.fr18
  %238 = lshr i32 %236, %24
  %239 = or disjoint i32 %237, %238
  %240 = add i32 %236, %235
  %241 = xor i32 %239, %240
  %242 = add i32 %240, %27
  %243 = add i32 %242, %241
  %244 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %224
  store i32 %243, ptr %244, align 4, !alias.scope !16, !noalias !22
  %245 = add nuw nsw i64 %202, 1
  %exitcond32.not = icmp eq i64 %245, 10
  br i1 %exitcond32.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us10.us, !llvm.loop !23

.split.us.us.us.us.us10:                          ; preds = %.split4.us.split.us.split.us.split.split.us, %.split.us.us.us.us.us10
  %246 = phi i64 [ %285, %.split.us.us.us.us.us10 ], [ 0, %.split4.us.split.us.split.us.split.split.us ]
  %247 = shl nuw nsw i64 %246, 1
  %248 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %247
  %249 = load i32, ptr %248, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %250 = shl i32 %249, %.fr17
  %251 = lshr i32 %249, %14
  %252 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %247
  %253 = load i32, ptr %252, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %254 = or disjoint i32 %250, %251
  %255 = add i32 %253, %249
  %256 = xor i32 %254, %255
  %257 = shl i32 %256, %.fr
  %258 = add i32 %256, %255
  %259 = xor i32 %257, %258
  %260 = shl i32 %259, %.fr18
  %261 = add i32 %259, %258
  %262 = xor i32 %260, %261
  %263 = add i32 %261, %27
  %264 = add i32 %263, %262
  %265 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %247
  store i32 %264, ptr %265, align 4, !alias.scope !16, !noalias !22
  %266 = or disjoint i64 %247, 1
  %267 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %266
  %268 = load i32, ptr %267, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %269 = shl i32 %268, %.fr17
  %270 = lshr i32 %268, %14
  %271 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %266
  %272 = load i32, ptr %271, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %273 = or disjoint i32 %269, %270
  %274 = add i32 %272, %268
  %275 = xor i32 %273, %274
  %276 = shl i32 %275, %.fr
  %277 = add i32 %275, %274
  %278 = xor i32 %276, %277
  %279 = shl i32 %278, %.fr18
  %280 = add i32 %278, %277
  %281 = xor i32 %279, %280
  %282 = add i32 %280, %27
  %283 = add i32 %282, %281
  %284 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %266
  store i32 %283, ptr %284, align 4, !alias.scope !16, !noalias !22
  %285 = add nuw nsw i64 %246, 1
  %exitcond31.not = icmp eq i64 %285, 10
  br i1 %exitcond31.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us.us10, !llvm.loop !23

.split.us.us.us.us:                               ; preds = %.split4.us.split.us.split.us.split, %.split.us.us.us.us
  %286 = phi i64 [ %327, %.split.us.us.us.us ], [ 0, %.split4.us.split.us.split.us.split ]
  %287 = shl nuw nsw i64 %286, 1
  %288 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %287
  %289 = load i32, ptr %288, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %290 = shl i32 %289, %.fr17
  %291 = lshr i32 %289, %14
  %292 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %287
  %293 = load i32, ptr %292, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %294 = or disjoint i32 %290, %291
  %295 = add i32 %293, %289
  %296 = xor i32 %294, %295
  %297 = shl i32 %296, %.fr
  %298 = add i32 %296, %295
  %299 = xor i32 %297, %298
  %300 = lshr i32 %299, %24
  %301 = select i1 %26, i32 %300, i32 0
  %302 = add i32 %299, %298
  %303 = xor i32 %301, %302
  %304 = add i32 %302, %27
  %305 = add i32 %304, %303
  %306 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %287
  store i32 %305, ptr %306, align 4, !alias.scope !16, !noalias !22
  %307 = or disjoint i64 %287, 1
  %308 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %307
  %309 = load i32, ptr %308, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %310 = shl i32 %309, %.fr17
  %311 = lshr i32 %309, %14
  %312 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %307
  %313 = load i32, ptr %312, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %314 = or disjoint i32 %310, %311
  %315 = add i32 %313, %309
  %316 = xor i32 %314, %315
  %317 = shl i32 %316, %.fr
  %318 = add i32 %316, %315
  %319 = xor i32 %317, %318
  %320 = lshr i32 %319, %24
  %321 = select i1 %26, i32 %320, i32 0
  %322 = add i32 %319, %318
  %323 = xor i32 %321, %322
  %324 = add i32 %322, %27
  %325 = add i32 %324, %323
  %326 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %307
  store i32 %325, ptr %326, align 4, !alias.scope !16, !noalias !22
  %327 = add nuw nsw i64 %286, 1
  %exitcond30.not = icmp eq i64 %327, 10
  br i1 %exitcond30.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us.us, !llvm.loop !23

.split.us.us.us:                                  ; preds = %.split4.us.split.us, %.split.us.us.us
  %328 = phi i64 [ %377, %.split.us.us.us ], [ 0, %.split4.us.split.us ]
  %329 = shl nuw nsw i64 %328, 1
  %330 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %329
  %331 = load i32, ptr %330, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %332 = shl i32 %331, %.fr17
  %333 = lshr i32 %331, %14
  %334 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %329
  %335 = load i32, ptr %334, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %336 = or disjoint i32 %332, %333
  %337 = add i32 %335, %331
  %338 = xor i32 %336, %337
  %339 = lshr i32 %338, %19
  %340 = select i1 %21, i32 %339, i32 0
  %341 = add i32 %338, %337
  %342 = xor i32 %340, %341
  %343 = shl i32 %342, %.fr18
  %344 = select i1 %25, i32 %343, i32 0
  %345 = lshr i32 %342, %24
  %346 = select i1 %26, i32 %345, i32 0
  %347 = or i32 %344, %346
  %348 = add i32 %342, %341
  %349 = xor i32 %347, %348
  %350 = add i32 %348, %27
  %351 = add i32 %350, %349
  %352 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %329
  store i32 %351, ptr %352, align 4, !alias.scope !16, !noalias !22
  %353 = or disjoint i64 %329, 1
  %354 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %353
  %355 = load i32, ptr %354, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %356 = shl i32 %355, %.fr17
  %357 = lshr i32 %355, %14
  %358 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %353
  %359 = load i32, ptr %358, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %360 = or disjoint i32 %356, %357
  %361 = add i32 %359, %355
  %362 = xor i32 %360, %361
  %363 = lshr i32 %362, %19
  %364 = select i1 %21, i32 %363, i32 0
  %365 = add i32 %362, %361
  %366 = xor i32 %364, %365
  %367 = shl i32 %366, %.fr18
  %368 = select i1 %25, i32 %367, i32 0
  %369 = lshr i32 %366, %24
  %370 = select i1 %26, i32 %369, i32 0
  %371 = or i32 %368, %370
  %372 = add i32 %366, %365
  %373 = xor i32 %371, %372
  %374 = add i32 %372, %27
  %375 = add i32 %374, %373
  %376 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %353
  store i32 %375, ptr %376, align 4, !alias.scope !16, !noalias !22
  %377 = add nuw nsw i64 %328, 1
  %exitcond29.not = icmp eq i64 %377, 10
  br i1 %exitcond29.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us.us, !llvm.loop !23

.split.us.us:                                     ; preds = %.split4.us, %.split.us.us
  %378 = phi i64 [ %429, %.split.us.us ], [ 0, %.split4.us ]
  %379 = shl nuw nsw i64 %378, 1
  %380 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %379
  %381 = load i32, ptr %380, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %382 = shl i32 %381, %.fr17
  %383 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %379
  %384 = load i32, ptr %383, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %385 = add i32 %384, %381
  %386 = xor i32 %382, %385
  %387 = shl i32 %386, %.fr
  %388 = select i1 %20, i32 %387, i32 0
  %389 = lshr i32 %386, %19
  %390 = select i1 %21, i32 %389, i32 0
  %391 = or i32 %388, %390
  %392 = add i32 %386, %385
  %393 = xor i32 %391, %392
  %394 = shl i32 %393, %.fr18
  %395 = select i1 %25, i32 %394, i32 0
  %396 = lshr i32 %393, %24
  %397 = select i1 %26, i32 %396, i32 0
  %398 = or i32 %395, %397
  %399 = add i32 %393, %392
  %400 = xor i32 %398, %399
  %401 = add i32 %399, %27
  %402 = add i32 %401, %400
  %403 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %379
  store i32 %402, ptr %403, align 4, !alias.scope !16, !noalias !22
  %404 = or disjoint i64 %379, 1
  %405 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %404
  %406 = load i32, ptr %405, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %407 = shl i32 %406, %.fr17
  %408 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %404
  %409 = load i32, ptr %408, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %410 = add i32 %409, %406
  %411 = xor i32 %407, %410
  %412 = shl i32 %411, %.fr
  %413 = select i1 %20, i32 %412, i32 0
  %414 = lshr i32 %411, %19
  %415 = select i1 %21, i32 %414, i32 0
  %416 = or i32 %413, %415
  %417 = add i32 %411, %410
  %418 = xor i32 %416, %417
  %419 = shl i32 %418, %.fr18
  %420 = select i1 %25, i32 %419, i32 0
  %421 = lshr i32 %418, %24
  %422 = select i1 %26, i32 %421, i32 0
  %423 = or i32 %420, %422
  %424 = add i32 %418, %417
  %425 = xor i32 %423, %424
  %426 = add i32 %424, %27
  %427 = add i32 %426, %425
  %428 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %404
  store i32 %427, ptr %428, align 4, !alias.scope !16, !noalias !22
  %429 = add nuw nsw i64 %378, 1
  %exitcond28.not = icmp eq i64 %429, 10
  br i1 %exitcond28.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split.us.us, !llvm.loop !23

.split:                                           ; preds = %1, %.split
  %430 = phi i64 [ %483, %.split ], [ 0, %1 ]
  %431 = shl nuw nsw i64 %430, 1
  %432 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %431
  %433 = load i32, ptr %432, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %434 = lshr i32 %433, %14
  %435 = select i1 %16, i32 %434, i32 0
  %436 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %431
  %437 = load i32, ptr %436, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %438 = add i32 %437, %433
  %439 = xor i32 %435, %438
  %440 = shl i32 %439, %.fr
  %441 = select i1 %20, i32 %440, i32 0
  %442 = lshr i32 %439, %19
  %443 = select i1 %21, i32 %442, i32 0
  %444 = or i32 %441, %443
  %445 = add i32 %439, %438
  %446 = xor i32 %444, %445
  %447 = shl i32 %446, %.fr18
  %448 = select i1 %25, i32 %447, i32 0
  %449 = lshr i32 %446, %24
  %450 = select i1 %26, i32 %449, i32 0
  %451 = or i32 %448, %450
  %452 = add i32 %446, %445
  %453 = xor i32 %451, %452
  %454 = add i32 %452, %27
  %455 = add i32 %454, %453
  %456 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %431
  store i32 %455, ptr %456, align 4, !alias.scope !16, !noalias !22
  %457 = or disjoint i64 %431, 1
  %458 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %457
  %459 = load i32, ptr %458, align 4, !invariant.load !3, !alias.scope !12, !noalias !20
  %460 = lshr i32 %459, %14
  %461 = select i1 %16, i32 %460, i32 0
  %462 = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %457
  %463 = load i32, ptr %462, align 4, !invariant.load !3, !alias.scope !14, !noalias !21
  %464 = add i32 %463, %459
  %465 = xor i32 %461, %464
  %466 = shl i32 %465, %.fr
  %467 = select i1 %20, i32 %466, i32 0
  %468 = lshr i32 %465, %19
  %469 = select i1 %21, i32 %468, i32 0
  %470 = or i32 %467, %469
  %471 = add i32 %465, %464
  %472 = xor i32 %470, %471
  %473 = shl i32 %472, %.fr18
  %474 = select i1 %25, i32 %473, i32 0
  %475 = lshr i32 %472, %24
  %476 = select i1 %26, i32 %475, i32 0
  %477 = or i32 %474, %476
  %478 = add i32 %472, %471
  %479 = xor i32 %477, %478
  %480 = add i32 %478, %27
  %481 = add i32 %480, %479
  %482 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %457
  store i32 %481, ptr %482, align 4, !alias.scope !16, !noalias !22
  %483 = add nuw nsw i64 %430, 1
  %exitcond.not = icmp eq i64 %483, 10
  br i1 %exitcond.not, label %broadcast_add_fusion.1_wrapped.exit, label %.split, !llvm.loop !23

broadcast_add_fusion.1_wrapped.exit:              ; preds = %.split, %.split.us.us, %.split.us.us.us, %.split.us.us.us.us, %.split.us.us.us.us.us10, %.split.us.us.us.us.us10.us, %.split.us.us.us.us.us, %.split.us.us.us.us.us.us15, %.split.us.us.us.us.us.us, %.split.us.us.us.us.us.us.us
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, target_mem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 1}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 4}
!5 = !{i64 16}
!6 = !{i64 80}
!7 = !{!8}
!8 = distinct !{!8, !9, !"broadcast_add_fusion.1_wrapped: argument 0"}
!9 = distinct !{!9, !"broadcast_add_fusion.1_wrapped"}
!10 = !{!11}
!11 = distinct !{!11, !9, !"broadcast_add_fusion.1_wrapped: argument 1"}
!12 = !{!13}
!13 = distinct !{!13, !9, !"broadcast_add_fusion.1_wrapped: argument 2"}
!14 = !{!15}
!15 = distinct !{!15, !9, !"broadcast_add_fusion.1_wrapped: argument 3"}
!16 = !{!17}
!17 = distinct !{!17, !9, !"broadcast_add_fusion.1_wrapped: argument 4"}
!18 = !{!8, !13, !15, !17}
!19 = !{!11, !13, !15, !17}
!20 = !{!8, !11, !15, !17}
!21 = !{!8, !11, !13, !17}
!22 = !{!8, !11, !13, !15}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
