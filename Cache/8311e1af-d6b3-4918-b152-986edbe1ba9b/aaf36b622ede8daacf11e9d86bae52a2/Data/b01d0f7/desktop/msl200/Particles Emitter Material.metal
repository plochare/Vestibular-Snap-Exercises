#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#ifdef ALIGNTOX
#undef ALIGNTOX
#endif
#ifdef ALIGNTOY
#undef ALIGNTOY
#endif
#ifdef ALIGNTOZ
#undef ALIGNTOZ
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//sampler sampler colorRampTextureSmpSC 0:21
//sampler sampler intensityTextureSmpSC 0:22
//sampler sampler mainTextureSmpSC 0:23
//sampler sampler sc_ScreenTextureSmpSC 0:28
//sampler sampler sizeRampTextureSmpSC 0:31
//sampler sampler vectorTextureSmpSC 0:32
//sampler sampler velRampTextureSmpSC 0:33
//texture texture2D colorRampTexture 0:1:0:21
//texture texture2D intensityTexture 0:2:0:22
//texture texture2D mainTexture 0:3:0:23
//texture texture2D sc_ScreenTexture 0:15:0:28
//texture texture2D sizeRampTexture 0:18:0:31
//texture texture2D vectorTexture 0:19:0:32
//texture texture2D velRampTexture 0:20:0:33
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:34:5440 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//float4 voxelization_params_0 3824
//float4 voxelization_params_frustum_lrbt 3840
//float4 voxelization_params_frustum_nf 3856
//float3 voxelization_params_camera_pos 3872
//float4x4 sc_ModelMatrixVoxelization 3888
//float correctedIntensity 3952
//float3x3 intensityTextureTransform 4016
//float4 intensityTextureUvMinMax 4064
//float4 intensityTextureBorderColor 4080
//int PreviewEnabled 4244
//float alphaTestThreshold 4252
//float timeGlobal 4256
//float externalTimeInput 4260
//float externalSeed 4264
//float lifeTimeConstant 4268
//float2 lifeTimeMinMax 4272
//float spawnDuration 4280
//float spawnMaxParticles 4284
//float2 sizeStart 4288
//float2 sizeEnd 4296
//float2 sizeStartMin 4304
//float2 sizeStartMax 4312
//float2 sizeEndMin 4320
//float2 sizeEndMax 4328
//float sizeSpeed 4336
//float3x3 sizeRampTextureTransform 4400
//float4 sizeRampTextureUvMinMax 4448
//float4 sizeRampTextureBorderColor 4464
//float3 spawnLocation 4480
//float3 spawnBox 4496
//float3 spawnSphere 4512
//float3 velocityMin 4528
//float3 velocityMax 4544
//float3 velocityDrag 4560
//float3x3 velRampTextureTransform 4624
//float4 velRampTextureUvMinMax 4672
//float4 velRampTextureBorderColor 4688
//float3 noiseMult 4704
//float3 noiseFrequency 4720
//float3 sNoiseMult 4736
//float3 sNoiseFrequency 4752
//float gravity 4768
//float3 localForce 4784
//float sizeVelScale 4800
//bool ALIGNTOX 4804
//bool ALIGNTOY 4808
//bool ALIGNTOZ 4812
//float2 rotationRandom 4816
//float2 rotationRate 4824
//float rotationDrag 4832
//float3x3 mainTextureTransform 4896
//float4 mainTextureUvMinMax 4944
//float4 mainTextureBorderColor 4960
//float numValidFrames 4976
//float2 gridSize 4984
//float flipBookSpeedMult 4992
//float flipBookRandomStart 4996
//float3x3 vectorTextureTransform 5056
//float4 vectorTextureUvMinMax 5104
//float4 vectorTextureBorderColor 5120
//float flowStrength 5136
//float flowSpeed 5140
//float3 colorStart 5152
//float3 colorEnd 5168
//float3 colorMinStart 5184
//float3 colorMinEnd 5200
//float3 colorMaxStart 5216
//float3 colorMaxEnd 5232
//float alphaStart 5248
//float alphaEnd 5252
//float alphaMinStart 5256
//float alphaMinEnd 5260
//float alphaMaxStart 5264
//float alphaMaxEnd 5268
//float4 colorRampTextureSize 5280
//float3x3 colorRampTextureTransform 5328
//float4 colorRampTextureUvMinMax 5376
//float4 colorRampTextureBorderColor 5392
//float4 colorRampMult 5408
//float alphaDissolveMult 5424
//}
//spec_const bool ALPHADISSOLVE 0 0
//spec_const bool ALPHAMINMAX 1 0
//spec_const bool BASETEXTURE 2 0
//spec_const bool BLACKASALPHA 3 0
//spec_const bool BLEND_MODE_AVERAGE 4 0
//spec_const bool BLEND_MODE_BRIGHT 5 0
//spec_const bool BLEND_MODE_COLOR_BURN 6 0
//spec_const bool BLEND_MODE_COLOR_DODGE 7 0
//spec_const bool BLEND_MODE_COLOR 8 0
//spec_const bool BLEND_MODE_DARKEN 9 0
//spec_const bool BLEND_MODE_DIFFERENCE 10 0
//spec_const bool BLEND_MODE_DIVIDE 11 0
//spec_const bool BLEND_MODE_DIVISION 12 0
//spec_const bool BLEND_MODE_EXCLUSION 13 0
//spec_const bool BLEND_MODE_FORGRAY 14 0
//spec_const bool BLEND_MODE_HARD_GLOW 15 0
//spec_const bool BLEND_MODE_HARD_LIGHT 16 0
//spec_const bool BLEND_MODE_HARD_MIX 17 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 18 0
//spec_const bool BLEND_MODE_HARD_REFLECT 19 0
//spec_const bool BLEND_MODE_HUE 20 0
//spec_const bool BLEND_MODE_INTENSE 21 0
//spec_const bool BLEND_MODE_LIGHTEN 22 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 23 0
//spec_const bool BLEND_MODE_LUMINOSITY 24 0
//spec_const bool BLEND_MODE_NEGATION 25 0
//spec_const bool BLEND_MODE_NOTBRIGHT 26 0
//spec_const bool BLEND_MODE_OVERLAY 27 0
//spec_const bool BLEND_MODE_PIN_LIGHT 28 0
//spec_const bool BLEND_MODE_REALISTIC 29 0
//spec_const bool BLEND_MODE_SATURATION 30 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 31 0
//spec_const bool BLEND_MODE_SUBTRACT 32 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 33 0
//spec_const bool BOXSPAWN 34 0
//spec_const bool COLORMINMAX 35 0
//spec_const bool COLORMONOMIN 36 0
//spec_const bool COLORRAMP 37 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 38 0
//spec_const bool EXTERNALTIME 39 0
//spec_const bool FLIPBOOKBLEND 40 0
//spec_const bool FLIPBOOKBYLIFE 41 0
//spec_const bool FLIPBOOK 42 0
//spec_const bool FORCE 43 0
//spec_const bool IGNOREVEL 44 0
//spec_const bool INILOCATION 45 0
//spec_const bool INSTANTSPAWN 46 0
//spec_const bool LIFETIMEMINMAX 47 0
//spec_const bool MAXPARTICLECOUNT 48 0
//spec_const bool NOISE 49 0
//spec_const bool NORANDOFFSET 50 0
//spec_const bool PREMULTIPLIEDCOLOR 51 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_colorRampTexture 52 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 53 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_mainTexture 54 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture 55 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_vectorTexture 56 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_velRampTexture 57 0
//spec_const bool SC_USE_UV_MIN_MAX_colorRampTexture 58 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 59 0
//spec_const bool SC_USE_UV_MIN_MAX_mainTexture 60 0
//spec_const bool SC_USE_UV_MIN_MAX_sizeRampTexture 61 0
//spec_const bool SC_USE_UV_MIN_MAX_vectorTexture 62 0
//spec_const bool SC_USE_UV_MIN_MAX_velRampTexture 63 0
//spec_const bool SC_USE_UV_TRANSFORM_colorRampTexture 64 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 65 0
//spec_const bool SC_USE_UV_TRANSFORM_mainTexture 66 0
//spec_const bool SC_USE_UV_TRANSFORM_sizeRampTexture 67 0
//spec_const bool SC_USE_UV_TRANSFORM_vectorTexture 68 0
//spec_const bool SC_USE_UV_TRANSFORM_velRampTexture 69 0
//spec_const bool SIZEMINMAX 70 0
//spec_const bool SIZERAMP 71 0
//spec_const bool SNOISE 72 0
//spec_const bool SPHERESPAWN 73 0
//spec_const bool UseViewSpaceDepthVariant 74 1
//spec_const bool VECTORFIELD 75 0
//spec_const bool VELOCITYDIR 76 0
//spec_const bool VELRAMP 77 0
//spec_const bool WORLDPOSSEED 78 0
//spec_const bool colorRampTextureHasSwappedViews 79 0
//spec_const bool intensityTextureHasSwappedViews 80 0
//spec_const bool mainTextureHasSwappedViews 81 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 82 0
//spec_const bool sc_BlendMode_Add 83 0
//spec_const bool sc_BlendMode_AlphaTest 84 0
//spec_const bool sc_BlendMode_AlphaToCoverage 85 0
//spec_const bool sc_BlendMode_ColoredGlass 86 0
//spec_const bool sc_BlendMode_Custom 87 0
//spec_const bool sc_BlendMode_Max 88 0
//spec_const bool sc_BlendMode_Min 89 0
//spec_const bool sc_BlendMode_MultiplyOriginal 90 0
//spec_const bool sc_BlendMode_Multiply 91 0
//spec_const bool sc_BlendMode_Normal 92 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 93 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 94 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 95 0
//spec_const bool sc_BlendMode_Screen 96 0
//spec_const bool sc_DepthOnly 97 0
//spec_const bool sc_FramebufferFetch 98 0
//spec_const bool sc_MotionVectorsPass 99 0
//spec_const bool sc_OITCompositingPass 100 0
//spec_const bool sc_OITDepthBoundsPass 101 0
//spec_const bool sc_OITDepthGatherPass 102 0
//spec_const bool sc_OutputBounds 103 0
//spec_const bool sc_ProjectiveShadowsCaster 104 0
//spec_const bool sc_ProjectiveShadowsReceiver 105 0
//spec_const bool sc_RenderAlphaToColor 106 0
//spec_const bool sc_ScreenTextureHasSwappedViews 107 0
//spec_const bool sc_TAAEnabled 108 0
//spec_const bool sc_VertexBlendingUseNormals 109 0
//spec_const bool sc_VertexBlending 110 0
//spec_const bool sc_Voxelization 111 0
//spec_const bool sizeRampTextureHasSwappedViews 112 0
//spec_const bool vectorTextureHasSwappedViews 113 0
//spec_const bool velRampTextureHasSwappedViews 114 0
//spec_const int NODE_67_DROPLIST_ITEM 115 0
//spec_const int SC_DEVICE_CLASS 116 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture 117 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 118 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_mainTexture 119 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture 120 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_vectorTexture 121 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_velRampTexture 122 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture 123 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 124 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_mainTexture 125 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture 126 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_vectorTexture 127 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_velRampTexture 128 -1
//spec_const int colorRampTextureLayout 129 0
//spec_const int intensityTextureLayout 130 0
//spec_const int mainTextureLayout 131 0
//spec_const int sc_DepthBufferMode 132 0
//spec_const int sc_RenderingSpace 133 -1
//spec_const int sc_ScreenTextureLayout 134 0
//spec_const int sc_ShaderCacheConstant 135 0
//spec_const int sc_SkinBonesCount 136 0
//spec_const int sc_StereoRenderingMode 137 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 138 0
//spec_const int sizeRampTextureLayout 139 0
//spec_const int vectorTextureLayout 140 0
//spec_const int velRampTextureLayout 141 0
//SG_REFLECTION_END
constant bool ALPHADISSOLVE [[function_constant(0)]];
constant bool ALPHADISSOLVE_tmp = is_function_constant_defined(ALPHADISSOLVE) ? ALPHADISSOLVE : false;
constant bool ALPHAMINMAX [[function_constant(1)]];
constant bool ALPHAMINMAX_tmp = is_function_constant_defined(ALPHAMINMAX) ? ALPHAMINMAX : false;
constant bool BASETEXTURE [[function_constant(2)]];
constant bool BASETEXTURE_tmp = is_function_constant_defined(BASETEXTURE) ? BASETEXTURE : false;
constant bool BLACKASALPHA [[function_constant(3)]];
constant bool BLACKASALPHA_tmp = is_function_constant_defined(BLACKASALPHA) ? BLACKASALPHA : false;
constant bool BLEND_MODE_AVERAGE [[function_constant(4)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(5)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(6)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(7)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(8)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(9)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(10)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(11)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(12)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(13)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(14)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(15)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(16)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(17)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(18)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(19)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(20)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(21)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(22)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(23)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(24)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(25)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(26)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(27)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(28)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(29)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(30)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(31)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(32)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(33)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool BOXSPAWN [[function_constant(34)]];
constant bool BOXSPAWN_tmp = is_function_constant_defined(BOXSPAWN) ? BOXSPAWN : false;
constant bool COLORMINMAX [[function_constant(35)]];
constant bool COLORMINMAX_tmp = is_function_constant_defined(COLORMINMAX) ? COLORMINMAX : false;
constant bool COLORMONOMIN [[function_constant(36)]];
constant bool COLORMONOMIN_tmp = is_function_constant_defined(COLORMONOMIN) ? COLORMONOMIN : false;
constant bool COLORRAMP [[function_constant(37)]];
constant bool COLORRAMP_tmp = is_function_constant_defined(COLORRAMP) ? COLORRAMP : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(38)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool EXTERNALTIME [[function_constant(39)]];
constant bool EXTERNALTIME_tmp = is_function_constant_defined(EXTERNALTIME) ? EXTERNALTIME : false;
constant bool FLIPBOOKBLEND [[function_constant(40)]];
constant bool FLIPBOOKBLEND_tmp = is_function_constant_defined(FLIPBOOKBLEND) ? FLIPBOOKBLEND : false;
constant bool FLIPBOOKBYLIFE [[function_constant(41)]];
constant bool FLIPBOOKBYLIFE_tmp = is_function_constant_defined(FLIPBOOKBYLIFE) ? FLIPBOOKBYLIFE : false;
constant bool FLIPBOOK [[function_constant(42)]];
constant bool FLIPBOOK_tmp = is_function_constant_defined(FLIPBOOK) ? FLIPBOOK : false;
constant bool FORCE [[function_constant(43)]];
constant bool FORCE_tmp = is_function_constant_defined(FORCE) ? FORCE : false;
constant bool IGNOREVEL [[function_constant(44)]];
constant bool IGNOREVEL_tmp = is_function_constant_defined(IGNOREVEL) ? IGNOREVEL : false;
constant bool INILOCATION [[function_constant(45)]];
constant bool INILOCATION_tmp = is_function_constant_defined(INILOCATION) ? INILOCATION : false;
constant bool INSTANTSPAWN [[function_constant(46)]];
constant bool INSTANTSPAWN_tmp = is_function_constant_defined(INSTANTSPAWN) ? INSTANTSPAWN : false;
constant bool LIFETIMEMINMAX [[function_constant(47)]];
constant bool LIFETIMEMINMAX_tmp = is_function_constant_defined(LIFETIMEMINMAX) ? LIFETIMEMINMAX : false;
constant bool MAXPARTICLECOUNT [[function_constant(48)]];
constant bool MAXPARTICLECOUNT_tmp = is_function_constant_defined(MAXPARTICLECOUNT) ? MAXPARTICLECOUNT : false;
constant bool NOISE [[function_constant(49)]];
constant bool NOISE_tmp = is_function_constant_defined(NOISE) ? NOISE : false;
constant bool NORANDOFFSET [[function_constant(50)]];
constant bool NORANDOFFSET_tmp = is_function_constant_defined(NORANDOFFSET) ? NORANDOFFSET : false;
constant bool PREMULTIPLIEDCOLOR [[function_constant(51)]];
constant bool PREMULTIPLIEDCOLOR_tmp = is_function_constant_defined(PREMULTIPLIEDCOLOR) ? PREMULTIPLIEDCOLOR : false;
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture [[function_constant(52)]];
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_colorRampTexture) ? SC_USE_CLAMP_TO_BORDER_colorRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(53)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture [[function_constant(54)]];
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_mainTexture) ? SC_USE_CLAMP_TO_BORDER_mainTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture [[function_constant(55)]];
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sizeRampTexture) ? SC_USE_CLAMP_TO_BORDER_sizeRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_vectorTexture [[function_constant(56)]];
constant bool SC_USE_CLAMP_TO_BORDER_vectorTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_vectorTexture) ? SC_USE_CLAMP_TO_BORDER_vectorTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture [[function_constant(57)]];
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_velRampTexture) ? SC_USE_CLAMP_TO_BORDER_velRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_colorRampTexture [[function_constant(58)]];
constant bool SC_USE_UV_MIN_MAX_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_colorRampTexture) ? SC_USE_UV_MIN_MAX_colorRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(59)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_mainTexture [[function_constant(60)]];
constant bool SC_USE_UV_MIN_MAX_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_mainTexture) ? SC_USE_UV_MIN_MAX_mainTexture : false;
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture [[function_constant(61)]];
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sizeRampTexture) ? SC_USE_UV_MIN_MAX_sizeRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_vectorTexture [[function_constant(62)]];
constant bool SC_USE_UV_MIN_MAX_vectorTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_vectorTexture) ? SC_USE_UV_MIN_MAX_vectorTexture : false;
constant bool SC_USE_UV_MIN_MAX_velRampTexture [[function_constant(63)]];
constant bool SC_USE_UV_MIN_MAX_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_velRampTexture) ? SC_USE_UV_MIN_MAX_velRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_colorRampTexture [[function_constant(64)]];
constant bool SC_USE_UV_TRANSFORM_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_colorRampTexture) ? SC_USE_UV_TRANSFORM_colorRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(65)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_mainTexture [[function_constant(66)]];
constant bool SC_USE_UV_TRANSFORM_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_mainTexture) ? SC_USE_UV_TRANSFORM_mainTexture : false;
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture [[function_constant(67)]];
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sizeRampTexture) ? SC_USE_UV_TRANSFORM_sizeRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_vectorTexture [[function_constant(68)]];
constant bool SC_USE_UV_TRANSFORM_vectorTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_vectorTexture) ? SC_USE_UV_TRANSFORM_vectorTexture : false;
constant bool SC_USE_UV_TRANSFORM_velRampTexture [[function_constant(69)]];
constant bool SC_USE_UV_TRANSFORM_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_velRampTexture) ? SC_USE_UV_TRANSFORM_velRampTexture : false;
constant bool SIZEMINMAX [[function_constant(70)]];
constant bool SIZEMINMAX_tmp = is_function_constant_defined(SIZEMINMAX) ? SIZEMINMAX : false;
constant bool SIZERAMP [[function_constant(71)]];
constant bool SIZERAMP_tmp = is_function_constant_defined(SIZERAMP) ? SIZERAMP : false;
constant bool SNOISE [[function_constant(72)]];
constant bool SNOISE_tmp = is_function_constant_defined(SNOISE) ? SNOISE : false;
constant bool SPHERESPAWN [[function_constant(73)]];
constant bool SPHERESPAWN_tmp = is_function_constant_defined(SPHERESPAWN) ? SPHERESPAWN : false;
constant bool UseViewSpaceDepthVariant [[function_constant(74)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool VECTORFIELD [[function_constant(75)]];
constant bool VECTORFIELD_tmp = is_function_constant_defined(VECTORFIELD) ? VECTORFIELD : false;
constant bool VELOCITYDIR [[function_constant(76)]];
constant bool VELOCITYDIR_tmp = is_function_constant_defined(VELOCITYDIR) ? VELOCITYDIR : false;
constant bool VELRAMP [[function_constant(77)]];
constant bool VELRAMP_tmp = is_function_constant_defined(VELRAMP) ? VELRAMP : false;
constant bool WORLDPOSSEED [[function_constant(78)]];
constant bool WORLDPOSSEED_tmp = is_function_constant_defined(WORLDPOSSEED) ? WORLDPOSSEED : false;
constant bool colorRampTextureHasSwappedViews [[function_constant(79)]];
constant bool colorRampTextureHasSwappedViews_tmp = is_function_constant_defined(colorRampTextureHasSwappedViews) ? colorRampTextureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(80)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool mainTextureHasSwappedViews [[function_constant(81)]];
constant bool mainTextureHasSwappedViews_tmp = is_function_constant_defined(mainTextureHasSwappedViews) ? mainTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(82)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(83)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(84)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(85)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(86)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(87)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(88)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(89)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(90)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(91)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(92)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(93)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(94)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(95)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(96)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(97)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(98)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(99)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(100)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(101)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(102)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(103)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(104)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(105)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(106)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(107)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(108)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(109)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(110)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(111)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant bool sizeRampTextureHasSwappedViews [[function_constant(112)]];
constant bool sizeRampTextureHasSwappedViews_tmp = is_function_constant_defined(sizeRampTextureHasSwappedViews) ? sizeRampTextureHasSwappedViews : false;
constant bool vectorTextureHasSwappedViews [[function_constant(113)]];
constant bool vectorTextureHasSwappedViews_tmp = is_function_constant_defined(vectorTextureHasSwappedViews) ? vectorTextureHasSwappedViews : false;
constant bool velRampTextureHasSwappedViews [[function_constant(114)]];
constant bool velRampTextureHasSwappedViews_tmp = is_function_constant_defined(velRampTextureHasSwappedViews) ? velRampTextureHasSwappedViews : false;
constant int NODE_67_DROPLIST_ITEM [[function_constant(115)]];
constant int NODE_67_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_67_DROPLIST_ITEM) ? NODE_67_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(116)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture [[function_constant(117)]];
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(118)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture [[function_constant(119)]];
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_mainTexture) ? SC_SOFTWARE_WRAP_MODE_U_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture [[function_constant(120)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_vectorTexture [[function_constant(121)]];
constant int SC_SOFTWARE_WRAP_MODE_U_vectorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_vectorTexture) ? SC_SOFTWARE_WRAP_MODE_U_vectorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture [[function_constant(122)]];
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_velRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture [[function_constant(123)]];
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(124)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture [[function_constant(125)]];
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_mainTexture) ? SC_SOFTWARE_WRAP_MODE_V_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture [[function_constant(126)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_vectorTexture [[function_constant(127)]];
constant int SC_SOFTWARE_WRAP_MODE_V_vectorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_vectorTexture) ? SC_SOFTWARE_WRAP_MODE_V_vectorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture [[function_constant(128)]];
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_velRampTexture : -1;
constant int colorRampTextureLayout [[function_constant(129)]];
constant int colorRampTextureLayout_tmp = is_function_constant_defined(colorRampTextureLayout) ? colorRampTextureLayout : 0;
constant int intensityTextureLayout [[function_constant(130)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int mainTextureLayout [[function_constant(131)]];
constant int mainTextureLayout_tmp = is_function_constant_defined(mainTextureLayout) ? mainTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(132)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(133)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(134)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(135)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(136)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(137)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(138)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int sizeRampTextureLayout [[function_constant(139)]];
constant int sizeRampTextureLayout_tmp = is_function_constant_defined(sizeRampTextureLayout) ? sizeRampTextureLayout : 0;
constant int vectorTextureLayout [[function_constant(140)]];
constant int vectorTextureLayout_tmp = is_function_constant_defined(vectorTextureLayout) ? vectorTextureLayout : 0;
constant int velRampTextureLayout [[function_constant(141)]];
constant int velRampTextureLayout_tmp = is_function_constant_defined(velRampTextureLayout) ? velRampTextureLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float4 VertexColor;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float spawnMaxParticles;
float2 sizeStart;
float2 sizeEnd;
float2 sizeStartMin;
float2 sizeStartMax;
float2 sizeEndMin;
float2 sizeEndMax;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandom;
float2 rotationRate;
float rotationDrag;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 vectorTextureSize;
float4 vectorTextureDims;
float4 vectorTextureView;
float3x3 vectorTextureTransform;
float4 vectorTextureUvMinMax;
float4 vectorTextureBorderColor;
float flowStrength;
float flowSpeed;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float alphaDissolveMult;
float Port_Input1_N069;
float Port_Input1_N068;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> sizeRampTexture [[id(18)]];
texture2d<float> vectorTexture [[id(19)]];
texture2d<float> velRampTexture [[id(20)]];
sampler colorRampTextureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler mainTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler sizeRampTextureSmpSC [[id(31)]];
sampler vectorTextureSmpSC [[id(32)]];
sampler velRampTextureSmpSC [[id(33)]];
constant userUniformsObj* UserUniforms [[id(34)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool N2_ALIGNTOX=false;
bool N2_ALIGNTOY=false;
bool N2_ALIGNTOZ=false;
float N2_normTime=0.0;
float N2_localTime=0.0;
float N2_seedVal=0.0;
float N2_dieController=0.0;
bool N2_MAXPARTICLECOUNT=false;
float N2_spawnMaxParticles=0.0;
float2 N2_sizeLife=float2(0.0);
float3 N2_spawnLoc=float3(0.0);
float3 N2_velocityXYZ=float3(0.0);
float N2_gravity=0.0;
bool N2_FORCE=false;
float3 N2_localForce=float3(0.0);
bool N2_ALIGNTOVEL=false;
float N2_sizeVelScale=0.0;
bool N2_IGNOREVEL=false;
float2 N2_rotationRandom=float2(0.0);
float2 N2_rotationRate=float2(0.0);
float N2_rotationDrag=0.0;
bool N2_WORLDSPACE=false;
bool N2_WORLDFORCE=false;
float3 N2_position=float3(0.0);
float N2_EPSILON=1e-06;
float N2_PI=3.1415927;
float N25_timeGlobal=0.0;
bool N25_EXTERNALTIME=false;
float N25_externalTime=0.0;
bool N25_WORLDPOSSEED=false;
float N25_externalSeed=0.0;
bool N25_LIFETIMEMINMAX=false;
float N25_lifeTimeConstant=0.0;
float2 N25_lifeTimeMinMax=float2(0.0);
bool N25_INSTANTSPAWN=false;
float N25_spawnDuration=0.0;
float N25_normTime=0.0;
float N25_localTime=0.0;
float N25_seedVal=0.0;
float N25_dieController=0.0;
float2 N25_realLifeTimeMinMax=float2(0.0);
float2 N23_sizeStart=float2(0.0);
float2 N23_sizeEnd=float2(0.0);
bool N23_SIZEMINMAX=false;
float2 N23_sizeStartMin=float2(0.0);
float2 N23_sizeStartMax=float2(0.0);
float2 N23_sizeEndMin=float2(0.0);
float2 N23_sizeEndMax=float2(0.0);
float N23_sizeSpeed=0.0;
bool N23_SIZERAMP=false;
float N23_seedVal=0.0;
float N23_normTime=0.0;
float2 N23_sizeParticle=float2(0.0);
bool N1_INILOCATION=false;
float3 N1_spawnLocation=float3(0.0);
bool N1_BOXSPAWN=false;
float3 N1_spawnBox=float3(0.0);
bool N1_SPHERESPAWN=false;
float3 N1_spawnSphere=float3(0.0);
float N1_seedVal=0.0;
float3 N1_spawnLoc=float3(0.0);
bool N31_VELRAMP=false;
float3 N31_velocityMin=float3(0.0);
float3 N31_velocityMax=float3(0.0);
float3 N31_velocityDrag=float3(0.0);
float3 N31_noiseXYZ=float3(0.0);
float N31_seedVal=0.0;
float N31_localTime=0.0;
float N31_normTime=0.0;
float3 N31_velocityXYZ=float3(0.0);
bool N32_NOISE=false;
float3 N32_noiseMult=float3(0.0);
float3 N32_noiseFrequency=float3(0.0);
bool N32_SNOISE=false;
float3 N32_sNoiseMult=float3(0.0);
float3 N32_sNoiseFrequency=float3(0.0);
float N32_seedVal=0.0;
float N32_localTime=0.0;
float N32_normTime=0.0;
float3 N32_noiseXYZ=float3(0.0);
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_2=param;
param=l9_2;
}
sc_Vertex_t l9_3=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_4=l9_3;
float3 l9_5=in.blendShape0Pos;
float3 l9_6=in.blendShape0Normal;
float l9_7=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_8=l9_4;
float3 l9_9=l9_5;
float l9_10=l9_7;
float3 l9_11=l9_8.position.xyz+(l9_9*l9_10);
l9_8.position=float4(l9_11.x,l9_11.y,l9_11.z,l9_8.position.w);
l9_4=l9_8;
l9_4.normal+=(l9_6*l9_7);
l9_3=l9_4;
sc_Vertex_t l9_12=l9_3;
float3 l9_13=in.blendShape1Pos;
float3 l9_14=in.blendShape1Normal;
float l9_15=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_16=l9_12;
float3 l9_17=l9_13;
float l9_18=l9_15;
float3 l9_19=l9_16.position.xyz+(l9_17*l9_18);
l9_16.position=float4(l9_19.x,l9_19.y,l9_19.z,l9_16.position.w);
l9_12=l9_16;
l9_12.normal+=(l9_14*l9_15);
l9_3=l9_12;
sc_Vertex_t l9_20=l9_3;
float3 l9_21=in.blendShape2Pos;
float3 l9_22=in.blendShape2Normal;
float l9_23=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_24=l9_20;
float3 l9_25=l9_21;
float l9_26=l9_23;
float3 l9_27=l9_24.position.xyz+(l9_25*l9_26);
l9_24.position=float4(l9_27.x,l9_27.y,l9_27.z,l9_24.position.w);
l9_20=l9_24;
l9_20.normal+=(l9_22*l9_23);
l9_3=l9_20;
}
else
{
sc_Vertex_t l9_28=l9_3;
float3 l9_29=in.blendShape0Pos;
float l9_30=(*sc_set0.UserUniforms).weights0.x;
float3 l9_31=l9_28.position.xyz+(l9_29*l9_30);
l9_28.position=float4(l9_31.x,l9_31.y,l9_31.z,l9_28.position.w);
l9_3=l9_28;
sc_Vertex_t l9_32=l9_3;
float3 l9_33=in.blendShape1Pos;
float l9_34=(*sc_set0.UserUniforms).weights0.y;
float3 l9_35=l9_32.position.xyz+(l9_33*l9_34);
l9_32.position=float4(l9_35.x,l9_35.y,l9_35.z,l9_32.position.w);
l9_3=l9_32;
sc_Vertex_t l9_36=l9_3;
float3 l9_37=in.blendShape2Pos;
float l9_38=(*sc_set0.UserUniforms).weights0.z;
float3 l9_39=l9_36.position.xyz+(l9_37*l9_38);
l9_36.position=float4(l9_39.x,l9_39.y,l9_39.z,l9_36.position.w);
l9_3=l9_36;
sc_Vertex_t l9_40=l9_3;
float3 l9_41=in.blendShape3Pos;
float l9_42=(*sc_set0.UserUniforms).weights0.w;
float3 l9_43=l9_40.position.xyz+(l9_41*l9_42);
l9_40.position=float4(l9_43.x,l9_43.y,l9_43.z,l9_40.position.w);
l9_3=l9_40;
sc_Vertex_t l9_44=l9_3;
float3 l9_45=in.blendShape4Pos;
float l9_46=(*sc_set0.UserUniforms).weights1.x;
float3 l9_47=l9_44.position.xyz+(l9_45*l9_46);
l9_44.position=float4(l9_47.x,l9_47.y,l9_47.z,l9_44.position.w);
l9_3=l9_44;
sc_Vertex_t l9_48=l9_3;
float3 l9_49=in.blendShape5Pos;
float l9_50=(*sc_set0.UserUniforms).weights1.y;
float3 l9_51=l9_48.position.xyz+(l9_49*l9_50);
l9_48.position=float4(l9_51.x,l9_51.y,l9_51.z,l9_48.position.w);
l9_3=l9_48;
}
}
param=l9_3;
sc_Vertex_t l9_52=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_53=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_53=float4(1.0,fract(in.boneData.yzw));
l9_53.x-=dot(l9_53.yzw,float3(1.0));
}
float4 l9_54=l9_53;
float4 l9_55=l9_54;
int l9_56=int(in.boneData.x);
int l9_57=int(in.boneData.y);
int l9_58=int(in.boneData.z);
int l9_59=int(in.boneData.w);
int l9_60=l9_56;
float4 l9_61=l9_52.position;
float3 l9_62=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_63=l9_60;
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[0];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[1];
float4 l9_66=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[2];
float4 l9_67[3];
l9_67[0]=l9_64;
l9_67[1]=l9_65;
l9_67[2]=l9_66;
l9_62=float3(dot(l9_61,l9_67[0]),dot(l9_61,l9_67[1]),dot(l9_61,l9_67[2]));
}
else
{
l9_62=l9_61.xyz;
}
float3 l9_68=l9_62;
float3 l9_69=l9_68;
float l9_70=l9_55.x;
int l9_71=l9_57;
float4 l9_72=l9_52.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_55.y;
int l9_82=l9_58;
float4 l9_83=l9_52.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_55.z;
int l9_93=l9_59;
float4 l9_94=l9_52.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=(((l9_69*l9_70)+(l9_80*l9_81))+(l9_91*l9_92))+(l9_101*l9_55.w);
l9_52.position=float4(l9_102.x,l9_102.y,l9_102.z,l9_52.position.w);
int l9_103=l9_56;
float3x3 l9_104=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[2].xyz));
float3x3 l9_105=l9_104;
float3x3 l9_106=l9_105;
int l9_107=l9_57;
float3x3 l9_108=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[2].xyz));
float3x3 l9_109=l9_108;
float3x3 l9_110=l9_109;
int l9_111=l9_58;
float3x3 l9_112=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[2].xyz));
float3x3 l9_113=l9_112;
float3x3 l9_114=l9_113;
int l9_115=l9_59;
float3x3 l9_116=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[2].xyz));
float3x3 l9_117=l9_116;
float3x3 l9_118=l9_117;
l9_52.normal=((((l9_106*l9_52.normal)*l9_55.x)+((l9_110*l9_52.normal)*l9_55.y))+((l9_114*l9_52.normal)*l9_55.z))+((l9_118*l9_52.normal)*l9_55.w);
l9_52.tangent=((((l9_106*l9_52.tangent)*l9_55.x)+((l9_110*l9_52.tangent)*l9_55.y))+((l9_114*l9_52.tangent)*l9_55.z))+((l9_118*l9_52.tangent)*l9_55.w);
}
param=l9_52;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param.position.xyz.x,param.position.xyz.y,param.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_119=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varPosAndMotion=float4(l9_119.x,l9_119.y,l9_119.z,out.varPosAndMotion.w);
float3 l9_120=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
out.varNormalAndMotion=float4(l9_120.x,l9_120.y,l9_120.z,out.varNormalAndMotion.w);
float3 l9_121=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_121.x,l9_121.y,l9_121.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=v.texture0;
Globals.VertexColor=out.varColor;
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
float Output_N3=0.0;
float param_1=(*sc_set0.UserUniforms).timeGlobal;
Output_N3=param_1;
float Output_N6=0.0;
float param_2;
if ((int(EXTERNALTIME_tmp)!=0))
{
param_2=1.001;
}
else
{
param_2=0.001;
}
param_2-=0.001;
Output_N6=param_2;
float Output_N5=0.0;
float param_3=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5=param_3;
float Output_N8=0.0;
float param_4;
if ((int(WORLDPOSSEED_tmp)!=0))
{
param_4=1.001;
}
else
{
param_4=0.001;
}
param_4-=0.001;
Output_N8=param_4;
float Output_N7=0.0;
float param_5=(*sc_set0.UserUniforms).externalSeed;
Output_N7=param_5;
float Output_N0=0.0;
float param_6;
if ((int(LIFETIMEMINMAX_tmp)!=0))
{
param_6=1.001;
}
else
{
param_6=0.001;
}
param_6-=0.001;
Output_N0=param_6;
float Output_N9=0.0;
float param_7=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9=param_7;
float2 Output_N10=float2(0.0);
float2 param_8=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10=param_8;
float Output_N11=0.0;
float param_9;
if ((int(INSTANTSPAWN_tmp)!=0))
{
param_9=1.001;
}
else
{
param_9=0.001;
}
param_9-=0.001;
Output_N11=param_9;
float Output_N12=0.0;
float param_10=(*sc_set0.UserUniforms).spawnDuration;
Output_N12=param_10;
float normTime_N25=0.0;
float localTime_N25=0.0;
float seedVal_N25=0.0;
float dieController_N25=0.0;
float param_11=Output_N3;
float param_12=Output_N6;
float param_13=Output_N5;
float param_14=Output_N8;
float param_15=Output_N7;
float param_16=Output_N0;
float param_17=Output_N9;
float2 param_18=Output_N10;
float param_19=Output_N11;
float param_20=Output_N12;
ssGlobals param_25=Globals;
ssGlobals tempGlobals=param_25;
float param_21=0.0;
float param_22=0.0;
float param_23=0.0;
float param_24=0.0;
N25_timeGlobal=param_11;
N25_EXTERNALTIME=param_12!=0.0;
N25_externalTime=param_13;
N25_WORLDPOSSEED=param_14!=0.0;
N25_externalSeed=param_15;
N25_LIFETIMEMINMAX=param_16!=0.0;
N25_lifeTimeConstant=param_17;
N25_lifeTimeMinMax=param_18;
N25_INSTANTSPAWN=param_19!=0.0;
N25_spawnDuration=param_20;
float l9_122=0.0;
if (N25_WORLDPOSSEED)
{
float4x4 l9_123=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_122=length(float4(1.0)*l9_123);
}
N25_realLifeTimeMinMax=float2(N25_lifeTimeConstant);
if (N25_LIFETIMEMINMAX)
{
N25_realLifeTimeMinMax=N25_lifeTimeMinMax;
}
float l9_124=fast::max(N25_realLifeTimeMinMax.x,0.0099999998);
float l9_125=fast::max(N25_realLifeTimeMinMax.y,0.0099999998);
N25_seedVal=N25_externalSeed+l9_122;
float4 l9_126=tempGlobals.VertexColor;
float4 l9_127=tempGlobals.VertexColor;
float4 l9_128=tempGlobals.VertexColor;
float l9_129=l9_126.x+(l9_127.y*l9_128.z);
float l9_130=fract((l9_129*12.12358)+N25_seedVal);
float l9_131=fract((l9_129*3.5358)+N25_seedVal);
float l9_132=tempGlobals.gTimeElapsed;
float l9_133=l9_132;
if (N25_EXTERNALTIME)
{
l9_133=N25_externalTime;
}
if (!N25_INSTANTSPAWN)
{
float l9_134=fract(((l9_133*N25_timeGlobal)*(1.0/N25_realLifeTimeMinMax.y))+l9_130);
N25_localTime=l9_134*N25_realLifeTimeMinMax.y;
}
else
{
N25_localTime=N25_timeGlobal*l9_133;
}
float l9_135=mix(N25_localTime/l9_124,N25_localTime/l9_125,l9_131);
N25_normTime=fast::clamp(l9_135,0.0,1.0);
float l9_136=0.0;
if (!N25_INSTANTSPAWN)
{
if (N25_spawnDuration!=0.0)
{
if ((l9_133-N25_spawnDuration)>=N25_localTime)
{
l9_136=1.0;
}
}
}
N25_dieController=l9_135+l9_136;
param_21=N25_normTime;
param_22=N25_localTime;
param_23=N25_seedVal;
param_24=N25_dieController;
normTime_N25=param_21;
localTime_N25=param_22;
seedVal_N25=param_23;
dieController_N25=param_24;
float Output_N13=0.0;
float param_26;
if ((int(MAXPARTICLECOUNT_tmp)!=0))
{
param_26=1.001;
}
else
{
param_26=0.001;
}
param_26-=0.001;
Output_N13=param_26;
float Output_N14=0.0;
float param_27=(*sc_set0.UserUniforms).spawnMaxParticles;
Output_N14=param_27;
float2 Output_N24=float2(0.0);
float2 param_28=(*sc_set0.UserUniforms).sizeStart;
Output_N24=param_28;
float2 Output_N26=float2(0.0);
float2 param_29=(*sc_set0.UserUniforms).sizeEnd;
Output_N26=param_29;
float Output_N99=0.0;
float param_30;
if ((int(SIZEMINMAX_tmp)!=0))
{
param_30=1.001;
}
else
{
param_30=0.001;
}
param_30-=0.001;
Output_N99=param_30;
float2 Output_N98=float2(0.0);
float2 param_31=(*sc_set0.UserUniforms).sizeStartMin;
Output_N98=param_31;
float2 Output_N101=float2(0.0);
float2 param_32=(*sc_set0.UserUniforms).sizeStartMax;
Output_N101=param_32;
float2 Output_N100=float2(0.0);
float2 param_33=(*sc_set0.UserUniforms).sizeEndMin;
Output_N100=param_33;
float2 Output_N103=float2(0.0);
float2 param_34=(*sc_set0.UserUniforms).sizeEndMax;
Output_N103=param_34;
float Output_N27=0.0;
float param_35=(*sc_set0.UserUniforms).sizeSpeed;
Output_N27=param_35;
float Output_N102=0.0;
float param_36;
if ((int(SIZERAMP_tmp)!=0))
{
param_36=1.001;
}
else
{
param_36=0.001;
}
param_36-=0.001;
Output_N102=param_36;
float2 sizeParticle_N23=float2(0.0);
float2 param_37=Output_N24;
float2 param_38=Output_N26;
float param_39=Output_N99;
float2 param_40=Output_N98;
float2 param_41=Output_N101;
float2 param_42=Output_N100;
float2 param_43=Output_N103;
float param_44=Output_N27;
float param_45=Output_N102;
float param_46=seedVal_N25;
float param_47=normTime_N25;
ssGlobals param_49=Globals;
tempGlobals=param_49;
float2 param_48=float2(0.0);
N23_sizeStart=param_37;
N23_sizeEnd=param_38;
N23_SIZEMINMAX=param_39!=0.0;
N23_sizeStartMin=param_40;
N23_sizeStartMax=param_41;
N23_sizeEndMin=param_42;
N23_sizeEndMax=param_43;
N23_sizeSpeed=param_44;
N23_SIZERAMP=param_45!=0.0;
N23_seedVal=param_46;
N23_normTime=param_47;
float4 l9_137=tempGlobals.VertexColor;
float4 l9_138=tempGlobals.VertexColor;
float4 l9_139=tempGlobals.VertexColor;
float l9_140=l9_137.x+(l9_138.y*l9_139.z);
float l9_141=fract((l9_140*334.59122)+N23_seedVal)-0.5;
float l9_142=fract((l9_140*41.231232)+N23_seedVal)-0.5;
float l9_143=l9_141;
float l9_144=l9_142;
float l9_145=N23_normTime;
float l9_146=N23_sizeSpeed;
float2 l9_147=N23_sizeStart;
float2 l9_148=N23_sizeEnd;
float l9_149=l9_145;
float l9_150=l9_146;
float l9_151;
if (l9_149<=0.0)
{
l9_151=0.0;
}
else
{
l9_151=pow(l9_149,l9_150);
}
float l9_152=l9_151;
float l9_153=l9_152;
if (N23_SIZEMINMAX)
{
l9_147=mix(N23_sizeStartMin,N23_sizeStartMax,float2(l9_143));
l9_148=mix(N23_sizeEndMin,N23_sizeEndMax,float2(l9_144));
}
float2 l9_154=mix(l9_147,l9_148,float2(l9_153));
if (N23_SIZERAMP)
{
float l9_155=ceil(l9_145*10000.0)/10000.0;
float2 l9_156=tempGlobals.Surface_UVCoord0;
float2 l9_157=(l9_156/float2(10000.0,1.0))+float2(l9_155,0.0);
float2 l9_158=l9_157;
float4 l9_159=float4(0.0);
int l9_160;
if ((int(sizeRampTextureHasSwappedViews_tmp)!=0))
{
int l9_161=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_161=0;
}
else
{
l9_161=gl_InstanceIndex%2;
}
int l9_162=l9_161;
l9_160=1-l9_162;
}
else
{
int l9_163=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_163=0;
}
else
{
l9_163=gl_InstanceIndex%2;
}
int l9_164=l9_163;
l9_160=l9_164;
}
int l9_165=l9_160;
int l9_166=sizeRampTextureLayout_tmp;
int l9_167=l9_165;
float2 l9_168=l9_158;
bool l9_169=(int(SC_USE_UV_TRANSFORM_sizeRampTexture_tmp)!=0);
float3x3 l9_170=(*sc_set0.UserUniforms).sizeRampTextureTransform;
int2 l9_171=int2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp);
bool l9_172=(int(SC_USE_UV_MIN_MAX_sizeRampTexture_tmp)!=0);
float4 l9_173=(*sc_set0.UserUniforms).sizeRampTextureUvMinMax;
bool l9_174=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp)!=0);
float4 l9_175=(*sc_set0.UserUniforms).sizeRampTextureBorderColor;
float l9_176=0.0;
bool l9_177=l9_174&&(!l9_172);
float l9_178=1.0;
float l9_179=l9_168.x;
int l9_180=l9_171.x;
if (l9_180==1)
{
l9_179=fract(l9_179);
}
else
{
if (l9_180==2)
{
float l9_181=fract(l9_179);
float l9_182=l9_179-l9_181;
float l9_183=step(0.25,fract(l9_182*0.5));
l9_179=mix(l9_181,1.0-l9_181,fast::clamp(l9_183,0.0,1.0));
}
}
l9_168.x=l9_179;
float l9_184=l9_168.y;
int l9_185=l9_171.y;
if (l9_185==1)
{
l9_184=fract(l9_184);
}
else
{
if (l9_185==2)
{
float l9_186=fract(l9_184);
float l9_187=l9_184-l9_186;
float l9_188=step(0.25,fract(l9_187*0.5));
l9_184=mix(l9_186,1.0-l9_186,fast::clamp(l9_188,0.0,1.0));
}
}
l9_168.y=l9_184;
if (l9_172)
{
bool l9_189=l9_174;
bool l9_190;
if (l9_189)
{
l9_190=l9_171.x==3;
}
else
{
l9_190=l9_189;
}
float l9_191=l9_168.x;
float l9_192=l9_173.x;
float l9_193=l9_173.z;
bool l9_194=l9_190;
float l9_195=l9_178;
float l9_196=fast::clamp(l9_191,l9_192,l9_193);
float l9_197=step(abs(l9_191-l9_196),9.9999997e-06);
l9_195*=(l9_197+((1.0-float(l9_194))*(1.0-l9_197)));
l9_191=l9_196;
l9_168.x=l9_191;
l9_178=l9_195;
bool l9_198=l9_174;
bool l9_199;
if (l9_198)
{
l9_199=l9_171.y==3;
}
else
{
l9_199=l9_198;
}
float l9_200=l9_168.y;
float l9_201=l9_173.y;
float l9_202=l9_173.w;
bool l9_203=l9_199;
float l9_204=l9_178;
float l9_205=fast::clamp(l9_200,l9_201,l9_202);
float l9_206=step(abs(l9_200-l9_205),9.9999997e-06);
l9_204*=(l9_206+((1.0-float(l9_203))*(1.0-l9_206)));
l9_200=l9_205;
l9_168.y=l9_200;
l9_178=l9_204;
}
float2 l9_207=l9_168;
bool l9_208=l9_169;
float3x3 l9_209=l9_170;
if (l9_208)
{
l9_207=float2((l9_209*float3(l9_207,1.0)).xy);
}
float2 l9_210=l9_207;
l9_168=l9_210;
float l9_211=l9_168.x;
int l9_212=l9_171.x;
bool l9_213=l9_177;
float l9_214=l9_178;
if ((l9_212==0)||(l9_212==3))
{
float l9_215=l9_211;
float l9_216=0.0;
float l9_217=1.0;
bool l9_218=l9_213;
float l9_219=l9_214;
float l9_220=fast::clamp(l9_215,l9_216,l9_217);
float l9_221=step(abs(l9_215-l9_220),9.9999997e-06);
l9_219*=(l9_221+((1.0-float(l9_218))*(1.0-l9_221)));
l9_215=l9_220;
l9_211=l9_215;
l9_214=l9_219;
}
l9_168.x=l9_211;
l9_178=l9_214;
float l9_222=l9_168.y;
int l9_223=l9_171.y;
bool l9_224=l9_177;
float l9_225=l9_178;
if ((l9_223==0)||(l9_223==3))
{
float l9_226=l9_222;
float l9_227=0.0;
float l9_228=1.0;
bool l9_229=l9_224;
float l9_230=l9_225;
float l9_231=fast::clamp(l9_226,l9_227,l9_228);
float l9_232=step(abs(l9_226-l9_231),9.9999997e-06);
l9_230*=(l9_232+((1.0-float(l9_229))*(1.0-l9_232)));
l9_226=l9_231;
l9_222=l9_226;
l9_225=l9_230;
}
l9_168.y=l9_222;
l9_178=l9_225;
float2 l9_233=l9_168;
int l9_234=l9_166;
int l9_235=l9_167;
float l9_236=l9_176;
float2 l9_237=l9_233;
int l9_238=l9_234;
int l9_239=l9_235;
float3 l9_240=float3(0.0);
if (l9_238==0)
{
l9_240=float3(l9_237,0.0);
}
else
{
if (l9_238==1)
{
l9_240=float3(l9_237.x,(l9_237.y*0.5)+(0.5-(float(l9_239)*0.5)),0.0);
}
else
{
l9_240=float3(l9_237,float(l9_239));
}
}
float3 l9_241=l9_240;
float3 l9_242=l9_241;
float4 l9_243=sc_set0.sizeRampTexture.sample(sc_set0.sizeRampTextureSmpSC,l9_242.xy,level(l9_236));
float4 l9_244=l9_243;
if (l9_174)
{
l9_244=mix(l9_175,l9_244,float4(l9_178));
}
float4 l9_245=l9_244;
l9_159=l9_245;
float4 l9_246=l9_159;
float2 l9_247=l9_246.xy;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_247=float2(1.0);
}
l9_154=l9_247*l9_147;
}
float2 l9_248=l9_154;
N23_sizeParticle=l9_248;
param_48=N23_sizeParticle;
sizeParticle_N23=param_48;
float Output_N15=0.0;
float param_50;
if ((int(INILOCATION_tmp)!=0))
{
param_50=1.001;
}
else
{
param_50=0.001;
}
param_50-=0.001;
Output_N15=param_50;
float3 Output_N16=float3(0.0);
float3 param_51=(*sc_set0.UserUniforms).spawnLocation;
Output_N16=param_51;
float Output_N17=0.0;
float param_52;
if ((int(BOXSPAWN_tmp)!=0))
{
param_52=1.001;
}
else
{
param_52=0.001;
}
param_52-=0.001;
Output_N17=param_52;
float3 Output_N18=float3(0.0);
float3 param_53=(*sc_set0.UserUniforms).spawnBox;
Output_N18=param_53;
float Output_N19=0.0;
float param_54;
if ((int(SPHERESPAWN_tmp)!=0))
{
param_54=1.001;
}
else
{
param_54=0.001;
}
param_54-=0.001;
Output_N19=param_54;
float3 Output_N20=float3(0.0);
float3 param_55=(*sc_set0.UserUniforms).spawnSphere;
Output_N20=param_55;
float3 spawnLoc_N1=float3(0.0);
float param_56=Output_N15;
float3 param_57=Output_N16;
float param_58=Output_N17;
float3 param_59=Output_N18;
float param_60=Output_N19;
float3 param_61=Output_N20;
float param_62=seedVal_N25;
ssGlobals param_64=Globals;
tempGlobals=param_64;
float3 param_63=float3(0.0);
N1_INILOCATION=param_56!=0.0;
N1_spawnLocation=param_57;
N1_BOXSPAWN=param_58!=0.0;
N1_spawnBox=param_59;
N1_SPHERESPAWN=param_60!=0.0;
N1_spawnSphere=param_61;
N1_seedVal=param_62;
float3 l9_249=float3(0.0);
float4 l9_250=tempGlobals.VertexColor;
float4 l9_251=l9_250;
float l9_252=l9_251.x+(l9_251.y*l9_251.z);
float l9_253=fract((l9_252*82.124229)+N1_seedVal);
float l9_254=fract((l9_252*9115.2148)+N1_seedVal);
float l9_255=fract((l9_252*654.15588)+N1_seedVal);
float3 l9_256=fract((float3(l9_253,l9_254,l9_255)*313.13324)+float3(N1_seedVal))-float3(0.5);
float3 l9_257=float3(l9_251.x,l9_251.y,l9_251.z)-float3(0.5);
float3 l9_258=l9_249;
float3 l9_259=l9_249;
float3 l9_260=l9_249;
if (N1_INILOCATION)
{
l9_260=N1_spawnLocation;
}
if (N1_BOXSPAWN)
{
l9_258=N1_spawnBox*l9_256;
}
if (N1_SPHERESPAWN)
{
l9_259=N1_spawnSphere*l9_257;
}
N1_spawnLoc=(l9_260+l9_259)+l9_258;
param_63=N1_spawnLoc;
spawnLoc_N1=param_63;
float Output_N38=0.0;
float param_65;
if ((int(VELRAMP_tmp)!=0))
{
param_65=1.001;
}
else
{
param_65=0.001;
}
param_65-=0.001;
Output_N38=param_65;
float3 Output_N34=float3(0.0);
float3 param_66=(*sc_set0.UserUniforms).velocityMin;
Output_N34=param_66;
float3 Output_N35=float3(0.0);
float3 param_67=(*sc_set0.UserUniforms).velocityMax;
Output_N35=param_67;
float3 Output_N36=float3(0.0);
float3 param_68=(*sc_set0.UserUniforms).velocityDrag;
Output_N36=param_68;
float Output_N43=0.0;
float param_69;
if ((int(NOISE_tmp)!=0))
{
param_69=1.001;
}
else
{
param_69=0.001;
}
param_69-=0.001;
Output_N43=param_69;
float3 Output_N39=float3(0.0);
float3 param_70=(*sc_set0.UserUniforms).noiseMult;
Output_N39=param_70;
float3 Output_N40=float3(0.0);
float3 param_71=(*sc_set0.UserUniforms).noiseFrequency;
Output_N40=param_71;
float Output_N44=0.0;
float param_72;
if ((int(SNOISE_tmp)!=0))
{
param_72=1.001;
}
else
{
param_72=0.001;
}
param_72-=0.001;
Output_N44=param_72;
float3 Output_N41=float3(0.0);
float3 param_73=(*sc_set0.UserUniforms).sNoiseMult;
Output_N41=param_73;
float3 Output_N42=float3(0.0);
float3 param_74=(*sc_set0.UserUniforms).sNoiseFrequency;
Output_N42=param_74;
float3 noiseXYZ_N32=float3(0.0);
float param_75=Output_N43;
float3 param_76=Output_N39;
float3 param_77=Output_N40;
float param_78=Output_N44;
float3 param_79=Output_N41;
float3 param_80=Output_N42;
float param_81=seedVal_N25;
float param_82=localTime_N25;
float param_83=normTime_N25;
ssGlobals param_85=Globals;
tempGlobals=param_85;
float3 param_84=float3(0.0);
N32_NOISE=param_75!=0.0;
N32_noiseMult=param_76;
N32_noiseFrequency=param_77;
N32_SNOISE=param_78!=0.0;
N32_sNoiseMult=param_79;
N32_sNoiseFrequency=param_80;
N32_seedVal=param_81;
N32_localTime=param_82;
N32_normTime=param_83;
float3 l9_261=float3(0.0);
float4 l9_262=tempGlobals.VertexColor;
float4 l9_263=tempGlobals.VertexColor;
float4 l9_264=tempGlobals.VertexColor;
float l9_265=l9_262.x+(l9_263.y*l9_264.z);
float l9_266=fract((l9_265*18.984529)+N32_seedVal);
float l9_267=fract((l9_265*654.15588)+N32_seedVal);
float l9_268=fract((l9_265*45.722408)+N32_seedVal);
float3 l9_269=(float3(l9_267,l9_268,l9_266)-float3(0.5))*2.0;
N32_noiseXYZ=l9_261;
if (N32_NOISE)
{
float3 l9_270=N32_noiseFrequency;
float3 l9_271=N32_noiseMult;
float3 l9_272=l9_269;
float l9_273=N32_normTime;
float l9_274=sin(l9_273*l9_270.x);
float l9_275=sin(l9_273*l9_270.y);
float l9_276=sin(l9_273*l9_270.z);
float3 l9_277=(float3(l9_274,l9_275,l9_276)*l9_271)*l9_272;
float3 l9_278=l9_277;
N32_noiseXYZ+=l9_278;
}
if (N32_SNOISE)
{
float l9_279=l9_266;
float l9_280=l9_267;
float l9_281=l9_268;
float3 l9_282=N32_sNoiseFrequency;
float3 l9_283=N32_sNoiseMult;
float3 l9_284=l9_269;
float l9_285=N32_localTime;
float2 l9_286=float2(l9_279*l9_285,l9_282.x);
float2 l9_287=floor(l9_286+float2(dot(l9_286,float2(0.36602542))));
float2 l9_288=(l9_286-l9_287)+float2(dot(l9_287,float2(0.21132487)));
float2 l9_289=float2(0.0);
bool2 l9_290=bool2(l9_288.x>l9_288.y);
l9_289=float2(l9_290.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_290.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_291=l9_288.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_292=l9_291.xy-l9_289;
l9_291=float4(l9_292.x,l9_292.y,l9_291.z,l9_291.w);
l9_287=mod(l9_287,float2(289.0));
float3 l9_293=float3(l9_287.y)+float3(0.0,l9_289.y,1.0);
float3 l9_294=mod(((l9_293*34.0)+float3(1.0))*l9_293,float3(289.0));
float3 l9_295=(l9_294+float3(l9_287.x))+float3(0.0,l9_289.x,1.0);
float3 l9_296=mod(((l9_295*34.0)+float3(1.0))*l9_295,float3(289.0));
float3 l9_297=l9_296;
float3 l9_298=fast::max(float3(0.5)-float3(dot(l9_288,l9_288),dot(l9_291.xy,l9_291.xy),dot(l9_291.zw,l9_291.zw)),float3(0.0));
l9_298*=l9_298;
l9_298*=l9_298;
float3 l9_299=(fract(l9_297*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_300=abs(l9_299)-float3(0.5);
float3 l9_301=floor(l9_299+float3(0.5));
float3 l9_302=l9_299-l9_301;
l9_298*=(float3(1.7928429)-(((l9_302*l9_302)+(l9_300*l9_300))*0.85373473));
float3 l9_303=float3(0.0);
l9_303.x=(l9_302.x*l9_288.x)+(l9_300.x*l9_288.y);
float2 l9_304=(l9_302.yz*l9_291.xz)+(l9_300.yz*l9_291.yw);
l9_303=float3(l9_303.x,l9_304.x,l9_304.y);
float l9_305=130.0*dot(l9_298,l9_303);
float l9_306=l9_305;
float2 l9_307=float2(l9_280*l9_285,l9_282.y);
float2 l9_308=floor(l9_307+float2(dot(l9_307,float2(0.36602542))));
float2 l9_309=(l9_307-l9_308)+float2(dot(l9_308,float2(0.21132487)));
float2 l9_310=float2(0.0);
bool2 l9_311=bool2(l9_309.x>l9_309.y);
l9_310=float2(l9_311.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_311.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_312=l9_309.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_313=l9_312.xy-l9_310;
l9_312=float4(l9_313.x,l9_313.y,l9_312.z,l9_312.w);
l9_308=mod(l9_308,float2(289.0));
float3 l9_314=float3(l9_308.y)+float3(0.0,l9_310.y,1.0);
float3 l9_315=mod(((l9_314*34.0)+float3(1.0))*l9_314,float3(289.0));
float3 l9_316=(l9_315+float3(l9_308.x))+float3(0.0,l9_310.x,1.0);
float3 l9_317=mod(((l9_316*34.0)+float3(1.0))*l9_316,float3(289.0));
float3 l9_318=l9_317;
float3 l9_319=fast::max(float3(0.5)-float3(dot(l9_309,l9_309),dot(l9_312.xy,l9_312.xy),dot(l9_312.zw,l9_312.zw)),float3(0.0));
l9_319*=l9_319;
l9_319*=l9_319;
float3 l9_320=(fract(l9_318*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_321=abs(l9_320)-float3(0.5);
float3 l9_322=floor(l9_320+float3(0.5));
float3 l9_323=l9_320-l9_322;
l9_319*=(float3(1.7928429)-(((l9_323*l9_323)+(l9_321*l9_321))*0.85373473));
float3 l9_324=float3(0.0);
l9_324.x=(l9_323.x*l9_309.x)+(l9_321.x*l9_309.y);
float2 l9_325=(l9_323.yz*l9_312.xz)+(l9_321.yz*l9_312.yw);
l9_324=float3(l9_324.x,l9_325.x,l9_325.y);
float l9_326=130.0*dot(l9_319,l9_324);
float l9_327=l9_326;
float2 l9_328=float2(l9_281*l9_285,l9_282.z);
float2 l9_329=floor(l9_328+float2(dot(l9_328,float2(0.36602542))));
float2 l9_330=(l9_328-l9_329)+float2(dot(l9_329,float2(0.21132487)));
float2 l9_331=float2(0.0);
bool2 l9_332=bool2(l9_330.x>l9_330.y);
l9_331=float2(l9_332.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_332.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_333=l9_330.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_334=l9_333.xy-l9_331;
l9_333=float4(l9_334.x,l9_334.y,l9_333.z,l9_333.w);
l9_329=mod(l9_329,float2(289.0));
float3 l9_335=float3(l9_329.y)+float3(0.0,l9_331.y,1.0);
float3 l9_336=mod(((l9_335*34.0)+float3(1.0))*l9_335,float3(289.0));
float3 l9_337=(l9_336+float3(l9_329.x))+float3(0.0,l9_331.x,1.0);
float3 l9_338=mod(((l9_337*34.0)+float3(1.0))*l9_337,float3(289.0));
float3 l9_339=l9_338;
float3 l9_340=fast::max(float3(0.5)-float3(dot(l9_330,l9_330),dot(l9_333.xy,l9_333.xy),dot(l9_333.zw,l9_333.zw)),float3(0.0));
l9_340*=l9_340;
l9_340*=l9_340;
float3 l9_341=(fract(l9_339*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_342=abs(l9_341)-float3(0.5);
float3 l9_343=floor(l9_341+float3(0.5));
float3 l9_344=l9_341-l9_343;
l9_340*=(float3(1.7928429)-(((l9_344*l9_344)+(l9_342*l9_342))*0.85373473));
float3 l9_345=float3(0.0);
l9_345.x=(l9_344.x*l9_330.x)+(l9_342.x*l9_330.y);
float2 l9_346=(l9_344.yz*l9_333.xz)+(l9_342.yz*l9_333.yw);
l9_345=float3(l9_345.x,l9_346.x,l9_346.y);
float l9_347=130.0*dot(l9_340,l9_345);
float l9_348=l9_347;
float3 l9_349=(float3(l9_306,l9_327,l9_348)*l9_283)*l9_284;
N32_noiseXYZ+=l9_349;
}
param_84=N32_noiseXYZ;
noiseXYZ_N32=param_84;
float3 velocityXYZ_N31=float3(0.0);
float param_86=Output_N38;
float3 param_87=Output_N34;
float3 param_88=Output_N35;
float3 param_89=Output_N36;
float3 param_90=noiseXYZ_N32;
float param_91=seedVal_N25;
float param_92=localTime_N25;
float param_93=normTime_N25;
ssGlobals param_95=Globals;
tempGlobals=param_95;
float3 param_94=float3(0.0);
N31_VELRAMP=param_86!=0.0;
N31_velocityMin=param_87;
N31_velocityMax=param_88;
N31_velocityDrag=param_89;
N31_noiseXYZ=param_90;
N31_seedVal=param_91;
N31_localTime=param_92;
N31_normTime=param_93;
float3 l9_350=float3(0.0);
float4 l9_351=tempGlobals.VertexColor;
float4 l9_352=l9_351;
float l9_353=l9_352.x+(l9_352.y*l9_352.z);
N31_velocityXYZ=l9_350;
float l9_354=fract((l9_353*18.984529)+N31_seedVal);
float l9_355=fract((l9_353*654.15588)+N31_seedVal);
float l9_356=fract((l9_353*45.722408)+N31_seedVal);
float3 l9_357=(float3(l9_355,l9_356,l9_354)-float3(0.5))*2.0;
float3 l9_358=float3(l9_355,l9_356,l9_354);
float3 l9_359=N31_velocityMin+(((l9_357+float3(1.0))/float3(2.0))*(N31_velocityMax-N31_velocityMin));
if (N31_VELRAMP)
{
l9_359=mix(N31_velocityMin,N31_velocityMax,l9_358);
}
float3 l9_360=l9_359;
float l9_361=N31_localTime;
float3 l9_362=N31_velocityDrag;
float3 l9_363=N31_noiseXYZ;
float l9_364=N31_normTime;
float3 l9_365=float3(l9_361,l9_361,l9_361);
float3 l9_366=l9_362;
float l9_367;
if (l9_365.x<=0.0)
{
l9_367=0.0;
}
else
{
l9_367=pow(l9_365.x,l9_366.x);
}
float l9_368=l9_367;
float l9_369;
if (l9_365.y<=0.0)
{
l9_369=0.0;
}
else
{
l9_369=pow(l9_365.y,l9_366.y);
}
float l9_370=l9_369;
float l9_371;
if (l9_365.z<=0.0)
{
l9_371=0.0;
}
else
{
l9_371=pow(l9_365.z,l9_366.z);
}
float3 l9_372=float3(l9_368,l9_370,l9_371);
float3 l9_373=l9_372;
float3 l9_374=(l9_360+l9_363)*l9_373;
if (N31_VELRAMP)
{
float l9_375=floor(l9_364*10000.0)/10000.0;
float2 l9_376=tempGlobals.Surface_UVCoord0;
float2 l9_377=(l9_376/float2(10000.0,1.0))+float2(l9_375,0.0);
float2 l9_378=l9_377;
float4 l9_379=float4(0.0);
int l9_380;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_381=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_381=0;
}
else
{
l9_381=gl_InstanceIndex%2;
}
int l9_382=l9_381;
l9_380=1-l9_382;
}
else
{
int l9_383=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_383=0;
}
else
{
l9_383=gl_InstanceIndex%2;
}
int l9_384=l9_383;
l9_380=l9_384;
}
int l9_385=l9_380;
int l9_386=velRampTextureLayout_tmp;
int l9_387=l9_385;
float2 l9_388=l9_378;
bool l9_389=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_390=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_391=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_392=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_393=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_394=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_395=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_396=0.0;
bool l9_397=l9_394&&(!l9_392);
float l9_398=1.0;
float l9_399=l9_388.x;
int l9_400=l9_391.x;
if (l9_400==1)
{
l9_399=fract(l9_399);
}
else
{
if (l9_400==2)
{
float l9_401=fract(l9_399);
float l9_402=l9_399-l9_401;
float l9_403=step(0.25,fract(l9_402*0.5));
l9_399=mix(l9_401,1.0-l9_401,fast::clamp(l9_403,0.0,1.0));
}
}
l9_388.x=l9_399;
float l9_404=l9_388.y;
int l9_405=l9_391.y;
if (l9_405==1)
{
l9_404=fract(l9_404);
}
else
{
if (l9_405==2)
{
float l9_406=fract(l9_404);
float l9_407=l9_404-l9_406;
float l9_408=step(0.25,fract(l9_407*0.5));
l9_404=mix(l9_406,1.0-l9_406,fast::clamp(l9_408,0.0,1.0));
}
}
l9_388.y=l9_404;
if (l9_392)
{
bool l9_409=l9_394;
bool l9_410;
if (l9_409)
{
l9_410=l9_391.x==3;
}
else
{
l9_410=l9_409;
}
float l9_411=l9_388.x;
float l9_412=l9_393.x;
float l9_413=l9_393.z;
bool l9_414=l9_410;
float l9_415=l9_398;
float l9_416=fast::clamp(l9_411,l9_412,l9_413);
float l9_417=step(abs(l9_411-l9_416),9.9999997e-06);
l9_415*=(l9_417+((1.0-float(l9_414))*(1.0-l9_417)));
l9_411=l9_416;
l9_388.x=l9_411;
l9_398=l9_415;
bool l9_418=l9_394;
bool l9_419;
if (l9_418)
{
l9_419=l9_391.y==3;
}
else
{
l9_419=l9_418;
}
float l9_420=l9_388.y;
float l9_421=l9_393.y;
float l9_422=l9_393.w;
bool l9_423=l9_419;
float l9_424=l9_398;
float l9_425=fast::clamp(l9_420,l9_421,l9_422);
float l9_426=step(abs(l9_420-l9_425),9.9999997e-06);
l9_424*=(l9_426+((1.0-float(l9_423))*(1.0-l9_426)));
l9_420=l9_425;
l9_388.y=l9_420;
l9_398=l9_424;
}
float2 l9_427=l9_388;
bool l9_428=l9_389;
float3x3 l9_429=l9_390;
if (l9_428)
{
l9_427=float2((l9_429*float3(l9_427,1.0)).xy);
}
float2 l9_430=l9_427;
l9_388=l9_430;
float l9_431=l9_388.x;
int l9_432=l9_391.x;
bool l9_433=l9_397;
float l9_434=l9_398;
if ((l9_432==0)||(l9_432==3))
{
float l9_435=l9_431;
float l9_436=0.0;
float l9_437=1.0;
bool l9_438=l9_433;
float l9_439=l9_434;
float l9_440=fast::clamp(l9_435,l9_436,l9_437);
float l9_441=step(abs(l9_435-l9_440),9.9999997e-06);
l9_439*=(l9_441+((1.0-float(l9_438))*(1.0-l9_441)));
l9_435=l9_440;
l9_431=l9_435;
l9_434=l9_439;
}
l9_388.x=l9_431;
l9_398=l9_434;
float l9_442=l9_388.y;
int l9_443=l9_391.y;
bool l9_444=l9_397;
float l9_445=l9_398;
if ((l9_443==0)||(l9_443==3))
{
float l9_446=l9_442;
float l9_447=0.0;
float l9_448=1.0;
bool l9_449=l9_444;
float l9_450=l9_445;
float l9_451=fast::clamp(l9_446,l9_447,l9_448);
float l9_452=step(abs(l9_446-l9_451),9.9999997e-06);
l9_450*=(l9_452+((1.0-float(l9_449))*(1.0-l9_452)));
l9_446=l9_451;
l9_442=l9_446;
l9_445=l9_450;
}
l9_388.y=l9_442;
l9_398=l9_445;
float2 l9_453=l9_388;
int l9_454=l9_386;
int l9_455=l9_387;
float l9_456=l9_396;
float2 l9_457=l9_453;
int l9_458=l9_454;
int l9_459=l9_455;
float3 l9_460=float3(0.0);
if (l9_458==0)
{
l9_460=float3(l9_457,0.0);
}
else
{
if (l9_458==1)
{
l9_460=float3(l9_457.x,(l9_457.y*0.5)+(0.5-(float(l9_459)*0.5)),0.0);
}
else
{
l9_460=float3(l9_457,float(l9_459));
}
}
float3 l9_461=l9_460;
float3 l9_462=l9_461;
float4 l9_463=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_462.xy,level(l9_456));
float4 l9_464=l9_463;
if (l9_394)
{
l9_464=mix(l9_395,l9_464,float4(l9_398));
}
float4 l9_465=l9_464;
l9_379=l9_465;
float4 l9_466=l9_379;
float3 l9_467=l9_466.xyz;
l9_374=(l9_360+l9_363)*l9_467;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_374=l9_360*l9_373;
}
}
float3 l9_468=l9_374;
N31_velocityXYZ=l9_468;
param_94=N31_velocityXYZ;
velocityXYZ_N31=param_94;
float Output_N55=0.0;
float param_96=(*sc_set0.UserUniforms).gravity;
Output_N55=param_96;
float Output_N108=0.0;
float param_97;
if ((int(FORCE_tmp)!=0))
{
param_97=1.001;
}
else
{
param_97=0.001;
}
param_97-=0.001;
Output_N108=param_97;
float3 Output_N46=float3(0.0);
float3 param_98=(*sc_set0.UserUniforms).localForce;
Output_N46=param_98;
float Output_N51=0.0;
float param_99=(*sc_set0.UserUniforms).sizeVelScale;
Output_N51=param_99;
float Output_N109=0.0;
float param_100;
if ((int(IGNOREVEL_tmp)!=0))
{
param_100=1.001;
}
else
{
param_100=0.001;
}
param_100-=0.001;
Output_N109=param_100;
float Output_N48=0.0;
float param_101=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
Output_N48=param_101;
float Output_N49=0.0;
float param_102=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
Output_N49=param_102;
float Output_N50=0.0;
float param_103=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
Output_N50=param_103;
float2 Output_N52=float2(0.0);
float2 param_104=(*sc_set0.UserUniforms).rotationRandom;
Output_N52=param_104;
float2 Output_N53=float2(0.0);
float2 param_105=(*sc_set0.UserUniforms).rotationRate;
Output_N53=param_105;
float Output_N54=0.0;
float param_106=(*sc_set0.UserUniforms).rotationDrag;
Output_N54=param_106;
float3 position_N2=float3(0.0);
float param_107=normTime_N25;
float param_108=localTime_N25;
float param_109=seedVal_N25;
float param_110=dieController_N25;
float param_111=Output_N13;
float param_112=Output_N14;
float2 param_113=sizeParticle_N23;
float3 param_114=spawnLoc_N1;
float3 param_115=velocityXYZ_N31;
float param_116=Output_N55;
float param_117=Output_N108;
float3 param_118=Output_N46;
float param_119=Output_N51;
float param_120=Output_N109;
float param_121=Output_N48;
float param_122=Output_N49;
float param_123=Output_N50;
float2 param_124=Output_N52;
float2 param_125=Output_N53;
float param_126=Output_N54;
ssGlobals param_128=Globals;
tempGlobals=param_128;
float3 param_127=float3(0.0);
N2_normTime=param_107;
N2_localTime=param_108;
N2_seedVal=param_109;
N2_dieController=param_110;
N2_MAXPARTICLECOUNT=param_111!=0.0;
N2_spawnMaxParticles=param_112;
N2_sizeLife=param_113;
N2_spawnLoc=param_114;
N2_velocityXYZ=param_115;
N2_gravity=param_116;
N2_FORCE=param_117!=0.0;
N2_localForce=param_118;
N2_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N2_sizeVelScale=param_119;
N2_IGNOREVEL=param_120!=0.0;
N2_ALIGNTOX=param_121!=0.0;
N2_ALIGNTOY=param_122!=0.0;
N2_ALIGNTOZ=param_123!=0.0;
N2_rotationRandom=param_124;
N2_rotationRate=param_125;
N2_rotationDrag=param_126;
N2_WORLDSPACE=NODE_67_DROPLIST_ITEM_tmp==1;
N2_WORLDFORCE=NODE_67_DROPLIST_ITEM_tmp==2;
float3 l9_469=float3(0.0);
float4 l9_470=tempGlobals.VertexColor;
float4 l9_471=tempGlobals.VertexColor;
float4 l9_472=tempGlobals.VertexColor;
float l9_473=l9_470.x+(l9_471.y*l9_472.z);
float l9_474=(fract((l9_473*1231.1232)+N2_seedVal)*1000.0)+1.0;
float l9_475=1.0;
float l9_476=fract((l9_473*15.32451)+N2_seedVal);
if (N2_MAXPARTICLECOUNT)
{
if ((N2_dieController>=0.99000001)||(l9_474>=N2_spawnMaxParticles))
{
l9_475=0.0;
}
else
{
if (N2_dieController>=0.99000001)
{
l9_475=0.0;
}
}
}
float3 l9_477=float3(0.0,((N2_gravity/2.0)*N2_localTime)*N2_localTime,0.0);
float3 l9_478=l9_469;
if (N2_FORCE)
{
l9_478=((N2_localForce/float3(2.0))*N2_localTime)*N2_localTime;
}
float4x4 l9_479=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_480=length(l9_479[0].xyz);
float2 l9_481=tempGlobals.Surface_UVCoord0;
float2 l9_482=l9_481;
float2 l9_483=(((l9_482-float2(0.5))*l9_475)*N2_sizeLife)*l9_480;
int l9_484=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_484=0;
}
else
{
l9_484=gl_InstanceIndex%2;
}
int l9_485=l9_484;
float4x4 l9_486=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_485];
int l9_487=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_487=0;
}
else
{
l9_487=gl_InstanceIndex%2;
}
int l9_488=l9_487;
float4x4 l9_489=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_488];
int l9_490=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_490=0;
}
else
{
l9_490=gl_InstanceIndex%2;
}
int l9_491=l9_490;
float4x4 l9_492=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_491];
float3 l9_493=normalize(float3(l9_486[0].z,l9_489[1].z,l9_492[2].z+N2_EPSILON));
float3 l9_494=normalize(cross(l9_493,float3(0.0,-1.0,0.0)));
float3 l9_495=normalize(cross(l9_494,l9_493));
float l9_496=N2_PI;
float l9_497=1.0;
if (N2_ALIGNTOX)
{
l9_494=float3(0.0,0.0,1.0);
l9_495=float3(0.0,1.0,0.0);
}
if (N2_ALIGNTOY)
{
l9_494=float3(1.0,0.0,0.0);
l9_495=float3(0.0,0.0,1.0);
}
if (N2_ALIGNTOZ)
{
l9_494=float3(1.0,0.0,0.0);
l9_495=float3(0.0,1.0,0.0);
}
float l9_498=mix(N2_rotationRandom.x,N2_rotationRandom.y,l9_476);
float l9_499=1.0-N2_normTime;
float l9_500=N2_rotationDrag;
float l9_501;
if (l9_499<=0.0)
{
l9_501=0.0;
}
else
{
l9_501=pow(l9_499,l9_500);
}
float l9_502=l9_501;
float l9_503=l9_502;
float l9_504=mix(N2_rotationRate.x,N2_rotationRate.y,l9_476);
float l9_505=((l9_504*l9_503)*N2_normTime)*2.0;
l9_496=N2_PI*((l9_505+l9_498)-0.5);
float2 l9_506=float2(cos(l9_496),sin(l9_496));
float2 l9_507=float2(-sin(l9_496),cos(l9_496));
float3 l9_508=float3((l9_494*l9_506.x)+(l9_495*l9_506.y));
float3 l9_509=float3((l9_494*l9_507.x)+(l9_495*l9_507.y));
float4x4 l9_510=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_511=length(l9_510[0].xyz);
float4x4 l9_512=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_513=length(l9_512[1].xyz);
float4x4 l9_514=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_515=length(l9_514[2].xyz);
float3 l9_516=float3(l9_511,l9_513,l9_515);
float4x4 l9_517=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_518=l9_517;
float4 l9_519=l9_518[0];
float4 l9_520=l9_518[1];
float4 l9_521=l9_518[2];
float3x3 l9_522=float3x3(float3(float3(l9_519.x,l9_520.x,l9_521.x)),float3(float3(l9_519.y,l9_520.y,l9_521.y)),float3(float3(l9_519.z,l9_520.z,l9_521.z)));
float3x3 l9_523=l9_522;
float3 l9_524=((N2_velocityXYZ+l9_477)+l9_478)*l9_523;
if (N2_WORLDFORCE)
{
float4x4 l9_525=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_526=l9_525;
float4 l9_527=l9_526[0];
float4 l9_528=l9_526[1];
float4 l9_529=l9_526[2];
float3x3 l9_530=float3x3(float3(float3(l9_527.x,l9_528.x,l9_529.x)),float3(float3(l9_527.y,l9_528.y,l9_529.y)),float3(float3(l9_527.z,l9_528.z,l9_529.z)));
float3x3 l9_531=l9_530;
l9_524=((N2_velocityXYZ*l9_531)+l9_477)+l9_478;
}
if (N2_WORLDSPACE)
{
l9_524=((N2_velocityXYZ*l9_516)+l9_477)+l9_478;
}
if (N2_ALIGNTOVEL)
{
float3 l9_532=normalize(((l9_524+l9_477)+l9_478)+float3(N2_EPSILON));
float3 l9_533=l9_524*(N2_localTime-0.0099999998);
float3 l9_534=l9_524*(N2_localTime+0.0099999998);
if (N2_IGNOREVEL)
{
l9_497=fast::max(N2_sizeVelScale,0.1);
l9_497=N2_sizeVelScale;
}
else
{
l9_497=length(l9_534-l9_533)*N2_sizeVelScale;
}
l9_508=l9_532;
l9_509=normalize(cross(l9_508,l9_493));
}
float4x4 l9_535=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_536=(l9_535*float4(N2_spawnLoc,1.0)).xyz+l9_524;
float3 l9_537=(l9_536+(l9_509*l9_483.x))+(l9_508*(l9_483.y*l9_497));
N2_position=l9_537;
param_127=N2_position;
position_N2=param_127;
WorldPosition=position_N2;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_129=v;
float3 param_130=WorldPosition;
float3 param_131=WorldNormal;
float3 param_132=WorldTangent;
float4 param_133=v.position;
out.varPosAndMotion=float4(param_130.x,param_130.y,param_130.z,out.varPosAndMotion.w);
float3 l9_538=normalize(param_131);
out.varNormalAndMotion=float4(l9_538.x,l9_538.y,l9_538.z,out.varNormalAndMotion.w);
float3 l9_539=normalize(param_132);
out.varTangent=float4(l9_539.x,l9_539.y,l9_539.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_540=param_129.position;
float4 l9_541=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_542=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_542=0;
}
else
{
l9_542=gl_InstanceIndex%2;
}
int l9_543=l9_542;
l9_541=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_543]*l9_540;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_544=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_544=0;
}
else
{
l9_544=gl_InstanceIndex%2;
}
int l9_545=l9_544;
l9_541=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_545]*l9_540;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_546=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_546=0;
}
else
{
l9_546=gl_InstanceIndex%2;
}
int l9_547=l9_546;
l9_541=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_547]*l9_540;
}
else
{
l9_541=l9_540;
}
}
}
float4 l9_548=l9_541;
out.varViewSpaceDepth=-l9_548.z;
}
float4 l9_549=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_549=param_133;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_550=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_550=0;
}
else
{
l9_550=gl_InstanceIndex%2;
}
int l9_551=l9_550;
l9_549=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_551]*param_129.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_552=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_552=0;
}
else
{
l9_552=gl_InstanceIndex%2;
}
int l9_553=l9_552;
l9_549=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_553]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_554=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_554=0;
}
else
{
l9_554=gl_InstanceIndex%2;
}
int l9_555=l9_554;
l9_549=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_555]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_129.texture0,param_129.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_556=param_129.position;
float4 l9_557=l9_556;
if (sc_RenderingSpace_tmp==1)
{
l9_557=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_556;
}
float4 l9_558=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_557;
float2 l9_559=((l9_558.xy/float2(l9_558.w))*0.5)+float2(0.5);
out.varShadowTex=l9_559;
}
float4 l9_560=l9_549;
if (sc_DepthBufferMode_tmp==1)
{
int l9_561=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_561=0;
}
else
{
l9_561=gl_InstanceIndex%2;
}
int l9_562=l9_561;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_562][2].w!=0.0)
{
float l9_563=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_560.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_560.w))*l9_563)-1.0)*l9_560.w;
}
}
float4 l9_564=l9_560;
l9_549=l9_564;
float4 l9_565=l9_549;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_566=l9_565.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_565.w);
l9_565=float4(l9_566.x,l9_566.y,l9_565.z,l9_565.w);
}
float4 l9_567=l9_565;
l9_549=l9_567;
float4 l9_568=l9_549;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_568.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_569=l9_568;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_570=dot(l9_569,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_571=l9_570;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_571;
}
}
float4 l9_572=float4(l9_568.x,-l9_568.y,(l9_568.z*0.5)+(l9_568.w*0.5),l9_568.w);
out.gl_Position=l9_572;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_574=param_129;
sc_Vertex_t l9_575=l9_574;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_576=l9_575;
float3 l9_577=in.blendShape0Pos;
float3 l9_578=in.blendShape0Normal;
float l9_579=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_580=l9_576;
float3 l9_581=l9_577;
float l9_582=l9_579;
float3 l9_583=l9_580.position.xyz+(l9_581*l9_582);
l9_580.position=float4(l9_583.x,l9_583.y,l9_583.z,l9_580.position.w);
l9_576=l9_580;
l9_576.normal+=(l9_578*l9_579);
l9_575=l9_576;
sc_Vertex_t l9_584=l9_575;
float3 l9_585=in.blendShape1Pos;
float3 l9_586=in.blendShape1Normal;
float l9_587=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_588=l9_584;
float3 l9_589=l9_585;
float l9_590=l9_587;
float3 l9_591=l9_588.position.xyz+(l9_589*l9_590);
l9_588.position=float4(l9_591.x,l9_591.y,l9_591.z,l9_588.position.w);
l9_584=l9_588;
l9_584.normal+=(l9_586*l9_587);
l9_575=l9_584;
sc_Vertex_t l9_592=l9_575;
float3 l9_593=in.blendShape2Pos;
float3 l9_594=in.blendShape2Normal;
float l9_595=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_596=l9_592;
float3 l9_597=l9_593;
float l9_598=l9_595;
float3 l9_599=l9_596.position.xyz+(l9_597*l9_598);
l9_596.position=float4(l9_599.x,l9_599.y,l9_599.z,l9_596.position.w);
l9_592=l9_596;
l9_592.normal+=(l9_594*l9_595);
l9_575=l9_592;
}
else
{
sc_Vertex_t l9_600=l9_575;
float3 l9_601=in.blendShape0Pos;
float l9_602=(*sc_set0.UserUniforms).weights0.x;
float3 l9_603=l9_600.position.xyz+(l9_601*l9_602);
l9_600.position=float4(l9_603.x,l9_603.y,l9_603.z,l9_600.position.w);
l9_575=l9_600;
sc_Vertex_t l9_604=l9_575;
float3 l9_605=in.blendShape1Pos;
float l9_606=(*sc_set0.UserUniforms).weights0.y;
float3 l9_607=l9_604.position.xyz+(l9_605*l9_606);
l9_604.position=float4(l9_607.x,l9_607.y,l9_607.z,l9_604.position.w);
l9_575=l9_604;
sc_Vertex_t l9_608=l9_575;
float3 l9_609=in.blendShape2Pos;
float l9_610=(*sc_set0.UserUniforms).weights0.z;
float3 l9_611=l9_608.position.xyz+(l9_609*l9_610);
l9_608.position=float4(l9_611.x,l9_611.y,l9_611.z,l9_608.position.w);
l9_575=l9_608;
sc_Vertex_t l9_612=l9_575;
float3 l9_613=in.blendShape3Pos;
float l9_614=(*sc_set0.UserUniforms).weights0.w;
float3 l9_615=l9_612.position.xyz+(l9_613*l9_614);
l9_612.position=float4(l9_615.x,l9_615.y,l9_615.z,l9_612.position.w);
l9_575=l9_612;
sc_Vertex_t l9_616=l9_575;
float3 l9_617=in.blendShape4Pos;
float l9_618=(*sc_set0.UserUniforms).weights1.x;
float3 l9_619=l9_616.position.xyz+(l9_617*l9_618);
l9_616.position=float4(l9_619.x,l9_619.y,l9_619.z,l9_616.position.w);
l9_575=l9_616;
sc_Vertex_t l9_620=l9_575;
float3 l9_621=in.blendShape5Pos;
float l9_622=(*sc_set0.UserUniforms).weights1.y;
float3 l9_623=l9_620.position.xyz+(l9_621*l9_622);
l9_620.position=float4(l9_623.x,l9_623.y,l9_623.z,l9_620.position.w);
l9_575=l9_620;
}
}
l9_574=l9_575;
sc_Vertex_t l9_624=l9_574;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_625=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_625=float4(1.0,fract(in.boneData.yzw));
l9_625.x-=dot(l9_625.yzw,float3(1.0));
}
float4 l9_626=l9_625;
float4 l9_627=l9_626;
int l9_628=int(in.boneData.x);
int l9_629=int(in.boneData.y);
int l9_630=int(in.boneData.z);
int l9_631=int(in.boneData.w);
int l9_632=l9_628;
float4 l9_633=l9_624.position;
float3 l9_634=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_635=l9_632;
float4 l9_636=(*sc_set0.sc_BonesUBO).sc_Bones[l9_635].boneMatrix[0];
float4 l9_637=(*sc_set0.sc_BonesUBO).sc_Bones[l9_635].boneMatrix[1];
float4 l9_638=(*sc_set0.sc_BonesUBO).sc_Bones[l9_635].boneMatrix[2];
float4 l9_639[3];
l9_639[0]=l9_636;
l9_639[1]=l9_637;
l9_639[2]=l9_638;
l9_634=float3(dot(l9_633,l9_639[0]),dot(l9_633,l9_639[1]),dot(l9_633,l9_639[2]));
}
else
{
l9_634=l9_633.xyz;
}
float3 l9_640=l9_634;
float3 l9_641=l9_640;
float l9_642=l9_627.x;
int l9_643=l9_629;
float4 l9_644=l9_624.position;
float3 l9_645=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_646=l9_643;
float4 l9_647=(*sc_set0.sc_BonesUBO).sc_Bones[l9_646].boneMatrix[0];
float4 l9_648=(*sc_set0.sc_BonesUBO).sc_Bones[l9_646].boneMatrix[1];
float4 l9_649=(*sc_set0.sc_BonesUBO).sc_Bones[l9_646].boneMatrix[2];
float4 l9_650[3];
l9_650[0]=l9_647;
l9_650[1]=l9_648;
l9_650[2]=l9_649;
l9_645=float3(dot(l9_644,l9_650[0]),dot(l9_644,l9_650[1]),dot(l9_644,l9_650[2]));
}
else
{
l9_645=l9_644.xyz;
}
float3 l9_651=l9_645;
float3 l9_652=l9_651;
float l9_653=l9_627.y;
int l9_654=l9_630;
float4 l9_655=l9_624.position;
float3 l9_656=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_657=l9_654;
float4 l9_658=(*sc_set0.sc_BonesUBO).sc_Bones[l9_657].boneMatrix[0];
float4 l9_659=(*sc_set0.sc_BonesUBO).sc_Bones[l9_657].boneMatrix[1];
float4 l9_660=(*sc_set0.sc_BonesUBO).sc_Bones[l9_657].boneMatrix[2];
float4 l9_661[3];
l9_661[0]=l9_658;
l9_661[1]=l9_659;
l9_661[2]=l9_660;
l9_656=float3(dot(l9_655,l9_661[0]),dot(l9_655,l9_661[1]),dot(l9_655,l9_661[2]));
}
else
{
l9_656=l9_655.xyz;
}
float3 l9_662=l9_656;
float3 l9_663=l9_662;
float l9_664=l9_627.z;
int l9_665=l9_631;
float4 l9_666=l9_624.position;
float3 l9_667=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_668=l9_665;
float4 l9_669=(*sc_set0.sc_BonesUBO).sc_Bones[l9_668].boneMatrix[0];
float4 l9_670=(*sc_set0.sc_BonesUBO).sc_Bones[l9_668].boneMatrix[1];
float4 l9_671=(*sc_set0.sc_BonesUBO).sc_Bones[l9_668].boneMatrix[2];
float4 l9_672[3];
l9_672[0]=l9_669;
l9_672[1]=l9_670;
l9_672[2]=l9_671;
l9_667=float3(dot(l9_666,l9_672[0]),dot(l9_666,l9_672[1]),dot(l9_666,l9_672[2]));
}
else
{
l9_667=l9_666.xyz;
}
float3 l9_673=l9_667;
float3 l9_674=(((l9_641*l9_642)+(l9_652*l9_653))+(l9_663*l9_664))+(l9_673*l9_627.w);
l9_624.position=float4(l9_674.x,l9_674.y,l9_674.z,l9_624.position.w);
int l9_675=l9_628;
float3x3 l9_676=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_675].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_675].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_675].normalMatrix[2].xyz));
float3x3 l9_677=l9_676;
float3x3 l9_678=l9_677;
int l9_679=l9_629;
float3x3 l9_680=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_679].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_679].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_679].normalMatrix[2].xyz));
float3x3 l9_681=l9_680;
float3x3 l9_682=l9_681;
int l9_683=l9_630;
float3x3 l9_684=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_683].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_683].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_683].normalMatrix[2].xyz));
float3x3 l9_685=l9_684;
float3x3 l9_686=l9_685;
int l9_687=l9_631;
float3x3 l9_688=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_687].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_687].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_687].normalMatrix[2].xyz));
float3x3 l9_689=l9_688;
float3x3 l9_690=l9_689;
l9_624.normal=((((l9_678*l9_624.normal)*l9_627.x)+((l9_682*l9_624.normal)*l9_627.y))+((l9_686*l9_624.normal)*l9_627.z))+((l9_690*l9_624.normal)*l9_627.w);
l9_624.tangent=((((l9_678*l9_624.tangent)*l9_627.x)+((l9_682*l9_624.tangent)*l9_627.y))+((l9_686*l9_624.tangent)*l9_627.z))+((l9_690*l9_624.tangent)*l9_627.w);
}
l9_574=l9_624;
float l9_691=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_692=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_693=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_694=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_695=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_696=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_697=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_698=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_699=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_700=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_701=l9_691/l9_692;
int l9_702=gl_InstanceIndex;
int l9_703=l9_702;
l9_574.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_574.position;
float3 l9_704=l9_574.position.xyz;
float3 l9_705=float3(float(l9_703%int(l9_693))*l9_691,float(l9_703/int(l9_693))*l9_691,(float(l9_703)*l9_701)+l9_698);
float3 l9_706=l9_704+l9_705;
float4 l9_707=float4(l9_706-l9_700,1.0);
float l9_708=l9_694;
float l9_709=l9_695;
float l9_710=l9_696;
float l9_711=l9_697;
float l9_712=l9_698;
float l9_713=l9_699;
float4x4 l9_714=float4x4(float4(2.0/(l9_709-l9_708),0.0,0.0,(-(l9_709+l9_708))/(l9_709-l9_708)),float4(0.0,2.0/(l9_711-l9_710),0.0,(-(l9_711+l9_710))/(l9_711-l9_710)),float4(0.0,0.0,(-2.0)/(l9_713-l9_712),(-(l9_713+l9_712))/(l9_713-l9_712)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_715=l9_714;
float4 l9_716=l9_715*l9_707;
l9_716.w=1.0;
out.varScreenPos=l9_716;
float4 l9_717=l9_716*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_717.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_718=l9_717;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_719=dot(l9_718,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_720=l9_719;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_720;
}
}
float4 l9_721=float4(l9_717.x,-l9_717.y,(l9_717.z*0.5)+(l9_717.w*0.5),l9_717.w);
out.gl_Position=l9_721;
param_129=l9_574;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_722=param_129;
sc_Vertex_t l9_723=l9_722;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_724=l9_723;
float3 l9_725=in.blendShape0Pos;
float3 l9_726=in.blendShape0Normal;
float l9_727=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_728=l9_724;
float3 l9_729=l9_725;
float l9_730=l9_727;
float3 l9_731=l9_728.position.xyz+(l9_729*l9_730);
l9_728.position=float4(l9_731.x,l9_731.y,l9_731.z,l9_728.position.w);
l9_724=l9_728;
l9_724.normal+=(l9_726*l9_727);
l9_723=l9_724;
sc_Vertex_t l9_732=l9_723;
float3 l9_733=in.blendShape1Pos;
float3 l9_734=in.blendShape1Normal;
float l9_735=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_736=l9_732;
float3 l9_737=l9_733;
float l9_738=l9_735;
float3 l9_739=l9_736.position.xyz+(l9_737*l9_738);
l9_736.position=float4(l9_739.x,l9_739.y,l9_739.z,l9_736.position.w);
l9_732=l9_736;
l9_732.normal+=(l9_734*l9_735);
l9_723=l9_732;
sc_Vertex_t l9_740=l9_723;
float3 l9_741=in.blendShape2Pos;
float3 l9_742=in.blendShape2Normal;
float l9_743=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_744=l9_740;
float3 l9_745=l9_741;
float l9_746=l9_743;
float3 l9_747=l9_744.position.xyz+(l9_745*l9_746);
l9_744.position=float4(l9_747.x,l9_747.y,l9_747.z,l9_744.position.w);
l9_740=l9_744;
l9_740.normal+=(l9_742*l9_743);
l9_723=l9_740;
}
else
{
sc_Vertex_t l9_748=l9_723;
float3 l9_749=in.blendShape0Pos;
float l9_750=(*sc_set0.UserUniforms).weights0.x;
float3 l9_751=l9_748.position.xyz+(l9_749*l9_750);
l9_748.position=float4(l9_751.x,l9_751.y,l9_751.z,l9_748.position.w);
l9_723=l9_748;
sc_Vertex_t l9_752=l9_723;
float3 l9_753=in.blendShape1Pos;
float l9_754=(*sc_set0.UserUniforms).weights0.y;
float3 l9_755=l9_752.position.xyz+(l9_753*l9_754);
l9_752.position=float4(l9_755.x,l9_755.y,l9_755.z,l9_752.position.w);
l9_723=l9_752;
sc_Vertex_t l9_756=l9_723;
float3 l9_757=in.blendShape2Pos;
float l9_758=(*sc_set0.UserUniforms).weights0.z;
float3 l9_759=l9_756.position.xyz+(l9_757*l9_758);
l9_756.position=float4(l9_759.x,l9_759.y,l9_759.z,l9_756.position.w);
l9_723=l9_756;
sc_Vertex_t l9_760=l9_723;
float3 l9_761=in.blendShape3Pos;
float l9_762=(*sc_set0.UserUniforms).weights0.w;
float3 l9_763=l9_760.position.xyz+(l9_761*l9_762);
l9_760.position=float4(l9_763.x,l9_763.y,l9_763.z,l9_760.position.w);
l9_723=l9_760;
sc_Vertex_t l9_764=l9_723;
float3 l9_765=in.blendShape4Pos;
float l9_766=(*sc_set0.UserUniforms).weights1.x;
float3 l9_767=l9_764.position.xyz+(l9_765*l9_766);
l9_764.position=float4(l9_767.x,l9_767.y,l9_767.z,l9_764.position.w);
l9_723=l9_764;
sc_Vertex_t l9_768=l9_723;
float3 l9_769=in.blendShape5Pos;
float l9_770=(*sc_set0.UserUniforms).weights1.y;
float3 l9_771=l9_768.position.xyz+(l9_769*l9_770);
l9_768.position=float4(l9_771.x,l9_771.y,l9_771.z,l9_768.position.w);
l9_723=l9_768;
}
}
l9_722=l9_723;
sc_Vertex_t l9_772=l9_722;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_773=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_773=float4(1.0,fract(in.boneData.yzw));
l9_773.x-=dot(l9_773.yzw,float3(1.0));
}
float4 l9_774=l9_773;
float4 l9_775=l9_774;
int l9_776=int(in.boneData.x);
int l9_777=int(in.boneData.y);
int l9_778=int(in.boneData.z);
int l9_779=int(in.boneData.w);
int l9_780=l9_776;
float4 l9_781=l9_772.position;
float3 l9_782=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_783=l9_780;
float4 l9_784=(*sc_set0.sc_BonesUBO).sc_Bones[l9_783].boneMatrix[0];
float4 l9_785=(*sc_set0.sc_BonesUBO).sc_Bones[l9_783].boneMatrix[1];
float4 l9_786=(*sc_set0.sc_BonesUBO).sc_Bones[l9_783].boneMatrix[2];
float4 l9_787[3];
l9_787[0]=l9_784;
l9_787[1]=l9_785;
l9_787[2]=l9_786;
l9_782=float3(dot(l9_781,l9_787[0]),dot(l9_781,l9_787[1]),dot(l9_781,l9_787[2]));
}
else
{
l9_782=l9_781.xyz;
}
float3 l9_788=l9_782;
float3 l9_789=l9_788;
float l9_790=l9_775.x;
int l9_791=l9_777;
float4 l9_792=l9_772.position;
float3 l9_793=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_794=l9_791;
float4 l9_795=(*sc_set0.sc_BonesUBO).sc_Bones[l9_794].boneMatrix[0];
float4 l9_796=(*sc_set0.sc_BonesUBO).sc_Bones[l9_794].boneMatrix[1];
float4 l9_797=(*sc_set0.sc_BonesUBO).sc_Bones[l9_794].boneMatrix[2];
float4 l9_798[3];
l9_798[0]=l9_795;
l9_798[1]=l9_796;
l9_798[2]=l9_797;
l9_793=float3(dot(l9_792,l9_798[0]),dot(l9_792,l9_798[1]),dot(l9_792,l9_798[2]));
}
else
{
l9_793=l9_792.xyz;
}
float3 l9_799=l9_793;
float3 l9_800=l9_799;
float l9_801=l9_775.y;
int l9_802=l9_778;
float4 l9_803=l9_772.position;
float3 l9_804=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_805=l9_802;
float4 l9_806=(*sc_set0.sc_BonesUBO).sc_Bones[l9_805].boneMatrix[0];
float4 l9_807=(*sc_set0.sc_BonesUBO).sc_Bones[l9_805].boneMatrix[1];
float4 l9_808=(*sc_set0.sc_BonesUBO).sc_Bones[l9_805].boneMatrix[2];
float4 l9_809[3];
l9_809[0]=l9_806;
l9_809[1]=l9_807;
l9_809[2]=l9_808;
l9_804=float3(dot(l9_803,l9_809[0]),dot(l9_803,l9_809[1]),dot(l9_803,l9_809[2]));
}
else
{
l9_804=l9_803.xyz;
}
float3 l9_810=l9_804;
float3 l9_811=l9_810;
float l9_812=l9_775.z;
int l9_813=l9_779;
float4 l9_814=l9_772.position;
float3 l9_815=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_816=l9_813;
float4 l9_817=(*sc_set0.sc_BonesUBO).sc_Bones[l9_816].boneMatrix[0];
float4 l9_818=(*sc_set0.sc_BonesUBO).sc_Bones[l9_816].boneMatrix[1];
float4 l9_819=(*sc_set0.sc_BonesUBO).sc_Bones[l9_816].boneMatrix[2];
float4 l9_820[3];
l9_820[0]=l9_817;
l9_820[1]=l9_818;
l9_820[2]=l9_819;
l9_815=float3(dot(l9_814,l9_820[0]),dot(l9_814,l9_820[1]),dot(l9_814,l9_820[2]));
}
else
{
l9_815=l9_814.xyz;
}
float3 l9_821=l9_815;
float3 l9_822=(((l9_789*l9_790)+(l9_800*l9_801))+(l9_811*l9_812))+(l9_821*l9_775.w);
l9_772.position=float4(l9_822.x,l9_822.y,l9_822.z,l9_772.position.w);
int l9_823=l9_776;
float3x3 l9_824=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_823].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_823].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_823].normalMatrix[2].xyz));
float3x3 l9_825=l9_824;
float3x3 l9_826=l9_825;
int l9_827=l9_777;
float3x3 l9_828=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_827].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_827].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_827].normalMatrix[2].xyz));
float3x3 l9_829=l9_828;
float3x3 l9_830=l9_829;
int l9_831=l9_778;
float3x3 l9_832=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_831].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_831].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_831].normalMatrix[2].xyz));
float3x3 l9_833=l9_832;
float3x3 l9_834=l9_833;
int l9_835=l9_779;
float3x3 l9_836=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_835].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_835].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_835].normalMatrix[2].xyz));
float3x3 l9_837=l9_836;
float3x3 l9_838=l9_837;
l9_772.normal=((((l9_826*l9_772.normal)*l9_775.x)+((l9_830*l9_772.normal)*l9_775.y))+((l9_834*l9_772.normal)*l9_775.z))+((l9_838*l9_772.normal)*l9_775.w);
l9_772.tangent=((((l9_826*l9_772.tangent)*l9_775.x)+((l9_830*l9_772.tangent)*l9_775.y))+((l9_834*l9_772.tangent)*l9_775.z))+((l9_838*l9_772.tangent)*l9_775.w);
}
l9_722=l9_772;
float3 l9_839=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_840=((l9_722.position.xy/float2(l9_722.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_840.x,l9_840.y,out.varTex01.z,out.varTex01.w);
l9_722.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_722.position;
float3 l9_841=l9_722.position.xyz-l9_839;
l9_722.position=float4(l9_841.x,l9_841.y,l9_841.z,l9_722.position.w);
out.varPosAndMotion=float4(l9_722.position.xyz.x,l9_722.position.xyz.y,l9_722.position.xyz.z,out.varPosAndMotion.w);
float3 l9_842=normalize(l9_722.normal);
out.varNormalAndMotion=float4(l9_842.x,l9_842.y,l9_842.z,out.varNormalAndMotion.w);
float l9_843=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_844=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_845=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_846=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_847=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_848=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_849=l9_843;
float l9_850=l9_844;
float l9_851=l9_845;
float l9_852=l9_846;
float l9_853=l9_847;
float l9_854=l9_848;
float4x4 l9_855=float4x4(float4(2.0/(l9_850-l9_849),0.0,0.0,(-(l9_850+l9_849))/(l9_850-l9_849)),float4(0.0,2.0/(l9_852-l9_851),0.0,(-(l9_852+l9_851))/(l9_852-l9_851)),float4(0.0,0.0,(-2.0)/(l9_854-l9_853),(-(l9_854+l9_853))/(l9_854-l9_853)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_856=l9_855;
float4 l9_857=float4(0.0);
float3 l9_858=(l9_856*l9_722.position).xyz;
l9_857=float4(l9_858.x,l9_858.y,l9_858.z,l9_857.w);
l9_857.w=1.0;
out.varScreenPos=l9_857;
float4 l9_859=l9_857*1.0;
float4 l9_860=l9_859;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_860.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_861=l9_860;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_862=dot(l9_861,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_863=l9_862;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_863;
}
}
float4 l9_864=float4(l9_860.x,-l9_860.y,(l9_860.z*0.5)+(l9_860.w*0.5),l9_860.w);
out.gl_Position=l9_864;
param_129=l9_722;
}
}
v=param_129;
float3 param_134=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_865=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_134,1.0);
float3 l9_866=param_134;
float3 l9_867=l9_865.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_868=0;
}
else
{
l9_868=gl_InstanceIndex%2;
}
int l9_869=l9_868;
float4 l9_870=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_869]*float4(l9_866,1.0);
float2 l9_871=l9_870.xy/float2(l9_870.w);
l9_870=float4(l9_871.x,l9_871.y,l9_870.z,l9_870.w);
int l9_872=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_872=0;
}
else
{
l9_872=gl_InstanceIndex%2;
}
int l9_873=l9_872;
float4 l9_874=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_873]*float4(l9_867,1.0);
float2 l9_875=l9_874.xy/float2(l9_874.w);
l9_874=float4(l9_875.x,l9_875.y,l9_874.z,l9_874.w);
float2 l9_876=(l9_870.xy-l9_874.xy)*0.5;
out.varPosAndMotion.w=l9_876.x;
out.varNormalAndMotion.w=l9_876.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float4 VertexColor;
float2 Surface_UVCoord1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float spawnMaxParticles;
float2 sizeStart;
float2 sizeEnd;
float2 sizeStartMin;
float2 sizeStartMax;
float2 sizeEndMin;
float2 sizeEndMax;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandom;
float2 rotationRate;
float rotationDrag;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 vectorTextureSize;
float4 vectorTextureDims;
float4 vectorTextureView;
float3x3 vectorTextureTransform;
float4 vectorTextureUvMinMax;
float4 vectorTextureBorderColor;
float flowStrength;
float flowSpeed;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float alphaDissolveMult;
float Port_Input1_N069;
float Port_Input1_N068;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> sizeRampTexture [[id(18)]];
texture2d<float> vectorTexture [[id(19)]];
texture2d<float> velRampTexture [[id(20)]];
sampler colorRampTextureSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler mainTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler sizeRampTextureSmpSC [[id(31)]];
sampler vectorTextureSmpSC [[id(32)]];
sampler velRampTextureSmpSC [[id(33)]];
constant userUniformsObj* UserUniforms [[id(34)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
bool N58_BASETEXTURE=false;
bool N58_FLIPBOOK=false;
float4 N58_flipbookTex=float4(0.0);
bool N58_VECTORFIELD=false;
float4 N58_vectorFieldTex=float4(0.0);
float4 N58_colorLife=float4(0.0);
bool N58_COLORRAMP=false;
float4 N58_colorRampTex=float4(0.0);
bool N58_ALPHADISSOLVE=false;
float N58_alphaDissolveMult=0.0;
bool N58_BLACKASALPHA=false;
bool N58_PREMULTIPLIEDCOLOR=false;
float N58_normTime=0.0;
float4 N58_result=float4(0.0);
float N76_numValidFrames=0.0;
float2 N76_gridSize=float2(0.0);
float N76_flipBookSpeedMult=0.0;
float N76_flipBookRandomStart=0.0;
float2 N76_realLifeTimeMinMax=float2(0.0);
bool N76_FLIPBOOKBLEND=false;
bool N76_FLIPBOOKBYLIFE=false;
float N76_seedVal=0.0;
float N76_localTime=0.0;
float N76_flowStrength=0.0;
float N76_flowSpeed=0.0;
float4 N76_flipbookTex=float4(0.0);
float4 N76_vectorTex=float4(0.0);
float N25_timeGlobal=0.0;
bool N25_EXTERNALTIME=false;
float N25_externalTime=0.0;
bool N25_WORLDPOSSEED=false;
float N25_externalSeed=0.0;
bool N25_LIFETIMEMINMAX=false;
float N25_lifeTimeConstant=0.0;
float2 N25_lifeTimeMinMax=float2(0.0);
bool N25_INSTANTSPAWN=false;
float N25_normTime=0.0;
float N25_localTime=0.0;
float N25_seedVal=0.0;
float2 N25_realLifeTimeMinMax=float2(0.0);
float3 N70_colorStart=float3(0.0);
float3 N70_colorEnd=float3(0.0);
bool N70_COLORMINMAX=false;
float3 N70_colorMinStart=float3(0.0);
float3 N70_colorMinEnd=float3(0.0);
float3 N70_colorMaxStart=float3(0.0);
float3 N70_colorMaxEnd=float3(0.0);
bool N70_COLORMONOMIN=false;
float N70_alphaStart=0.0;
float N70_alphaEnd=0.0;
bool N70_ALPHAMINMAX=false;
float N70_alphaMinStart=0.0;
float N70_alphaMinEnd=0.0;
float N70_alphaMaxStart=0.0;
float N70_alphaMaxEnd=0.0;
float N70_seedVal=0.0;
float N70_normTime=0.0;
float4 N70_colorLife=float4(0.0);
float2 N71_texSize=float2(0.0);
float4 N71_colorRampMult=float4(0.0);
bool N71_NORANDOFFSET=false;
float N71_normTime=0.0;
float4 N71_colorRampTex=float4(0.0);
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=in.varTex01.xy;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord1=in.varTex01.zw;
float Output_N28=0.0;
float param;
if ((int(BASETEXTURE_tmp)!=0))
{
param=1.001;
}
else
{
param=0.001;
}
param-=0.001;
Output_N28=param;
float Output_N62=0.0;
float param_1;
if ((int(FLIPBOOK_tmp)!=0))
{
param_1=1.001;
}
else
{
param_1=0.001;
}
param_1-=0.001;
Output_N62=param_1;
float Output_N63=0.0;
float param_2=(*sc_set0.UserUniforms).numValidFrames;
Output_N63=param_2;
float2 Output_N64=float2(0.0);
float2 param_3=(*sc_set0.UserUniforms).gridSize;
Output_N64=param_3;
float Output_N65=0.0;
float param_4=(*sc_set0.UserUniforms).flipBookSpeedMult;
Output_N65=param_4;
float Output_N66=0.0;
float param_5=(*sc_set0.UserUniforms).flipBookRandomStart;
Output_N66=param_5;
float Output_N3=0.0;
float param_6=(*sc_set0.UserUniforms).timeGlobal;
Output_N3=param_6;
float Output_N6=0.0;
float param_7;
if ((int(EXTERNALTIME_tmp)!=0))
{
param_7=1.001;
}
else
{
param_7=0.001;
}
param_7-=0.001;
Output_N6=param_7;
float Output_N5=0.0;
float param_8=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5=param_8;
float Output_N8=0.0;
float param_9;
if ((int(WORLDPOSSEED_tmp)!=0))
{
param_9=1.001;
}
else
{
param_9=0.001;
}
param_9-=0.001;
Output_N8=param_9;
float Output_N7=0.0;
float param_10=(*sc_set0.UserUniforms).externalSeed;
Output_N7=param_10;
float Output_N0=0.0;
float param_11;
if ((int(LIFETIMEMINMAX_tmp)!=0))
{
param_11=1.001;
}
else
{
param_11=0.001;
}
param_11-=0.001;
Output_N0=param_11;
float Output_N9=0.0;
float param_12=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9=param_12;
float2 Output_N10=float2(0.0);
float2 param_13=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10=param_13;
float Output_N11=0.0;
float param_14;
if ((int(INSTANTSPAWN_tmp)!=0))
{
param_14=1.001;
}
else
{
param_14=0.001;
}
param_14-=0.001;
Output_N11=param_14;
float normTime_N25=0.0;
float localTime_N25=0.0;
float seedVal_N25=0.0;
float2 realLifeTimeMinMax_N25=float2(0.0);
float param_15=Output_N3;
float param_16=Output_N6;
float param_17=Output_N5;
float param_18=Output_N8;
float param_19=Output_N7;
float param_20=Output_N0;
float param_21=Output_N9;
float2 param_22=Output_N10;
float param_23=Output_N11;
ssGlobals param_28=Globals;
ssGlobals tempGlobals=param_28;
float param_24=0.0;
float param_25=0.0;
float param_26=0.0;
float2 param_27=float2(0.0);
N25_timeGlobal=param_15;
N25_EXTERNALTIME=param_16!=0.0;
N25_externalTime=param_17;
N25_WORLDPOSSEED=param_18!=0.0;
N25_externalSeed=param_19;
N25_LIFETIMEMINMAX=param_20!=0.0;
N25_lifeTimeConstant=param_21;
N25_lifeTimeMinMax=param_22;
N25_INSTANTSPAWN=param_23!=0.0;
float l9_0=0.0;
if (N25_WORLDPOSSEED)
{
float4x4 l9_1=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_0=length(float4(1.0)*l9_1);
}
N25_realLifeTimeMinMax=float2(N25_lifeTimeConstant);
if (N25_LIFETIMEMINMAX)
{
N25_realLifeTimeMinMax=N25_lifeTimeMinMax;
}
float l9_2=fast::max(N25_realLifeTimeMinMax.x,0.0099999998);
float l9_3=fast::max(N25_realLifeTimeMinMax.y,0.0099999998);
N25_seedVal=N25_externalSeed+l9_0;
float4 l9_4=tempGlobals.VertexColor;
float4 l9_5=tempGlobals.VertexColor;
float4 l9_6=tempGlobals.VertexColor;
float l9_7=l9_4.x+(l9_5.y*l9_6.z);
float l9_8=fract((l9_7*12.12358)+N25_seedVal);
float l9_9=fract((l9_7*3.5358)+N25_seedVal);
float l9_10=tempGlobals.gTimeElapsed;
float l9_11=l9_10;
if (N25_EXTERNALTIME)
{
l9_11=N25_externalTime;
}
if (!N25_INSTANTSPAWN)
{
float l9_12=fract(((l9_11*N25_timeGlobal)*(1.0/N25_realLifeTimeMinMax.y))+l9_8);
N25_localTime=l9_12*N25_realLifeTimeMinMax.y;
}
else
{
N25_localTime=N25_timeGlobal*l9_11;
}
float l9_13=mix(N25_localTime/l9_2,N25_localTime/l9_3,l9_9);
N25_normTime=fast::clamp(l9_13,0.0,1.0);
param_24=N25_normTime;
param_25=N25_localTime;
param_26=N25_seedVal;
param_27=N25_realLifeTimeMinMax;
normTime_N25=param_24;
localTime_N25=param_25;
seedVal_N25=param_26;
realLifeTimeMinMax_N25=param_27;
float Output_N92=0.0;
float param_29;
if ((int(FLIPBOOKBLEND_tmp)!=0))
{
param_29=1.001;
}
else
{
param_29=0.001;
}
param_29-=0.001;
Output_N92=param_29;
float Output_N91=0.0;
float param_30;
if ((int(FLIPBOOKBYLIFE_tmp)!=0))
{
param_30=1.001;
}
else
{
param_30=0.001;
}
param_30-=0.001;
Output_N91=param_30;
float Output_N112=0.0;
float param_31=(*sc_set0.UserUniforms).flowStrength;
Output_N112=param_31;
float Output_N113=0.0;
float param_32=(*sc_set0.UserUniforms).flowSpeed;
Output_N113=param_32;
float4 flipbookTex_N76=float4(0.0);
float4 vectorTex_N76=float4(0.0);
float param_33=Output_N63;
float2 param_34=Output_N64;
float param_35=Output_N65;
float param_36=Output_N66;
float2 param_37=realLifeTimeMinMax_N25;
float param_38=Output_N92;
float param_39=Output_N91;
float param_40=seedVal_N25;
float param_41=localTime_N25;
float param_42=Output_N112;
float param_43=Output_N113;
ssGlobals param_46=Globals;
tempGlobals=param_46;
float4 param_44=float4(0.0);
float4 param_45=float4(0.0);
N76_numValidFrames=param_33;
N76_gridSize=param_34;
N76_flipBookSpeedMult=param_35;
N76_flipBookRandomStart=param_36;
N76_realLifeTimeMinMax=param_37;
N76_FLIPBOOKBLEND=param_38!=0.0;
N76_FLIPBOOKBYLIFE=param_39!=0.0;
N76_seedVal=param_40;
N76_localTime=param_41;
N76_flowStrength=param_42;
N76_flowSpeed=param_43;
float2 l9_14=tempGlobals.Surface_UVCoord0;
float2 l9_15=l9_14;
float2 l9_16=tempGlobals.Surface_UVCoord1;
float2 l9_17=l9_16;
float4 l9_18=tempGlobals.VertexColor;
float4 l9_19=tempGlobals.VertexColor;
float4 l9_20=tempGlobals.VertexColor;
float l9_21=l9_18.x+(l9_19.y*l9_20.z);
float l9_22=fract((l9_21*43.2234)+N76_seedVal);
float l9_23=fract((l9_21*3.5358)+N76_seedVal);
float l9_24=fast::max(N76_realLifeTimeMinMax.x,0.0099999998);
float l9_25=fast::max(N76_realLifeTimeMinMax.y,0.0099999998);
float l9_26=N76_localTime;
if (N76_FLIPBOOKBYLIFE)
{
float l9_27=mix(l9_24,l9_25,l9_23);
l9_26=N76_localTime/l9_27;
}
float l9_28=mix(0.0,N76_flipBookRandomStart,l9_22);
float2 l9_29=l9_15/N76_gridSize;
float l9_30=(l9_26*N76_flipBookSpeedMult)+l9_28;
l9_30=mod(l9_30,N76_numValidFrames);
float l9_31=floor(l9_30)*(1.0/N76_gridSize.x);
float l9_32=mod(floor((-l9_30)/N76_gridSize.x),N76_gridSize.y)*(1.0/N76_gridSize.y);
float l9_33=l9_30+1.0;
l9_33=mod(l9_33,N76_numValidFrames);
float l9_34=floor(l9_33)*(1.0/N76_gridSize.x);
float l9_35=floor((-l9_33)*(1.0/N76_gridSize.x))*(1.0/N76_gridSize.y);
float l9_36=fract(l9_30);
l9_15=l9_29+float2(l9_31,l9_32);
l9_17=l9_29+float2(l9_34,l9_35);
if (N76_FLIPBOOKBLEND)
{
float2 l9_37=l9_15;
float4 l9_38=float4(0.0);
int l9_39;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_40=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_40=0;
}
else
{
l9_40=in.varStereoViewID;
}
int l9_41=l9_40;
l9_39=1-l9_41;
}
else
{
int l9_42=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_42=0;
}
else
{
l9_42=in.varStereoViewID;
}
int l9_43=l9_42;
l9_39=l9_43;
}
int l9_44=l9_39;
int l9_45=mainTextureLayout_tmp;
int l9_46=l9_44;
float2 l9_47=l9_37;
bool l9_48=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_49=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_50=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_51=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_52=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_53=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_54=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_55=0.0;
bool l9_56=l9_53&&(!l9_51);
float l9_57=1.0;
float l9_58=l9_47.x;
int l9_59=l9_50.x;
if (l9_59==1)
{
l9_58=fract(l9_58);
}
else
{
if (l9_59==2)
{
float l9_60=fract(l9_58);
float l9_61=l9_58-l9_60;
float l9_62=step(0.25,fract(l9_61*0.5));
l9_58=mix(l9_60,1.0-l9_60,fast::clamp(l9_62,0.0,1.0));
}
}
l9_47.x=l9_58;
float l9_63=l9_47.y;
int l9_64=l9_50.y;
if (l9_64==1)
{
l9_63=fract(l9_63);
}
else
{
if (l9_64==2)
{
float l9_65=fract(l9_63);
float l9_66=l9_63-l9_65;
float l9_67=step(0.25,fract(l9_66*0.5));
l9_63=mix(l9_65,1.0-l9_65,fast::clamp(l9_67,0.0,1.0));
}
}
l9_47.y=l9_63;
if (l9_51)
{
bool l9_68=l9_53;
bool l9_69;
if (l9_68)
{
l9_69=l9_50.x==3;
}
else
{
l9_69=l9_68;
}
float l9_70=l9_47.x;
float l9_71=l9_52.x;
float l9_72=l9_52.z;
bool l9_73=l9_69;
float l9_74=l9_57;
float l9_75=fast::clamp(l9_70,l9_71,l9_72);
float l9_76=step(abs(l9_70-l9_75),9.9999997e-06);
l9_74*=(l9_76+((1.0-float(l9_73))*(1.0-l9_76)));
l9_70=l9_75;
l9_47.x=l9_70;
l9_57=l9_74;
bool l9_77=l9_53;
bool l9_78;
if (l9_77)
{
l9_78=l9_50.y==3;
}
else
{
l9_78=l9_77;
}
float l9_79=l9_47.y;
float l9_80=l9_52.y;
float l9_81=l9_52.w;
bool l9_82=l9_78;
float l9_83=l9_57;
float l9_84=fast::clamp(l9_79,l9_80,l9_81);
float l9_85=step(abs(l9_79-l9_84),9.9999997e-06);
l9_83*=(l9_85+((1.0-float(l9_82))*(1.0-l9_85)));
l9_79=l9_84;
l9_47.y=l9_79;
l9_57=l9_83;
}
float2 l9_86=l9_47;
bool l9_87=l9_48;
float3x3 l9_88=l9_49;
if (l9_87)
{
l9_86=float2((l9_88*float3(l9_86,1.0)).xy);
}
float2 l9_89=l9_86;
l9_47=l9_89;
float l9_90=l9_47.x;
int l9_91=l9_50.x;
bool l9_92=l9_56;
float l9_93=l9_57;
if ((l9_91==0)||(l9_91==3))
{
float l9_94=l9_90;
float l9_95=0.0;
float l9_96=1.0;
bool l9_97=l9_92;
float l9_98=l9_93;
float l9_99=fast::clamp(l9_94,l9_95,l9_96);
float l9_100=step(abs(l9_94-l9_99),9.9999997e-06);
l9_98*=(l9_100+((1.0-float(l9_97))*(1.0-l9_100)));
l9_94=l9_99;
l9_90=l9_94;
l9_93=l9_98;
}
l9_47.x=l9_90;
l9_57=l9_93;
float l9_101=l9_47.y;
int l9_102=l9_50.y;
bool l9_103=l9_56;
float l9_104=l9_57;
if ((l9_102==0)||(l9_102==3))
{
float l9_105=l9_101;
float l9_106=0.0;
float l9_107=1.0;
bool l9_108=l9_103;
float l9_109=l9_104;
float l9_110=fast::clamp(l9_105,l9_106,l9_107);
float l9_111=step(abs(l9_105-l9_110),9.9999997e-06);
l9_109*=(l9_111+((1.0-float(l9_108))*(1.0-l9_111)));
l9_105=l9_110;
l9_101=l9_105;
l9_104=l9_109;
}
l9_47.y=l9_101;
l9_57=l9_104;
float2 l9_112=l9_47;
int l9_113=l9_45;
int l9_114=l9_46;
float l9_115=l9_55;
float2 l9_116=l9_112;
int l9_117=l9_113;
int l9_118=l9_114;
float3 l9_119=float3(0.0);
if (l9_117==0)
{
l9_119=float3(l9_116,0.0);
}
else
{
if (l9_117==1)
{
l9_119=float3(l9_116.x,(l9_116.y*0.5)+(0.5-(float(l9_118)*0.5)),0.0);
}
else
{
l9_119=float3(l9_116,float(l9_118));
}
}
float3 l9_120=l9_119;
float3 l9_121=l9_120;
float4 l9_122=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_121.xy,bias(l9_115));
float4 l9_123=l9_122;
if (l9_53)
{
l9_123=mix(l9_54,l9_123,float4(l9_57));
}
float4 l9_124=l9_123;
l9_38=l9_124;
float4 l9_125=l9_38;
float4 l9_126=l9_125;
float2 l9_127=l9_17;
float4 l9_128=float4(0.0);
int l9_129;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=in.varStereoViewID;
}
int l9_131=l9_130;
l9_129=1-l9_131;
}
else
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=in.varStereoViewID;
}
int l9_133=l9_132;
l9_129=l9_133;
}
int l9_134=l9_129;
int l9_135=mainTextureLayout_tmp;
int l9_136=l9_134;
float2 l9_137=l9_127;
bool l9_138=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_139=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_140=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_141=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_142=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_143=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_144=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_145=0.0;
bool l9_146=l9_143&&(!l9_141);
float l9_147=1.0;
float l9_148=l9_137.x;
int l9_149=l9_140.x;
if (l9_149==1)
{
l9_148=fract(l9_148);
}
else
{
if (l9_149==2)
{
float l9_150=fract(l9_148);
float l9_151=l9_148-l9_150;
float l9_152=step(0.25,fract(l9_151*0.5));
l9_148=mix(l9_150,1.0-l9_150,fast::clamp(l9_152,0.0,1.0));
}
}
l9_137.x=l9_148;
float l9_153=l9_137.y;
int l9_154=l9_140.y;
if (l9_154==1)
{
l9_153=fract(l9_153);
}
else
{
if (l9_154==2)
{
float l9_155=fract(l9_153);
float l9_156=l9_153-l9_155;
float l9_157=step(0.25,fract(l9_156*0.5));
l9_153=mix(l9_155,1.0-l9_155,fast::clamp(l9_157,0.0,1.0));
}
}
l9_137.y=l9_153;
if (l9_141)
{
bool l9_158=l9_143;
bool l9_159;
if (l9_158)
{
l9_159=l9_140.x==3;
}
else
{
l9_159=l9_158;
}
float l9_160=l9_137.x;
float l9_161=l9_142.x;
float l9_162=l9_142.z;
bool l9_163=l9_159;
float l9_164=l9_147;
float l9_165=fast::clamp(l9_160,l9_161,l9_162);
float l9_166=step(abs(l9_160-l9_165),9.9999997e-06);
l9_164*=(l9_166+((1.0-float(l9_163))*(1.0-l9_166)));
l9_160=l9_165;
l9_137.x=l9_160;
l9_147=l9_164;
bool l9_167=l9_143;
bool l9_168;
if (l9_167)
{
l9_168=l9_140.y==3;
}
else
{
l9_168=l9_167;
}
float l9_169=l9_137.y;
float l9_170=l9_142.y;
float l9_171=l9_142.w;
bool l9_172=l9_168;
float l9_173=l9_147;
float l9_174=fast::clamp(l9_169,l9_170,l9_171);
float l9_175=step(abs(l9_169-l9_174),9.9999997e-06);
l9_173*=(l9_175+((1.0-float(l9_172))*(1.0-l9_175)));
l9_169=l9_174;
l9_137.y=l9_169;
l9_147=l9_173;
}
float2 l9_176=l9_137;
bool l9_177=l9_138;
float3x3 l9_178=l9_139;
if (l9_177)
{
l9_176=float2((l9_178*float3(l9_176,1.0)).xy);
}
float2 l9_179=l9_176;
l9_137=l9_179;
float l9_180=l9_137.x;
int l9_181=l9_140.x;
bool l9_182=l9_146;
float l9_183=l9_147;
if ((l9_181==0)||(l9_181==3))
{
float l9_184=l9_180;
float l9_185=0.0;
float l9_186=1.0;
bool l9_187=l9_182;
float l9_188=l9_183;
float l9_189=fast::clamp(l9_184,l9_185,l9_186);
float l9_190=step(abs(l9_184-l9_189),9.9999997e-06);
l9_188*=(l9_190+((1.0-float(l9_187))*(1.0-l9_190)));
l9_184=l9_189;
l9_180=l9_184;
l9_183=l9_188;
}
l9_137.x=l9_180;
l9_147=l9_183;
float l9_191=l9_137.y;
int l9_192=l9_140.y;
bool l9_193=l9_146;
float l9_194=l9_147;
if ((l9_192==0)||(l9_192==3))
{
float l9_195=l9_191;
float l9_196=0.0;
float l9_197=1.0;
bool l9_198=l9_193;
float l9_199=l9_194;
float l9_200=fast::clamp(l9_195,l9_196,l9_197);
float l9_201=step(abs(l9_195-l9_200),9.9999997e-06);
l9_199*=(l9_201+((1.0-float(l9_198))*(1.0-l9_201)));
l9_195=l9_200;
l9_191=l9_195;
l9_194=l9_199;
}
l9_137.y=l9_191;
l9_147=l9_194;
float2 l9_202=l9_137;
int l9_203=l9_135;
int l9_204=l9_136;
float l9_205=l9_145;
float2 l9_206=l9_202;
int l9_207=l9_203;
int l9_208=l9_204;
float3 l9_209=float3(0.0);
if (l9_207==0)
{
l9_209=float3(l9_206,0.0);
}
else
{
if (l9_207==1)
{
l9_209=float3(l9_206.x,(l9_206.y*0.5)+(0.5-(float(l9_208)*0.5)),0.0);
}
else
{
l9_209=float3(l9_206,float(l9_208));
}
}
float3 l9_210=l9_209;
float3 l9_211=l9_210;
float4 l9_212=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_211.xy,bias(l9_205));
float4 l9_213=l9_212;
if (l9_143)
{
l9_213=mix(l9_144,l9_213,float4(l9_147));
}
float4 l9_214=l9_213;
l9_128=l9_214;
float4 l9_215=l9_128;
N76_flipbookTex=mix(l9_126,l9_215,float4(l9_36));
}
else
{
float2 l9_216=l9_15;
float4 l9_217=float4(0.0);
int l9_218;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_219=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_219=0;
}
else
{
l9_219=in.varStereoViewID;
}
int l9_220=l9_219;
l9_218=1-l9_220;
}
else
{
int l9_221=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_221=0;
}
else
{
l9_221=in.varStereoViewID;
}
int l9_222=l9_221;
l9_218=l9_222;
}
int l9_223=l9_218;
int l9_224=mainTextureLayout_tmp;
int l9_225=l9_223;
float2 l9_226=l9_216;
bool l9_227=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_228=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_229=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_230=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_231=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_232=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_233=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_234=0.0;
bool l9_235=l9_232&&(!l9_230);
float l9_236=1.0;
float l9_237=l9_226.x;
int l9_238=l9_229.x;
if (l9_238==1)
{
l9_237=fract(l9_237);
}
else
{
if (l9_238==2)
{
float l9_239=fract(l9_237);
float l9_240=l9_237-l9_239;
float l9_241=step(0.25,fract(l9_240*0.5));
l9_237=mix(l9_239,1.0-l9_239,fast::clamp(l9_241,0.0,1.0));
}
}
l9_226.x=l9_237;
float l9_242=l9_226.y;
int l9_243=l9_229.y;
if (l9_243==1)
{
l9_242=fract(l9_242);
}
else
{
if (l9_243==2)
{
float l9_244=fract(l9_242);
float l9_245=l9_242-l9_244;
float l9_246=step(0.25,fract(l9_245*0.5));
l9_242=mix(l9_244,1.0-l9_244,fast::clamp(l9_246,0.0,1.0));
}
}
l9_226.y=l9_242;
if (l9_230)
{
bool l9_247=l9_232;
bool l9_248;
if (l9_247)
{
l9_248=l9_229.x==3;
}
else
{
l9_248=l9_247;
}
float l9_249=l9_226.x;
float l9_250=l9_231.x;
float l9_251=l9_231.z;
bool l9_252=l9_248;
float l9_253=l9_236;
float l9_254=fast::clamp(l9_249,l9_250,l9_251);
float l9_255=step(abs(l9_249-l9_254),9.9999997e-06);
l9_253*=(l9_255+((1.0-float(l9_252))*(1.0-l9_255)));
l9_249=l9_254;
l9_226.x=l9_249;
l9_236=l9_253;
bool l9_256=l9_232;
bool l9_257;
if (l9_256)
{
l9_257=l9_229.y==3;
}
else
{
l9_257=l9_256;
}
float l9_258=l9_226.y;
float l9_259=l9_231.y;
float l9_260=l9_231.w;
bool l9_261=l9_257;
float l9_262=l9_236;
float l9_263=fast::clamp(l9_258,l9_259,l9_260);
float l9_264=step(abs(l9_258-l9_263),9.9999997e-06);
l9_262*=(l9_264+((1.0-float(l9_261))*(1.0-l9_264)));
l9_258=l9_263;
l9_226.y=l9_258;
l9_236=l9_262;
}
float2 l9_265=l9_226;
bool l9_266=l9_227;
float3x3 l9_267=l9_228;
if (l9_266)
{
l9_265=float2((l9_267*float3(l9_265,1.0)).xy);
}
float2 l9_268=l9_265;
l9_226=l9_268;
float l9_269=l9_226.x;
int l9_270=l9_229.x;
bool l9_271=l9_235;
float l9_272=l9_236;
if ((l9_270==0)||(l9_270==3))
{
float l9_273=l9_269;
float l9_274=0.0;
float l9_275=1.0;
bool l9_276=l9_271;
float l9_277=l9_272;
float l9_278=fast::clamp(l9_273,l9_274,l9_275);
float l9_279=step(abs(l9_273-l9_278),9.9999997e-06);
l9_277*=(l9_279+((1.0-float(l9_276))*(1.0-l9_279)));
l9_273=l9_278;
l9_269=l9_273;
l9_272=l9_277;
}
l9_226.x=l9_269;
l9_236=l9_272;
float l9_280=l9_226.y;
int l9_281=l9_229.y;
bool l9_282=l9_235;
float l9_283=l9_236;
if ((l9_281==0)||(l9_281==3))
{
float l9_284=l9_280;
float l9_285=0.0;
float l9_286=1.0;
bool l9_287=l9_282;
float l9_288=l9_283;
float l9_289=fast::clamp(l9_284,l9_285,l9_286);
float l9_290=step(abs(l9_284-l9_289),9.9999997e-06);
l9_288*=(l9_290+((1.0-float(l9_287))*(1.0-l9_290)));
l9_284=l9_289;
l9_280=l9_284;
l9_283=l9_288;
}
l9_226.y=l9_280;
l9_236=l9_283;
float2 l9_291=l9_226;
int l9_292=l9_224;
int l9_293=l9_225;
float l9_294=l9_234;
float2 l9_295=l9_291;
int l9_296=l9_292;
int l9_297=l9_293;
float3 l9_298=float3(0.0);
if (l9_296==0)
{
l9_298=float3(l9_295,0.0);
}
else
{
if (l9_296==1)
{
l9_298=float3(l9_295.x,(l9_295.y*0.5)+(0.5-(float(l9_297)*0.5)),0.0);
}
else
{
l9_298=float3(l9_295,float(l9_297));
}
}
float3 l9_299=l9_298;
float3 l9_300=l9_299;
float4 l9_301=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_300.xy,bias(l9_294));
float4 l9_302=l9_301;
if (l9_232)
{
l9_302=mix(l9_233,l9_302,float4(l9_236));
}
float4 l9_303=l9_302;
l9_217=l9_303;
float4 l9_304=l9_217;
N76_flipbookTex=l9_304;
}
if (!(SC_DEVICE_CLASS_tmp>=2))
{
float2 l9_305=tempGlobals.Surface_UVCoord0;
float2 l9_306=l9_305;
float4 l9_307=float4(0.0);
int l9_308;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_309=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_309=0;
}
else
{
l9_309=in.varStereoViewID;
}
int l9_310=l9_309;
l9_308=1-l9_310;
}
else
{
int l9_311=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_311=0;
}
else
{
l9_311=in.varStereoViewID;
}
int l9_312=l9_311;
l9_308=l9_312;
}
int l9_313=l9_308;
int l9_314=mainTextureLayout_tmp;
int l9_315=l9_313;
float2 l9_316=l9_306;
bool l9_317=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_318=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_319=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_320=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_321=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_322=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_323=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_324=0.0;
bool l9_325=l9_322&&(!l9_320);
float l9_326=1.0;
float l9_327=l9_316.x;
int l9_328=l9_319.x;
if (l9_328==1)
{
l9_327=fract(l9_327);
}
else
{
if (l9_328==2)
{
float l9_329=fract(l9_327);
float l9_330=l9_327-l9_329;
float l9_331=step(0.25,fract(l9_330*0.5));
l9_327=mix(l9_329,1.0-l9_329,fast::clamp(l9_331,0.0,1.0));
}
}
l9_316.x=l9_327;
float l9_332=l9_316.y;
int l9_333=l9_319.y;
if (l9_333==1)
{
l9_332=fract(l9_332);
}
else
{
if (l9_333==2)
{
float l9_334=fract(l9_332);
float l9_335=l9_332-l9_334;
float l9_336=step(0.25,fract(l9_335*0.5));
l9_332=mix(l9_334,1.0-l9_334,fast::clamp(l9_336,0.0,1.0));
}
}
l9_316.y=l9_332;
if (l9_320)
{
bool l9_337=l9_322;
bool l9_338;
if (l9_337)
{
l9_338=l9_319.x==3;
}
else
{
l9_338=l9_337;
}
float l9_339=l9_316.x;
float l9_340=l9_321.x;
float l9_341=l9_321.z;
bool l9_342=l9_338;
float l9_343=l9_326;
float l9_344=fast::clamp(l9_339,l9_340,l9_341);
float l9_345=step(abs(l9_339-l9_344),9.9999997e-06);
l9_343*=(l9_345+((1.0-float(l9_342))*(1.0-l9_345)));
l9_339=l9_344;
l9_316.x=l9_339;
l9_326=l9_343;
bool l9_346=l9_322;
bool l9_347;
if (l9_346)
{
l9_347=l9_319.y==3;
}
else
{
l9_347=l9_346;
}
float l9_348=l9_316.y;
float l9_349=l9_321.y;
float l9_350=l9_321.w;
bool l9_351=l9_347;
float l9_352=l9_326;
float l9_353=fast::clamp(l9_348,l9_349,l9_350);
float l9_354=step(abs(l9_348-l9_353),9.9999997e-06);
l9_352*=(l9_354+((1.0-float(l9_351))*(1.0-l9_354)));
l9_348=l9_353;
l9_316.y=l9_348;
l9_326=l9_352;
}
float2 l9_355=l9_316;
bool l9_356=l9_317;
float3x3 l9_357=l9_318;
if (l9_356)
{
l9_355=float2((l9_357*float3(l9_355,1.0)).xy);
}
float2 l9_358=l9_355;
l9_316=l9_358;
float l9_359=l9_316.x;
int l9_360=l9_319.x;
bool l9_361=l9_325;
float l9_362=l9_326;
if ((l9_360==0)||(l9_360==3))
{
float l9_363=l9_359;
float l9_364=0.0;
float l9_365=1.0;
bool l9_366=l9_361;
float l9_367=l9_362;
float l9_368=fast::clamp(l9_363,l9_364,l9_365);
float l9_369=step(abs(l9_363-l9_368),9.9999997e-06);
l9_367*=(l9_369+((1.0-float(l9_366))*(1.0-l9_369)));
l9_363=l9_368;
l9_359=l9_363;
l9_362=l9_367;
}
l9_316.x=l9_359;
l9_326=l9_362;
float l9_370=l9_316.y;
int l9_371=l9_319.y;
bool l9_372=l9_325;
float l9_373=l9_326;
if ((l9_371==0)||(l9_371==3))
{
float l9_374=l9_370;
float l9_375=0.0;
float l9_376=1.0;
bool l9_377=l9_372;
float l9_378=l9_373;
float l9_379=fast::clamp(l9_374,l9_375,l9_376);
float l9_380=step(abs(l9_374-l9_379),9.9999997e-06);
l9_378*=(l9_380+((1.0-float(l9_377))*(1.0-l9_380)));
l9_374=l9_379;
l9_370=l9_374;
l9_373=l9_378;
}
l9_316.y=l9_370;
l9_326=l9_373;
float2 l9_381=l9_316;
int l9_382=l9_314;
int l9_383=l9_315;
float l9_384=l9_324;
float2 l9_385=l9_381;
int l9_386=l9_382;
int l9_387=l9_383;
float3 l9_388=float3(0.0);
if (l9_386==0)
{
l9_388=float3(l9_385,0.0);
}
else
{
if (l9_386==1)
{
l9_388=float3(l9_385.x,(l9_385.y*0.5)+(0.5-(float(l9_387)*0.5)),0.0);
}
else
{
l9_388=float3(l9_385,float(l9_387));
}
}
float3 l9_389=l9_388;
float3 l9_390=l9_389;
float4 l9_391=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_390.xy,bias(l9_384));
float4 l9_392=l9_391;
if (l9_322)
{
l9_392=mix(l9_323,l9_392,float4(l9_326));
}
float4 l9_393=l9_392;
l9_307=l9_393;
float4 l9_394=l9_307;
float4 l9_395=l9_394;
float4 l9_396=l9_395;
N76_vectorTex=l9_396;
}
else
{
float l9_397=N76_flowStrength;
float l9_398=N76_flowSpeed;
float2 l9_399=tempGlobals.Surface_UVCoord0;
float2 l9_400=l9_399;
float4 l9_401=float4(0.0);
int l9_402;
if ((int(vectorTextureHasSwappedViews_tmp)!=0))
{
int l9_403=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_403=0;
}
else
{
l9_403=in.varStereoViewID;
}
int l9_404=l9_403;
l9_402=1-l9_404;
}
else
{
int l9_405=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_405=0;
}
else
{
l9_405=in.varStereoViewID;
}
int l9_406=l9_405;
l9_402=l9_406;
}
int l9_407=l9_402;
int l9_408=vectorTextureLayout_tmp;
int l9_409=l9_407;
float2 l9_410=l9_400;
bool l9_411=(int(SC_USE_UV_TRANSFORM_vectorTexture_tmp)!=0);
float3x3 l9_412=(*sc_set0.UserUniforms).vectorTextureTransform;
int2 l9_413=int2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_vectorTexture_tmp);
bool l9_414=(int(SC_USE_UV_MIN_MAX_vectorTexture_tmp)!=0);
float4 l9_415=(*sc_set0.UserUniforms).vectorTextureUvMinMax;
bool l9_416=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture_tmp)!=0);
float4 l9_417=(*sc_set0.UserUniforms).vectorTextureBorderColor;
float l9_418=0.0;
bool l9_419=l9_416&&(!l9_414);
float l9_420=1.0;
float l9_421=l9_410.x;
int l9_422=l9_413.x;
if (l9_422==1)
{
l9_421=fract(l9_421);
}
else
{
if (l9_422==2)
{
float l9_423=fract(l9_421);
float l9_424=l9_421-l9_423;
float l9_425=step(0.25,fract(l9_424*0.5));
l9_421=mix(l9_423,1.0-l9_423,fast::clamp(l9_425,0.0,1.0));
}
}
l9_410.x=l9_421;
float l9_426=l9_410.y;
int l9_427=l9_413.y;
if (l9_427==1)
{
l9_426=fract(l9_426);
}
else
{
if (l9_427==2)
{
float l9_428=fract(l9_426);
float l9_429=l9_426-l9_428;
float l9_430=step(0.25,fract(l9_429*0.5));
l9_426=mix(l9_428,1.0-l9_428,fast::clamp(l9_430,0.0,1.0));
}
}
l9_410.y=l9_426;
if (l9_414)
{
bool l9_431=l9_416;
bool l9_432;
if (l9_431)
{
l9_432=l9_413.x==3;
}
else
{
l9_432=l9_431;
}
float l9_433=l9_410.x;
float l9_434=l9_415.x;
float l9_435=l9_415.z;
bool l9_436=l9_432;
float l9_437=l9_420;
float l9_438=fast::clamp(l9_433,l9_434,l9_435);
float l9_439=step(abs(l9_433-l9_438),9.9999997e-06);
l9_437*=(l9_439+((1.0-float(l9_436))*(1.0-l9_439)));
l9_433=l9_438;
l9_410.x=l9_433;
l9_420=l9_437;
bool l9_440=l9_416;
bool l9_441;
if (l9_440)
{
l9_441=l9_413.y==3;
}
else
{
l9_441=l9_440;
}
float l9_442=l9_410.y;
float l9_443=l9_415.y;
float l9_444=l9_415.w;
bool l9_445=l9_441;
float l9_446=l9_420;
float l9_447=fast::clamp(l9_442,l9_443,l9_444);
float l9_448=step(abs(l9_442-l9_447),9.9999997e-06);
l9_446*=(l9_448+((1.0-float(l9_445))*(1.0-l9_448)));
l9_442=l9_447;
l9_410.y=l9_442;
l9_420=l9_446;
}
float2 l9_449=l9_410;
bool l9_450=l9_411;
float3x3 l9_451=l9_412;
if (l9_450)
{
l9_449=float2((l9_451*float3(l9_449,1.0)).xy);
}
float2 l9_452=l9_449;
l9_410=l9_452;
float l9_453=l9_410.x;
int l9_454=l9_413.x;
bool l9_455=l9_419;
float l9_456=l9_420;
if ((l9_454==0)||(l9_454==3))
{
float l9_457=l9_453;
float l9_458=0.0;
float l9_459=1.0;
bool l9_460=l9_455;
float l9_461=l9_456;
float l9_462=fast::clamp(l9_457,l9_458,l9_459);
float l9_463=step(abs(l9_457-l9_462),9.9999997e-06);
l9_461*=(l9_463+((1.0-float(l9_460))*(1.0-l9_463)));
l9_457=l9_462;
l9_453=l9_457;
l9_456=l9_461;
}
l9_410.x=l9_453;
l9_420=l9_456;
float l9_464=l9_410.y;
int l9_465=l9_413.y;
bool l9_466=l9_419;
float l9_467=l9_420;
if ((l9_465==0)||(l9_465==3))
{
float l9_468=l9_464;
float l9_469=0.0;
float l9_470=1.0;
bool l9_471=l9_466;
float l9_472=l9_467;
float l9_473=fast::clamp(l9_468,l9_469,l9_470);
float l9_474=step(abs(l9_468-l9_473),9.9999997e-06);
l9_472*=(l9_474+((1.0-float(l9_471))*(1.0-l9_474)));
l9_468=l9_473;
l9_464=l9_468;
l9_467=l9_472;
}
l9_410.y=l9_464;
l9_420=l9_467;
float2 l9_475=l9_410;
int l9_476=l9_408;
int l9_477=l9_409;
float l9_478=l9_418;
float2 l9_479=l9_475;
int l9_480=l9_476;
int l9_481=l9_477;
float3 l9_482=float3(0.0);
if (l9_480==0)
{
l9_482=float3(l9_479,0.0);
}
else
{
if (l9_480==1)
{
l9_482=float3(l9_479.x,(l9_479.y*0.5)+(0.5-(float(l9_481)*0.5)),0.0);
}
else
{
l9_482=float3(l9_479,float(l9_481));
}
}
float3 l9_483=l9_482;
float3 l9_484=l9_483;
float4 l9_485=sc_set0.vectorTexture.sample(sc_set0.vectorTextureSmpSC,l9_484.xy,bias(l9_478));
float4 l9_486=l9_485;
if (l9_416)
{
l9_486=mix(l9_417,l9_486,float4(l9_420));
}
float4 l9_487=l9_486;
l9_401=l9_487;
float4 l9_488=l9_401;
float4 l9_489=l9_488;
l9_489=(l9_489-float4(0.5))*2.0;
float l9_490=tempGlobals.gTimeElapsed;
float l9_491=l9_490*l9_398;
float l9_492=fract(l9_491+0.5);
float l9_493=fract(l9_491+1.0);
float2 l9_494=(l9_489.xy*l9_492)*l9_397;
float2 l9_495=(l9_489.xy*l9_493)*l9_397;
float2 l9_496=tempGlobals.Surface_UVCoord0;
float2 l9_497=l9_496+l9_494;
float4 l9_498=float4(0.0);
int l9_499;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_500=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_500=0;
}
else
{
l9_500=in.varStereoViewID;
}
int l9_501=l9_500;
l9_499=1-l9_501;
}
else
{
int l9_502=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_502=0;
}
else
{
l9_502=in.varStereoViewID;
}
int l9_503=l9_502;
l9_499=l9_503;
}
int l9_504=l9_499;
int l9_505=mainTextureLayout_tmp;
int l9_506=l9_504;
float2 l9_507=l9_497;
bool l9_508=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_509=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_510=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_511=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_512=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_513=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_514=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_515=0.0;
bool l9_516=l9_513&&(!l9_511);
float l9_517=1.0;
float l9_518=l9_507.x;
int l9_519=l9_510.x;
if (l9_519==1)
{
l9_518=fract(l9_518);
}
else
{
if (l9_519==2)
{
float l9_520=fract(l9_518);
float l9_521=l9_518-l9_520;
float l9_522=step(0.25,fract(l9_521*0.5));
l9_518=mix(l9_520,1.0-l9_520,fast::clamp(l9_522,0.0,1.0));
}
}
l9_507.x=l9_518;
float l9_523=l9_507.y;
int l9_524=l9_510.y;
if (l9_524==1)
{
l9_523=fract(l9_523);
}
else
{
if (l9_524==2)
{
float l9_525=fract(l9_523);
float l9_526=l9_523-l9_525;
float l9_527=step(0.25,fract(l9_526*0.5));
l9_523=mix(l9_525,1.0-l9_525,fast::clamp(l9_527,0.0,1.0));
}
}
l9_507.y=l9_523;
if (l9_511)
{
bool l9_528=l9_513;
bool l9_529;
if (l9_528)
{
l9_529=l9_510.x==3;
}
else
{
l9_529=l9_528;
}
float l9_530=l9_507.x;
float l9_531=l9_512.x;
float l9_532=l9_512.z;
bool l9_533=l9_529;
float l9_534=l9_517;
float l9_535=fast::clamp(l9_530,l9_531,l9_532);
float l9_536=step(abs(l9_530-l9_535),9.9999997e-06);
l9_534*=(l9_536+((1.0-float(l9_533))*(1.0-l9_536)));
l9_530=l9_535;
l9_507.x=l9_530;
l9_517=l9_534;
bool l9_537=l9_513;
bool l9_538;
if (l9_537)
{
l9_538=l9_510.y==3;
}
else
{
l9_538=l9_537;
}
float l9_539=l9_507.y;
float l9_540=l9_512.y;
float l9_541=l9_512.w;
bool l9_542=l9_538;
float l9_543=l9_517;
float l9_544=fast::clamp(l9_539,l9_540,l9_541);
float l9_545=step(abs(l9_539-l9_544),9.9999997e-06);
l9_543*=(l9_545+((1.0-float(l9_542))*(1.0-l9_545)));
l9_539=l9_544;
l9_507.y=l9_539;
l9_517=l9_543;
}
float2 l9_546=l9_507;
bool l9_547=l9_508;
float3x3 l9_548=l9_509;
if (l9_547)
{
l9_546=float2((l9_548*float3(l9_546,1.0)).xy);
}
float2 l9_549=l9_546;
l9_507=l9_549;
float l9_550=l9_507.x;
int l9_551=l9_510.x;
bool l9_552=l9_516;
float l9_553=l9_517;
if ((l9_551==0)||(l9_551==3))
{
float l9_554=l9_550;
float l9_555=0.0;
float l9_556=1.0;
bool l9_557=l9_552;
float l9_558=l9_553;
float l9_559=fast::clamp(l9_554,l9_555,l9_556);
float l9_560=step(abs(l9_554-l9_559),9.9999997e-06);
l9_558*=(l9_560+((1.0-float(l9_557))*(1.0-l9_560)));
l9_554=l9_559;
l9_550=l9_554;
l9_553=l9_558;
}
l9_507.x=l9_550;
l9_517=l9_553;
float l9_561=l9_507.y;
int l9_562=l9_510.y;
bool l9_563=l9_516;
float l9_564=l9_517;
if ((l9_562==0)||(l9_562==3))
{
float l9_565=l9_561;
float l9_566=0.0;
float l9_567=1.0;
bool l9_568=l9_563;
float l9_569=l9_564;
float l9_570=fast::clamp(l9_565,l9_566,l9_567);
float l9_571=step(abs(l9_565-l9_570),9.9999997e-06);
l9_569*=(l9_571+((1.0-float(l9_568))*(1.0-l9_571)));
l9_565=l9_570;
l9_561=l9_565;
l9_564=l9_569;
}
l9_507.y=l9_561;
l9_517=l9_564;
float2 l9_572=l9_507;
int l9_573=l9_505;
int l9_574=l9_506;
float l9_575=l9_515;
float2 l9_576=l9_572;
int l9_577=l9_573;
int l9_578=l9_574;
float3 l9_579=float3(0.0);
if (l9_577==0)
{
l9_579=float3(l9_576,0.0);
}
else
{
if (l9_577==1)
{
l9_579=float3(l9_576.x,(l9_576.y*0.5)+(0.5-(float(l9_578)*0.5)),0.0);
}
else
{
l9_579=float3(l9_576,float(l9_578));
}
}
float3 l9_580=l9_579;
float3 l9_581=l9_580;
float4 l9_582=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_581.xy,bias(l9_575));
float4 l9_583=l9_582;
if (l9_513)
{
l9_583=mix(l9_514,l9_583,float4(l9_517));
}
float4 l9_584=l9_583;
l9_498=l9_584;
float4 l9_585=l9_498;
float4 l9_586=l9_585;
float2 l9_587=tempGlobals.Surface_UVCoord0;
float2 l9_588=l9_587+l9_495;
float4 l9_589=float4(0.0);
int l9_590;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_591=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_591=0;
}
else
{
l9_591=in.varStereoViewID;
}
int l9_592=l9_591;
l9_590=1-l9_592;
}
else
{
int l9_593=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_593=0;
}
else
{
l9_593=in.varStereoViewID;
}
int l9_594=l9_593;
l9_590=l9_594;
}
int l9_595=l9_590;
int l9_596=mainTextureLayout_tmp;
int l9_597=l9_595;
float2 l9_598=l9_588;
bool l9_599=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_600=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_601=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_602=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_603=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_604=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_605=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_606=0.0;
bool l9_607=l9_604&&(!l9_602);
float l9_608=1.0;
float l9_609=l9_598.x;
int l9_610=l9_601.x;
if (l9_610==1)
{
l9_609=fract(l9_609);
}
else
{
if (l9_610==2)
{
float l9_611=fract(l9_609);
float l9_612=l9_609-l9_611;
float l9_613=step(0.25,fract(l9_612*0.5));
l9_609=mix(l9_611,1.0-l9_611,fast::clamp(l9_613,0.0,1.0));
}
}
l9_598.x=l9_609;
float l9_614=l9_598.y;
int l9_615=l9_601.y;
if (l9_615==1)
{
l9_614=fract(l9_614);
}
else
{
if (l9_615==2)
{
float l9_616=fract(l9_614);
float l9_617=l9_614-l9_616;
float l9_618=step(0.25,fract(l9_617*0.5));
l9_614=mix(l9_616,1.0-l9_616,fast::clamp(l9_618,0.0,1.0));
}
}
l9_598.y=l9_614;
if (l9_602)
{
bool l9_619=l9_604;
bool l9_620;
if (l9_619)
{
l9_620=l9_601.x==3;
}
else
{
l9_620=l9_619;
}
float l9_621=l9_598.x;
float l9_622=l9_603.x;
float l9_623=l9_603.z;
bool l9_624=l9_620;
float l9_625=l9_608;
float l9_626=fast::clamp(l9_621,l9_622,l9_623);
float l9_627=step(abs(l9_621-l9_626),9.9999997e-06);
l9_625*=(l9_627+((1.0-float(l9_624))*(1.0-l9_627)));
l9_621=l9_626;
l9_598.x=l9_621;
l9_608=l9_625;
bool l9_628=l9_604;
bool l9_629;
if (l9_628)
{
l9_629=l9_601.y==3;
}
else
{
l9_629=l9_628;
}
float l9_630=l9_598.y;
float l9_631=l9_603.y;
float l9_632=l9_603.w;
bool l9_633=l9_629;
float l9_634=l9_608;
float l9_635=fast::clamp(l9_630,l9_631,l9_632);
float l9_636=step(abs(l9_630-l9_635),9.9999997e-06);
l9_634*=(l9_636+((1.0-float(l9_633))*(1.0-l9_636)));
l9_630=l9_635;
l9_598.y=l9_630;
l9_608=l9_634;
}
float2 l9_637=l9_598;
bool l9_638=l9_599;
float3x3 l9_639=l9_600;
if (l9_638)
{
l9_637=float2((l9_639*float3(l9_637,1.0)).xy);
}
float2 l9_640=l9_637;
l9_598=l9_640;
float l9_641=l9_598.x;
int l9_642=l9_601.x;
bool l9_643=l9_607;
float l9_644=l9_608;
if ((l9_642==0)||(l9_642==3))
{
float l9_645=l9_641;
float l9_646=0.0;
float l9_647=1.0;
bool l9_648=l9_643;
float l9_649=l9_644;
float l9_650=fast::clamp(l9_645,l9_646,l9_647);
float l9_651=step(abs(l9_645-l9_650),9.9999997e-06);
l9_649*=(l9_651+((1.0-float(l9_648))*(1.0-l9_651)));
l9_645=l9_650;
l9_641=l9_645;
l9_644=l9_649;
}
l9_598.x=l9_641;
l9_608=l9_644;
float l9_652=l9_598.y;
int l9_653=l9_601.y;
bool l9_654=l9_607;
float l9_655=l9_608;
if ((l9_653==0)||(l9_653==3))
{
float l9_656=l9_652;
float l9_657=0.0;
float l9_658=1.0;
bool l9_659=l9_654;
float l9_660=l9_655;
float l9_661=fast::clamp(l9_656,l9_657,l9_658);
float l9_662=step(abs(l9_656-l9_661),9.9999997e-06);
l9_660*=(l9_662+((1.0-float(l9_659))*(1.0-l9_662)));
l9_656=l9_661;
l9_652=l9_656;
l9_655=l9_660;
}
l9_598.y=l9_652;
l9_608=l9_655;
float2 l9_663=l9_598;
int l9_664=l9_596;
int l9_665=l9_597;
float l9_666=l9_606;
float2 l9_667=l9_663;
int l9_668=l9_664;
int l9_669=l9_665;
float3 l9_670=float3(0.0);
if (l9_668==0)
{
l9_670=float3(l9_667,0.0);
}
else
{
if (l9_668==1)
{
l9_670=float3(l9_667.x,(l9_667.y*0.5)+(0.5-(float(l9_669)*0.5)),0.0);
}
else
{
l9_670=float3(l9_667,float(l9_669));
}
}
float3 l9_671=l9_670;
float3 l9_672=l9_671;
float4 l9_673=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_672.xy,bias(l9_666));
float4 l9_674=l9_673;
if (l9_604)
{
l9_674=mix(l9_605,l9_674,float4(l9_608));
}
float4 l9_675=l9_674;
l9_589=l9_675;
float4 l9_676=l9_589;
float4 l9_677=l9_676;
float l9_678=abs((0.5-l9_492)/0.5);
float4 l9_679=mix(l9_586,l9_677,float4(l9_678));
float4 l9_680=l9_679;
N76_vectorTex=l9_680;
}
param_44=N76_flipbookTex;
param_45=N76_vectorTex;
flipbookTex_N76=param_44;
vectorTex_N76=param_45;
float Output_N114=0.0;
float param_47;
if ((int(VECTORFIELD_tmp)!=0))
{
param_47=1.001;
}
else
{
param_47=0.001;
}
param_47-=0.001;
Output_N114=param_47;
float3 Output_N82=float3(0.0);
float3 param_48=(*sc_set0.UserUniforms).colorStart;
Output_N82=param_48;
float3 Output_N83=float3(0.0);
float3 param_49=(*sc_set0.UserUniforms).colorEnd;
Output_N83=param_49;
float Output_N77=0.0;
float param_50;
if ((int(COLORMINMAX_tmp)!=0))
{
param_50=1.001;
}
else
{
param_50=0.001;
}
param_50-=0.001;
Output_N77=param_50;
float3 Output_N78=float3(0.0);
float3 param_51=(*sc_set0.UserUniforms).colorMinStart;
Output_N78=param_51;
float3 Output_N80=float3(0.0);
float3 param_52=(*sc_set0.UserUniforms).colorMinEnd;
Output_N80=param_52;
float3 Output_N79=float3(0.0);
float3 param_53=(*sc_set0.UserUniforms).colorMaxStart;
Output_N79=param_53;
float3 Output_N81=float3(0.0);
float3 param_54=(*sc_set0.UserUniforms).colorMaxEnd;
Output_N81=param_54;
float Output_N106=0.0;
float param_55;
if ((int(COLORMONOMIN_tmp)!=0))
{
param_55=1.001;
}
else
{
param_55=0.001;
}
param_55-=0.001;
Output_N106=param_55;
float Output_N89=0.0;
float param_56=(*sc_set0.UserUniforms).alphaStart;
Output_N89=param_56;
float Output_N90=0.0;
float param_57=(*sc_set0.UserUniforms).alphaEnd;
Output_N90=param_57;
float Output_N84=0.0;
float param_58;
if ((int(ALPHAMINMAX_tmp)!=0))
{
param_58=1.001;
}
else
{
param_58=0.001;
}
param_58-=0.001;
Output_N84=param_58;
float Output_N85=0.0;
float param_59=(*sc_set0.UserUniforms).alphaMinStart;
Output_N85=param_59;
float Output_N86=0.0;
float param_60=(*sc_set0.UserUniforms).alphaMinEnd;
Output_N86=param_60;
float Output_N87=0.0;
float param_61=(*sc_set0.UserUniforms).alphaMaxStart;
Output_N87=param_61;
float Output_N88=0.0;
float param_62=(*sc_set0.UserUniforms).alphaMaxEnd;
Output_N88=param_62;
float4 colorLife_N70=float4(0.0);
float3 param_63=Output_N82;
float3 param_64=Output_N83;
float param_65=Output_N77;
float3 param_66=Output_N78;
float3 param_67=Output_N80;
float3 param_68=Output_N79;
float3 param_69=Output_N81;
float param_70=Output_N106;
float param_71=Output_N89;
float param_72=Output_N90;
float param_73=Output_N84;
float param_74=Output_N85;
float param_75=Output_N86;
float param_76=Output_N87;
float param_77=Output_N88;
float param_78=seedVal_N25;
float param_79=normTime_N25;
ssGlobals param_81=Globals;
tempGlobals=param_81;
float4 param_80=float4(0.0);
N70_colorStart=param_63;
N70_colorEnd=param_64;
N70_COLORMINMAX=param_65!=0.0;
N70_colorMinStart=param_66;
N70_colorMinEnd=param_67;
N70_colorMaxStart=param_68;
N70_colorMaxEnd=param_69;
N70_COLORMONOMIN=param_70!=0.0;
N70_alphaStart=param_71;
N70_alphaEnd=param_72;
N70_ALPHAMINMAX=param_73!=0.0;
N70_alphaMinStart=param_74;
N70_alphaMinEnd=param_75;
N70_alphaMaxStart=param_76;
N70_alphaMaxEnd=param_77;
N70_seedVal=param_78;
N70_normTime=param_79;
float3 l9_681=float3(0.0);
float3 l9_682=float3(0.0);
float l9_683=0.0;
float l9_684=0.0;
float4 l9_685=tempGlobals.VertexColor;
float4 l9_686=tempGlobals.VertexColor;
float4 l9_687=tempGlobals.VertexColor;
float l9_688=l9_685.x+(l9_686.y*l9_687.z);
if (N70_COLORMINMAX)
{
float l9_689=fract((l9_688*82.124229)+N70_seedVal);
float l9_690=fract((l9_688*9115.2148)+N70_seedVal);
float l9_691=fract((l9_688*654.15588)+N70_seedVal);
float3 l9_692=fract((float3(l9_689,l9_690,l9_691)*27.21883)+float3(N70_seedVal));
if (N70_COLORMONOMIN)
{
l9_692=fract((float3(l9_689,l9_689,l9_689)*27.21883)+float3(N70_seedVal));
}
l9_681=mix(N70_colorMinStart,N70_colorMaxStart,l9_692);
l9_682=mix(N70_colorMinEnd,N70_colorMaxEnd,l9_692);
}
else
{
l9_681=N70_colorStart;
l9_682=N70_colorEnd;
}
if (N70_ALPHAMINMAX)
{
float l9_693=fract((l9_688*3.3331299)+N70_seedVal);
l9_683=mix(N70_alphaMinStart,N70_alphaMaxStart,l9_693);
l9_684=mix(N70_alphaMinEnd,N70_alphaMaxEnd,l9_693);
}
else
{
l9_683=N70_alphaStart;
l9_684=N70_alphaEnd;
}
l9_681=mix(l9_681,l9_682,float3(N70_normTime));
l9_683=mix(l9_683,l9_684,N70_normTime);
N70_colorLife=float4(l9_681,l9_683);
param_80=N70_colorLife;
colorLife_N70=param_80;
float Output_N29=0.0;
float param_82;
if ((int(COLORRAMP_tmp)!=0))
{
param_82=1.001;
}
else
{
param_82=0.001;
}
param_82-=0.001;
Output_N29=param_82;
float2 TextureSize_N21=float2(0.0);
float2 param_83=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
TextureSize_N21=param_83;
float4 Output_N30=float4(0.0);
float4 param_84=(*sc_set0.UserUniforms).colorRampMult;
Output_N30=param_84;
float Output_N60=0.0;
float param_85;
if ((int(NORANDOFFSET_tmp)!=0))
{
param_85=1.001;
}
else
{
param_85=0.001;
}
param_85-=0.001;
Output_N60=param_85;
float4 colorRampTex_N71=float4(0.0);
float2 param_86=TextureSize_N21;
float4 param_87=Output_N30;
float param_88=Output_N60;
float param_89=normTime_N25;
ssGlobals param_91=Globals;
tempGlobals=param_91;
float4 param_90=float4(0.0);
N71_texSize=param_86;
N71_colorRampMult=param_87;
N71_NORANDOFFSET=param_88!=0.0;
N71_normTime=param_89;
float2 l9_694=tempGlobals.Surface_UVCoord0;
float2 l9_695=l9_694;
float l9_696=ceil(N71_normTime*N71_texSize.x)/N71_texSize.x;
float l9_697=l9_696;
if (N71_NORANDOFFSET)
{
l9_697+=(l9_695.x/N71_texSize.x);
}
float2 l9_698=float2(l9_697,0.5);
float4 l9_699=float4(0.0);
int l9_700;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_701=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_701=0;
}
else
{
l9_701=in.varStereoViewID;
}
int l9_702=l9_701;
l9_700=1-l9_702;
}
else
{
int l9_703=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_703=0;
}
else
{
l9_703=in.varStereoViewID;
}
int l9_704=l9_703;
l9_700=l9_704;
}
int l9_705=l9_700;
int l9_706=colorRampTextureLayout_tmp;
int l9_707=l9_705;
float2 l9_708=l9_698;
bool l9_709=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_710=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_711=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_712=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_713=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_714=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_715=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_716=0.0;
bool l9_717=l9_714&&(!l9_712);
float l9_718=1.0;
float l9_719=l9_708.x;
int l9_720=l9_711.x;
if (l9_720==1)
{
l9_719=fract(l9_719);
}
else
{
if (l9_720==2)
{
float l9_721=fract(l9_719);
float l9_722=l9_719-l9_721;
float l9_723=step(0.25,fract(l9_722*0.5));
l9_719=mix(l9_721,1.0-l9_721,fast::clamp(l9_723,0.0,1.0));
}
}
l9_708.x=l9_719;
float l9_724=l9_708.y;
int l9_725=l9_711.y;
if (l9_725==1)
{
l9_724=fract(l9_724);
}
else
{
if (l9_725==2)
{
float l9_726=fract(l9_724);
float l9_727=l9_724-l9_726;
float l9_728=step(0.25,fract(l9_727*0.5));
l9_724=mix(l9_726,1.0-l9_726,fast::clamp(l9_728,0.0,1.0));
}
}
l9_708.y=l9_724;
if (l9_712)
{
bool l9_729=l9_714;
bool l9_730;
if (l9_729)
{
l9_730=l9_711.x==3;
}
else
{
l9_730=l9_729;
}
float l9_731=l9_708.x;
float l9_732=l9_713.x;
float l9_733=l9_713.z;
bool l9_734=l9_730;
float l9_735=l9_718;
float l9_736=fast::clamp(l9_731,l9_732,l9_733);
float l9_737=step(abs(l9_731-l9_736),9.9999997e-06);
l9_735*=(l9_737+((1.0-float(l9_734))*(1.0-l9_737)));
l9_731=l9_736;
l9_708.x=l9_731;
l9_718=l9_735;
bool l9_738=l9_714;
bool l9_739;
if (l9_738)
{
l9_739=l9_711.y==3;
}
else
{
l9_739=l9_738;
}
float l9_740=l9_708.y;
float l9_741=l9_713.y;
float l9_742=l9_713.w;
bool l9_743=l9_739;
float l9_744=l9_718;
float l9_745=fast::clamp(l9_740,l9_741,l9_742);
float l9_746=step(abs(l9_740-l9_745),9.9999997e-06);
l9_744*=(l9_746+((1.0-float(l9_743))*(1.0-l9_746)));
l9_740=l9_745;
l9_708.y=l9_740;
l9_718=l9_744;
}
float2 l9_747=l9_708;
bool l9_748=l9_709;
float3x3 l9_749=l9_710;
if (l9_748)
{
l9_747=float2((l9_749*float3(l9_747,1.0)).xy);
}
float2 l9_750=l9_747;
l9_708=l9_750;
float l9_751=l9_708.x;
int l9_752=l9_711.x;
bool l9_753=l9_717;
float l9_754=l9_718;
if ((l9_752==0)||(l9_752==3))
{
float l9_755=l9_751;
float l9_756=0.0;
float l9_757=1.0;
bool l9_758=l9_753;
float l9_759=l9_754;
float l9_760=fast::clamp(l9_755,l9_756,l9_757);
float l9_761=step(abs(l9_755-l9_760),9.9999997e-06);
l9_759*=(l9_761+((1.0-float(l9_758))*(1.0-l9_761)));
l9_755=l9_760;
l9_751=l9_755;
l9_754=l9_759;
}
l9_708.x=l9_751;
l9_718=l9_754;
float l9_762=l9_708.y;
int l9_763=l9_711.y;
bool l9_764=l9_717;
float l9_765=l9_718;
if ((l9_763==0)||(l9_763==3))
{
float l9_766=l9_762;
float l9_767=0.0;
float l9_768=1.0;
bool l9_769=l9_764;
float l9_770=l9_765;
float l9_771=fast::clamp(l9_766,l9_767,l9_768);
float l9_772=step(abs(l9_766-l9_771),9.9999997e-06);
l9_770*=(l9_772+((1.0-float(l9_769))*(1.0-l9_772)));
l9_766=l9_771;
l9_762=l9_766;
l9_765=l9_770;
}
l9_708.y=l9_762;
l9_718=l9_765;
float2 l9_773=l9_708;
int l9_774=l9_706;
int l9_775=l9_707;
float l9_776=l9_716;
float2 l9_777=l9_773;
int l9_778=l9_774;
int l9_779=l9_775;
float3 l9_780=float3(0.0);
if (l9_778==0)
{
l9_780=float3(l9_777,0.0);
}
else
{
if (l9_778==1)
{
l9_780=float3(l9_777.x,(l9_777.y*0.5)+(0.5-(float(l9_779)*0.5)),0.0);
}
else
{
l9_780=float3(l9_777,float(l9_779));
}
}
float3 l9_781=l9_780;
float3 l9_782=l9_781;
float4 l9_783=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_782.xy,bias(l9_776));
float4 l9_784=l9_783;
if (l9_714)
{
l9_784=mix(l9_715,l9_784,float4(l9_718));
}
float4 l9_785=l9_784;
l9_699=l9_785;
float4 l9_786=l9_699;
N71_colorRampTex=l9_786*N71_colorRampMult;
param_90=N71_colorRampTex;
colorRampTex_N71=param_90;
float Output_N72=0.0;
float param_92;
if ((int(ALPHADISSOLVE_tmp)!=0))
{
param_92=1.001;
}
else
{
param_92=0.001;
}
param_92-=0.001;
Output_N72=param_92;
float Output_N73=0.0;
float param_93=(*sc_set0.UserUniforms).alphaDissolveMult;
Output_N73=param_93;
float Output_N74=0.0;
float param_94;
if ((int(BLACKASALPHA_tmp)!=0))
{
param_94=1.001;
}
else
{
param_94=0.001;
}
param_94-=0.001;
Output_N74=param_94;
float Output_N75=0.0;
float param_95;
if ((int(PREMULTIPLIEDCOLOR_tmp)!=0))
{
param_95=1.001;
}
else
{
param_95=0.001;
}
param_95-=0.001;
Output_N75=param_95;
float4 result_N58=float4(0.0);
float param_96=Output_N28;
float param_97=Output_N62;
float4 param_98=flipbookTex_N76;
float param_99=Output_N114;
float4 param_100=vectorTex_N76;
float4 param_101=colorLife_N70;
float param_102=Output_N29;
float4 param_103=colorRampTex_N71;
float param_104=Output_N72;
float param_105=Output_N73;
float param_106=Output_N74;
float param_107=Output_N75;
float param_108=normTime_N25;
ssGlobals param_110=Globals;
tempGlobals=param_110;
float4 param_109=float4(0.0);
N58_BASETEXTURE=param_96!=0.0;
N58_FLIPBOOK=param_97!=0.0;
N58_flipbookTex=param_98;
N58_VECTORFIELD=param_99!=0.0;
N58_vectorFieldTex=param_100;
N58_colorLife=param_101;
N58_COLORRAMP=param_102!=0.0;
N58_colorRampTex=param_103;
N58_ALPHADISSOLVE=param_104!=0.0;
N58_alphaDissolveMult=param_105;
N58_BLACKASALPHA=param_106!=0.0;
N58_PREMULTIPLIEDCOLOR=param_107!=0.0;
N58_normTime=param_108;
float3 l9_787=float3(0.0);
float4 l9_788=float4(1.0);
float4 l9_789=float4(1.0);
float2 l9_790=tempGlobals.Surface_UVCoord0;
float2 l9_791=l9_790;
float l9_792=l9_787.x;
if (N58_BASETEXTURE)
{
float2 l9_793=l9_791;
float4 l9_794=float4(0.0);
int l9_795;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_796=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_796=0;
}
else
{
l9_796=in.varStereoViewID;
}
int l9_797=l9_796;
l9_795=1-l9_797;
}
else
{
int l9_798=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_798=0;
}
else
{
l9_798=in.varStereoViewID;
}
int l9_799=l9_798;
l9_795=l9_799;
}
int l9_800=l9_795;
int l9_801=mainTextureLayout_tmp;
int l9_802=l9_800;
float2 l9_803=l9_793;
bool l9_804=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_805=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_806=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_807=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_808=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_809=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_810=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_811=0.0;
bool l9_812=l9_809&&(!l9_807);
float l9_813=1.0;
float l9_814=l9_803.x;
int l9_815=l9_806.x;
if (l9_815==1)
{
l9_814=fract(l9_814);
}
else
{
if (l9_815==2)
{
float l9_816=fract(l9_814);
float l9_817=l9_814-l9_816;
float l9_818=step(0.25,fract(l9_817*0.5));
l9_814=mix(l9_816,1.0-l9_816,fast::clamp(l9_818,0.0,1.0));
}
}
l9_803.x=l9_814;
float l9_819=l9_803.y;
int l9_820=l9_806.y;
if (l9_820==1)
{
l9_819=fract(l9_819);
}
else
{
if (l9_820==2)
{
float l9_821=fract(l9_819);
float l9_822=l9_819-l9_821;
float l9_823=step(0.25,fract(l9_822*0.5));
l9_819=mix(l9_821,1.0-l9_821,fast::clamp(l9_823,0.0,1.0));
}
}
l9_803.y=l9_819;
if (l9_807)
{
bool l9_824=l9_809;
bool l9_825;
if (l9_824)
{
l9_825=l9_806.x==3;
}
else
{
l9_825=l9_824;
}
float l9_826=l9_803.x;
float l9_827=l9_808.x;
float l9_828=l9_808.z;
bool l9_829=l9_825;
float l9_830=l9_813;
float l9_831=fast::clamp(l9_826,l9_827,l9_828);
float l9_832=step(abs(l9_826-l9_831),9.9999997e-06);
l9_830*=(l9_832+((1.0-float(l9_829))*(1.0-l9_832)));
l9_826=l9_831;
l9_803.x=l9_826;
l9_813=l9_830;
bool l9_833=l9_809;
bool l9_834;
if (l9_833)
{
l9_834=l9_806.y==3;
}
else
{
l9_834=l9_833;
}
float l9_835=l9_803.y;
float l9_836=l9_808.y;
float l9_837=l9_808.w;
bool l9_838=l9_834;
float l9_839=l9_813;
float l9_840=fast::clamp(l9_835,l9_836,l9_837);
float l9_841=step(abs(l9_835-l9_840),9.9999997e-06);
l9_839*=(l9_841+((1.0-float(l9_838))*(1.0-l9_841)));
l9_835=l9_840;
l9_803.y=l9_835;
l9_813=l9_839;
}
float2 l9_842=l9_803;
bool l9_843=l9_804;
float3x3 l9_844=l9_805;
if (l9_843)
{
l9_842=float2((l9_844*float3(l9_842,1.0)).xy);
}
float2 l9_845=l9_842;
l9_803=l9_845;
float l9_846=l9_803.x;
int l9_847=l9_806.x;
bool l9_848=l9_812;
float l9_849=l9_813;
if ((l9_847==0)||(l9_847==3))
{
float l9_850=l9_846;
float l9_851=0.0;
float l9_852=1.0;
bool l9_853=l9_848;
float l9_854=l9_849;
float l9_855=fast::clamp(l9_850,l9_851,l9_852);
float l9_856=step(abs(l9_850-l9_855),9.9999997e-06);
l9_854*=(l9_856+((1.0-float(l9_853))*(1.0-l9_856)));
l9_850=l9_855;
l9_846=l9_850;
l9_849=l9_854;
}
l9_803.x=l9_846;
l9_813=l9_849;
float l9_857=l9_803.y;
int l9_858=l9_806.y;
bool l9_859=l9_812;
float l9_860=l9_813;
if ((l9_858==0)||(l9_858==3))
{
float l9_861=l9_857;
float l9_862=0.0;
float l9_863=1.0;
bool l9_864=l9_859;
float l9_865=l9_860;
float l9_866=fast::clamp(l9_861,l9_862,l9_863);
float l9_867=step(abs(l9_861-l9_866),9.9999997e-06);
l9_865*=(l9_867+((1.0-float(l9_864))*(1.0-l9_867)));
l9_861=l9_866;
l9_857=l9_861;
l9_860=l9_865;
}
l9_803.y=l9_857;
l9_813=l9_860;
float2 l9_868=l9_803;
int l9_869=l9_801;
int l9_870=l9_802;
float l9_871=l9_811;
float2 l9_872=l9_868;
int l9_873=l9_869;
int l9_874=l9_870;
float3 l9_875=float3(0.0);
if (l9_873==0)
{
l9_875=float3(l9_872,0.0);
}
else
{
if (l9_873==1)
{
l9_875=float3(l9_872.x,(l9_872.y*0.5)+(0.5-(float(l9_874)*0.5)),0.0);
}
else
{
l9_875=float3(l9_872,float(l9_874));
}
}
float3 l9_876=l9_875;
float3 l9_877=l9_876;
float4 l9_878=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_877.xy,bias(l9_871));
float4 l9_879=l9_878;
if (l9_809)
{
l9_879=mix(l9_810,l9_879,float4(l9_813));
}
float4 l9_880=l9_879;
l9_794=l9_880;
float4 l9_881=l9_794;
l9_788=l9_881;
if (N58_FLIPBOOK)
{
l9_788=N58_flipbookTex;
if (N58_VECTORFIELD)
{
l9_788=N58_vectorFieldTex;
}
}
}
if (N58_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_789=N58_colorRampTex;
}
}
N58_result=(l9_788*N58_colorLife)*l9_789;
if (N58_ALPHADISSOLVE)
{
l9_792=N58_normTime*N58_alphaDissolveMult;
N58_result.w=fast::clamp(N58_result.w-l9_792,0.0,1.0);
}
if (N58_BLACKASALPHA)
{
float l9_882=length(N58_result.xyz);
N58_result.w=l9_882;
}
if (N58_PREMULTIPLIEDCOLOR)
{
float3 l9_883=N58_result.xyz*N58_result.w;
N58_result=float4(l9_883.x,l9_883.y,l9_883.z,N58_result.w);
}
param_109=N58_result;
result_N58=param_109;
FinalColor=result_N58;
float param_111=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_111<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_884=gl_FragCoord;
float2 l9_885=floor(mod(l9_884.xy,float2(4.0)));
float l9_886=(mod(dot(l9_885,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_111<l9_886)
{
discard_fragment();
}
}
float4 param_112=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_887=param_112;
float4 l9_888=l9_887;
float l9_889=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_889=l9_888.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_889=fast::clamp(l9_888.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_889=fast::clamp(dot(l9_888.xyz,float3(l9_888.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_889=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_889=(1.0-dot(l9_888.xyz,float3(0.33333001)))*l9_888.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_889=(1.0-fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0))*l9_888.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_889=fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0)*l9_888.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_889=fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_889=fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0)*l9_888.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_889=dot(l9_888.xyz,float3(0.33333001))*l9_888.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_889=1.0-fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_889=fast::clamp(dot(l9_888.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_890=l9_889;
float l9_891=l9_890;
float l9_892=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_891;
float3 l9_893=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_887.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_894=float4(l9_893.x,l9_893.y,l9_893.z,l9_892);
param_112=l9_894;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_112=float4(param_112.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_895=param_112;
float4 l9_896=float4(0.0);
float4 l9_897=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_898=out.sc_FragData0;
l9_897=l9_898;
}
else
{
float4 l9_899=gl_FragCoord;
float2 l9_900=l9_899.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_901=l9_900;
float2 l9_902=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_903=1;
int l9_904=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_904=0;
}
else
{
l9_904=in.varStereoViewID;
}
int l9_905=l9_904;
int l9_906=l9_905;
float3 l9_907=float3(l9_901,0.0);
int l9_908=l9_903;
int l9_909=l9_906;
if (l9_908==1)
{
l9_907.y=((2.0*l9_907.y)+float(l9_909))-1.0;
}
float2 l9_910=l9_907.xy;
l9_902=l9_910;
}
else
{
l9_902=l9_901;
}
float2 l9_911=l9_902;
float2 l9_912=l9_911;
float2 l9_913=l9_912;
float2 l9_914=l9_913;
float l9_915=0.0;
int l9_916;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_917=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_917=0;
}
else
{
l9_917=in.varStereoViewID;
}
int l9_918=l9_917;
l9_916=1-l9_918;
}
else
{
int l9_919=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_919=0;
}
else
{
l9_919=in.varStereoViewID;
}
int l9_920=l9_919;
l9_916=l9_920;
}
int l9_921=l9_916;
float2 l9_922=l9_914;
int l9_923=sc_ScreenTextureLayout_tmp;
int l9_924=l9_921;
float l9_925=l9_915;
float2 l9_926=l9_922;
int l9_927=l9_923;
int l9_928=l9_924;
float3 l9_929=float3(0.0);
if (l9_927==0)
{
l9_929=float3(l9_926,0.0);
}
else
{
if (l9_927==1)
{
l9_929=float3(l9_926.x,(l9_926.y*0.5)+(0.5-(float(l9_928)*0.5)),0.0);
}
else
{
l9_929=float3(l9_926,float(l9_928));
}
}
float3 l9_930=l9_929;
float3 l9_931=l9_930;
float4 l9_932=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_931.xy,bias(l9_925));
float4 l9_933=l9_932;
float4 l9_934=l9_933;
l9_897=l9_934;
}
float4 l9_935=l9_897;
float3 l9_936=l9_935.xyz;
float3 l9_937=l9_936;
float3 l9_938=l9_895.xyz;
float3 l9_939=definedBlend(l9_937,l9_938,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_896=float4(l9_939.x,l9_939.y,l9_939.z,l9_896.w);
float3 l9_940=mix(l9_936,l9_896.xyz,float3(l9_895.w));
l9_896=float4(l9_940.x,l9_940.y,l9_940.z,l9_896.w);
l9_896.w=1.0;
float4 l9_941=l9_896;
param_112=l9_941;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_942=float4(in.varScreenPos.xyz,1.0);
param_112=l9_942;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_943=gl_FragCoord;
float l9_944=fast::clamp(abs(l9_943.z),0.0,1.0);
float4 l9_945=float4(l9_944,1.0-l9_944,1.0,1.0);
param_112=l9_945;
}
else
{
float4 l9_946=param_112;
float4 l9_947=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_947=float4(mix(float3(1.0),l9_946.xyz,float3(l9_946.w)),l9_946.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_948=l9_946.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_948=fast::clamp(l9_948,0.0,1.0);
}
l9_947=float4(l9_946.xyz*l9_948,l9_948);
}
else
{
l9_947=l9_946;
}
}
float4 l9_949=l9_947;
param_112=l9_949;
}
}
}
}
}
float4 l9_950=param_112;
FinalColor=l9_950;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_951=float4(0.0);
l9_951=float4(0.0);
float4 l9_952=l9_951;
float4 Cost=l9_952;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_113=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_113,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_114=FinalColor;
float4 l9_953=param_114;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_953.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_953;
return out;
}
} // FRAGMENT SHADER
