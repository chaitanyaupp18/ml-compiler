; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_10xf32 = private constant [10 x float] [float f0x3EA61820, float f0x3E9F2161, float f0x3E1492FC, float f0xBAD174E9, float f0x3BC554CD, float f0xBED08AA4, float -7.466710e-02, float f0x3EDF45BC, float f0x3D819F63, float f0x3D7D987D], align 64
@__constant_10x5xf32 = private constant [10 x [5 x float]] [[5 x float] [float f0x3D31687F, float f0xBD924429, float f0xBDE89755, float f0xBEC9F001, float f0x3ED71BD0], [5 x float] [float f0xBECF5F03, float f0x3DAA3274, float f0xBDB4461F, float f0xBD07C8CB, float f0xBEDA1C84], [5 x float] [float f0xBACBBBD6, float f0xBE160EDA, float f0xBE8DF27D, float f0xBEADD3C4, float f0x3C1AE4A4], [5 x float] [float f0xBE228CCB, float f0x3E7A420F, float 1.454700e-01, float f0x3DAD2435, float f0xBE1B9E35], [5 x float] [float f0xBE702D34, float f0xBE943B0A, float f0x3E73E234, float f0xBE4FDEF7, float f0x3EB43949], [5 x float] [float f0xBD3131E1, float f0xBD629610, float f0xBE198492, float f0xBEE1D2C7, float -9.884410e-02], [5 x float] [float f0xBEC48B11, float f0x3EB88132, float f0xBDDC4820, float f0xBE789D17, float f0x3E151234], [5 x float] [float f0x3E3C466B, float f0x3E9E27A5, float 1.823860e-01, float f0x3E614DEB, float f0x3E995EAF], [5 x float] [float f0x3ED33B37, float f0x3C6A2C16, float f0xBEB6CBB2, float f0xBEA6FE22, float f0xBE437A64], [5 x float] [float f0xBED314BA, float f0xBDA6B620, float f0xBD91A34D, float f0xBD050E4D, float f0x3ECF910F]], align 64
@__constant_2x10xf32 = private constant [2 x [10 x float]] [[10 x float] [float f0x3DD45885, float f0xBE4FF4B7, float f0x3D71A067, float f0x3E824BFF, float f0xBD5389A6, float f0x3E8ED42D, float f0x3E81A677, float f0x3E0C8A6E, float f0xBE45FCDC, float f0xBDA843E0], [10 x float] [float f0x3E12AA05, float f0x3E905B80, float f0xBB188546, float f0x3E8961A8, float f0x3E8476AB, float f0xBD6DA83F, float f0xBE956AF7, float f0x3E4F3552, float f0x3D31558A, float f0x3C6FD117]], align 64
@__constant_2xf32 = private constant [2 x float] [float f0xBDE5E1FD, float f0x3E018039], align 64

declare ptr @malloc(i64)

define void @model(ptr %0, ptr %1) {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %1, 0
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %1, 1
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 3, 0
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 2, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 3, 1
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 1, 4, 1
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %0, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %0, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 5, 4, 0
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 5, 3, 1
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = call ptr @malloc(i64 264)
  %18 = ptrtoint ptr %17 to i64
  %19 = add i64 %18, 63
  %20 = urem i64 %19, 64
  %21 = sub i64 %19, %20
  %22 = inttoptr i64 %21 to ptr
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %17, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, ptr %22, 1
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 0, 2
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 5, 3, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 10, 3, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 10, 4, 0
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 1, 4, 1
  br label %30

30:                                               ; preds = %47, %2
  %31 = phi i64 [ %48, %47 ], [ 0, %2 ]
  %32 = icmp slt i64 %31, 5
  br i1 %32, label %33, label %49

33:                                               ; preds = %30
  br label %34

34:                                               ; preds = %37, %33
  %35 = phi i64 [ %46, %37 ], [ 0, %33 ]
  %36 = icmp slt i64 %35, 10
  br i1 %36, label %37, label %47

37:                                               ; preds = %34
  %38 = mul nuw nsw i64 %35, 5
  %39 = add nuw nsw i64 %38, %31
  %40 = getelementptr inbounds nuw float, ptr @__constant_10x5xf32, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 1
  %43 = mul nuw nsw i64 %31, 10
  %44 = add nuw nsw i64 %43, %35
  %45 = getelementptr inbounds nuw float, ptr %42, i64 %44
  store float %41, ptr %45, align 4
  %46 = add i64 %35, 1
  br label %34

47:                                               ; preds = %34
  %48 = add i64 %31, 1
  br label %30

49:                                               ; preds = %30
  %50 = call ptr @malloc(i64 184)
  %51 = ptrtoint ptr %50 to i64
  %52 = add i64 %51, 63
  %53 = urem i64 %52, 64
  %54 = sub i64 %52, %53
  %55 = inttoptr i64 %54 to ptr
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %50, 0
  %57 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %56, ptr %55, 1
  %58 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %57, i64 0, 2
  %59 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %58, i64 3, 3, 0
  %60 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %59, i64 10, 3, 1
  %61 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %60, i64 10, 4, 0
  %62 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %61, i64 1, 4, 1
  br label %63

63:                                               ; preds = %76, %49
  %64 = phi i64 [ %77, %76 ], [ 0, %49 ]
  %65 = icmp slt i64 %64, 3
  br i1 %65, label %66, label %78

66:                                               ; preds = %63
  br label %67

67:                                               ; preds = %70, %66
  %68 = phi i64 [ %75, %70 ], [ 0, %66 ]
  %69 = icmp slt i64 %68, 10
  br i1 %69, label %70, label %76

70:                                               ; preds = %67
  %71 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %72 = mul nuw nsw i64 %64, 10
  %73 = add nuw nsw i64 %72, %68
  %74 = getelementptr inbounds nuw float, ptr %71, i64 %73
  store float 0.000000e+00, ptr %74, align 4
  %75 = add i64 %68, 1
  br label %67

76:                                               ; preds = %67
  %77 = add i64 %64, 1
  br label %63

78:                                               ; preds = %63
  br label %79

79:                                               ; preds = %115, %78
  %80 = phi i64 [ %116, %115 ], [ 0, %78 ]
  %81 = icmp slt i64 %80, 3
  br i1 %81, label %82, label %117

82:                                               ; preds = %79
  br label %83

83:                                               ; preds = %113, %82
  %84 = phi i64 [ %114, %113 ], [ 0, %82 ]
  %85 = icmp slt i64 %84, 10
  br i1 %85, label %86, label %115

86:                                               ; preds = %83
  br label %87

87:                                               ; preds = %90, %86
  %88 = phi i64 [ %112, %90 ], [ 0, %86 ]
  %89 = icmp slt i64 %88, 5
  br i1 %89, label %90, label %113

90:                                               ; preds = %87
  %91 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1
  %92 = mul nuw nsw i64 %80, 5
  %93 = add nuw nsw i64 %92, %88
  %94 = getelementptr inbounds nuw float, ptr %91, i64 %93
  %95 = load float, ptr %94, align 4
  %96 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 1
  %97 = mul nuw nsw i64 %88, 10
  %98 = add nuw nsw i64 %97, %84
  %99 = getelementptr inbounds nuw float, ptr %96, i64 %98
  %100 = load float, ptr %99, align 4
  %101 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %102 = mul nuw nsw i64 %80, 10
  %103 = add nuw nsw i64 %102, %84
  %104 = getelementptr inbounds nuw float, ptr %101, i64 %103
  %105 = load float, ptr %104, align 4
  %106 = fmul float %95, %100
  %107 = fadd float %105, %106
  %108 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %109 = mul nuw nsw i64 %80, 10
  %110 = add nuw nsw i64 %109, %84
  %111 = getelementptr inbounds nuw float, ptr %108, i64 %110
  store float %107, ptr %111, align 4
  %112 = add i64 %88, 1
  br label %87

113:                                              ; preds = %87
  %114 = add i64 %84, 1
  br label %83

115:                                              ; preds = %83
  %116 = add i64 %80, 1
  br label %79

117:                                              ; preds = %79
  br label %118

118:                                              ; preds = %139, %117
  %119 = phi i64 [ %140, %139 ], [ 0, %117 ]
  %120 = icmp slt i64 %119, 3
  br i1 %120, label %121, label %141

121:                                              ; preds = %118
  br label %122

122:                                              ; preds = %125, %121
  %123 = phi i64 [ %138, %125 ], [ 0, %121 ]
  %124 = icmp slt i64 %123, 10
  br i1 %124, label %125, label %139

125:                                              ; preds = %122
  %126 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %127 = mul nuw nsw i64 %119, 10
  %128 = add nuw nsw i64 %127, %123
  %129 = getelementptr inbounds nuw float, ptr %126, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = getelementptr inbounds nuw float, ptr @__constant_10xf32, i64 %123
  %132 = load float, ptr %131, align 4
  %133 = fadd float %130, %132
  %134 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %135 = mul nuw nsw i64 %119, 10
  %136 = add nuw nsw i64 %135, %123
  %137 = getelementptr inbounds nuw float, ptr %134, i64 %136
  store float %133, ptr %137, align 4
  %138 = add i64 %123, 1
  br label %122

139:                                              ; preds = %122
  %140 = add i64 %119, 1
  br label %118

141:                                              ; preds = %118
  %142 = call ptr @malloc(i64 144)
  %143 = ptrtoint ptr %142 to i64
  %144 = add i64 %143, 63
  %145 = urem i64 %144, 64
  %146 = sub i64 %144, %145
  %147 = inttoptr i64 %146 to ptr
  %148 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } poison, ptr %142, 0
  %149 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %148, ptr %147, 1
  %150 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %149, i64 0, 2
  %151 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %150, i64 10, 3, 0
  %152 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %151, i64 2, 3, 1
  %153 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %152, i64 2, 4, 0
  %154 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %153, i64 1, 4, 1
  br label %155

155:                                              ; preds = %172, %141
  %156 = phi i64 [ %173, %172 ], [ 0, %141 ]
  %157 = icmp slt i64 %156, 10
  br i1 %157, label %158, label %174

158:                                              ; preds = %155
  br label %159

159:                                              ; preds = %162, %158
  %160 = phi i64 [ %171, %162 ], [ 0, %158 ]
  %161 = icmp slt i64 %160, 2
  br i1 %161, label %162, label %172

162:                                              ; preds = %159
  %163 = mul nuw nsw i64 %160, 10
  %164 = add nuw nsw i64 %163, %156
  %165 = getelementptr inbounds nuw float, ptr @__constant_2x10xf32, i64 %164
  %166 = load float, ptr %165, align 4
  %167 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %154, 1
  %168 = mul nuw nsw i64 %156, 2
  %169 = add nuw nsw i64 %168, %160
  %170 = getelementptr inbounds nuw float, ptr %167, i64 %169
  store float %166, ptr %170, align 4
  %171 = add i64 %160, 1
  br label %159

172:                                              ; preds = %159
  %173 = add i64 %156, 1
  br label %155

174:                                              ; preds = %155
  br label %175

175:                                              ; preds = %188, %174
  %176 = phi i64 [ %189, %188 ], [ 0, %174 ]
  %177 = icmp slt i64 %176, 3
  br i1 %177, label %178, label %190

178:                                              ; preds = %175
  br label %179

179:                                              ; preds = %182, %178
  %180 = phi i64 [ %187, %182 ], [ 0, %178 ]
  %181 = icmp slt i64 %180, 2
  br i1 %181, label %182, label %188

182:                                              ; preds = %179
  %183 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %184 = mul nuw nsw i64 %176, 2
  %185 = add nuw nsw i64 %184, %180
  %186 = getelementptr inbounds nuw float, ptr %183, i64 %185
  store float 0.000000e+00, ptr %186, align 4
  %187 = add i64 %180, 1
  br label %179

188:                                              ; preds = %179
  %189 = add i64 %176, 1
  br label %175

190:                                              ; preds = %175
  br label %191

191:                                              ; preds = %227, %190
  %192 = phi i64 [ %228, %227 ], [ 0, %190 ]
  %193 = icmp slt i64 %192, 3
  br i1 %193, label %194, label %229

194:                                              ; preds = %191
  br label %195

195:                                              ; preds = %225, %194
  %196 = phi i64 [ %226, %225 ], [ 0, %194 ]
  %197 = icmp slt i64 %196, 2
  br i1 %197, label %198, label %227

198:                                              ; preds = %195
  br label %199

199:                                              ; preds = %202, %198
  %200 = phi i64 [ %224, %202 ], [ 0, %198 ]
  %201 = icmp slt i64 %200, 10
  br i1 %201, label %202, label %225

202:                                              ; preds = %199
  %203 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  %204 = mul nuw nsw i64 %192, 10
  %205 = add nuw nsw i64 %204, %200
  %206 = getelementptr inbounds nuw float, ptr %203, i64 %205
  %207 = load float, ptr %206, align 4
  %208 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %154, 1
  %209 = mul nuw nsw i64 %200, 2
  %210 = add nuw nsw i64 %209, %196
  %211 = getelementptr inbounds nuw float, ptr %208, i64 %210
  %212 = load float, ptr %211, align 4
  %213 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %214 = mul nuw nsw i64 %192, 2
  %215 = add nuw nsw i64 %214, %196
  %216 = getelementptr inbounds nuw float, ptr %213, i64 %215
  %217 = load float, ptr %216, align 4
  %218 = fmul float %207, %212
  %219 = fadd float %217, %218
  %220 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %221 = mul nuw nsw i64 %192, 2
  %222 = add nuw nsw i64 %221, %196
  %223 = getelementptr inbounds nuw float, ptr %220, i64 %222
  store float %219, ptr %223, align 4
  %224 = add i64 %200, 1
  br label %199

225:                                              ; preds = %199
  %226 = add i64 %196, 1
  br label %195

227:                                              ; preds = %195
  %228 = add i64 %192, 1
  br label %191

229:                                              ; preds = %191
  br label %230

230:                                              ; preds = %251, %229
  %231 = phi i64 [ %252, %251 ], [ 0, %229 ]
  %232 = icmp slt i64 %231, 3
  br i1 %232, label %233, label %253

233:                                              ; preds = %230
  br label %234

234:                                              ; preds = %237, %233
  %235 = phi i64 [ %250, %237 ], [ 0, %233 ]
  %236 = icmp slt i64 %235, 2
  br i1 %236, label %237, label %251

237:                                              ; preds = %234
  %238 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %239 = mul nuw nsw i64 %231, 2
  %240 = add nuw nsw i64 %239, %235
  %241 = getelementptr inbounds nuw float, ptr %238, i64 %240
  %242 = load float, ptr %241, align 4
  %243 = getelementptr inbounds nuw float, ptr @__constant_2xf32, i64 %235
  %244 = load float, ptr %243, align 4
  %245 = fadd float %242, %244
  %246 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %247 = mul nuw nsw i64 %231, 2
  %248 = add nuw nsw i64 %247, %235
  %249 = getelementptr inbounds nuw float, ptr %246, i64 %248
  store float %245, ptr %249, align 4
  %250 = add i64 %235, 1
  br label %234

251:                                              ; preds = %234
  %252 = add i64 %231, 1
  br label %230

253:                                              ; preds = %230
  br label %254

254:                                              ; preds = %274, %253
  %255 = phi i64 [ %275, %274 ], [ 0, %253 ]
  %256 = icmp slt i64 %255, 3
  br i1 %256, label %257, label %276

257:                                              ; preds = %254
  br label %258

258:                                              ; preds = %261, %257
  %259 = phi i64 [ %273, %261 ], [ 0, %257 ]
  %260 = icmp slt i64 %259, 2
  br i1 %260, label %261, label %274

261:                                              ; preds = %258
  %262 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %263 = mul nuw nsw i64 %255, 2
  %264 = add nuw nsw i64 %263, %259
  %265 = getelementptr inbounds nuw float, ptr %262, i64 %264
  %266 = load float, ptr %265, align 4
  %267 = fcmp ugt float %266, 0.000000e+00
  %268 = select i1 %267, float %266, float 0.000000e+00
  %269 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1
  %270 = mul nuw nsw i64 %255, 2
  %271 = add nuw nsw i64 %270, %259
  %272 = getelementptr inbounds nuw float, ptr %269, i64 %271
  store float %268, ptr %272, align 4
  %273 = add i64 %259, 1
  br label %258

274:                                              ; preds = %258
  %275 = add i64 %255, 1
  br label %254

276:                                              ; preds = %254
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
