//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
//   vsa shaderdump19/SLS2050.pso /Fcshaderdump19/SLS2050.pso.dis
//
//
// Parameters:

sampler2D BaseMap : register(s0);
sampler2D NormalMap : register(s1);
float4 PSLightColor[4] : register(c2);

float4 TESR_ShadowData : register(c8);

sampler2D TESR_ShadowMapBufferNear : register(s6) = sampler_state { ADDRESSU = CLAMP; ADDRESSV = CLAMP; MAGFILTER = LINEAR; MINFILTER = LINEAR; MIPFILTER = LINEAR; };
sampler2D TESR_ShadowMapBufferFar : register(s7) = sampler_state { ADDRESSU = CLAMP; ADDRESSV = CLAMP; MAGFILTER = LINEAR; MINFILTER = LINEAR; MIPFILTER = LINEAR; };


// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   PSLightColor[0] const_2        1
//   PSLightColor[1] const_3        1
//   PSLightColor[2] const_4        1
//   BaseMap      texture_0       1
//   NormalMap    texture_1       1
//


// Structures:

struct VS_OUTPUT {
    float2 BaseUV : TEXCOORD0;			// partial precision
    float3 texcoord_1 : TEXCOORD1_centroid;			// partial precision
    float4 texcoord_2 : TEXCOORD2_centroid;
    float4 texcoord_3 : TEXCOORD3_centroid;
    float4 texcoord_4 : TEXCOORD4_centroid;
	float4 texcoord_6 : TEXCOORD6;
    float4 texcoord_7 : TEXCOORD7;

};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

// Code:
#include "..\Includes\Shadow.hlsl"

PS_OUTPUT main(VS_OUTPUT IN) {
    PS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)
#define	shade(n, l)		max(dot(n, l), 0)
#define	shades(n, l)		saturate(dot(n, l))

    float1 q1;
    float3 q14;
    float3 q16;
    float1 q3;
    float1 q5;
    float3 q6;
    float4 r0;
    float4 r1;
    float4 r2;

    r1.xyzw = tex2D(NormalMap, IN.BaseUV.xy);			// partial precision
    r0.xyzw = tex2D(BaseMap, IN.BaseUV.xy);			// partial precision
    q16.xyz = normalize(expand(r1.xyz));			// partial precision
    q5.x = 1 - saturate(length(IN.texcoord_4.xyz) / IN.texcoord_4.w);			// partial precision
    q1.x = 1 - saturate(length(IN.texcoord_3.xyz) / IN.texcoord_3.w);			// partial precision
    r2.w = q1.x * shades(q16.xyz, normalize(IN.texcoord_3.xyz));			// partial precision
    q3.x = 1 - saturate(length(IN.texcoord_2.xyz) / IN.texcoord_2.w);			// partial precision
    float Shadow = GetLightAmount(IN.texcoord_6, IN.texcoord_7);
    q14.xyz = ((shades(q16.xyz, normalize(IN.texcoord_2.xyz)) * q3.x) * PSLightColor[0].rgb * Shadow) + (r2.w * PSLightColor[1].rgb);			// partial precision
    q6.xyz = ((shades(q16.xyz, normalize(IN.texcoord_4.xyz)) * q5.x) * PSLightColor[2].rgb) + q14.xyz;			// partial precision
    OUT.color_0.a = 1;			// partial precision
    OUT.color_0.rgb = q6.xyz * (r0.xyz * IN.texcoord_1.xyz);			// partial precision

    return OUT;
};

// approximately 41 instruction slots used (2 texture, 39 arithmetic)
