//
// Generated by Microsoft (R) D3DX9 Shader Compiler 9.08.299.0000
//
// Parameters:

row_major float4x4 ModelViewProj : register(c0);
float3 LightDirection[3] : register(c13);
//float4 TESR_FogData : register(c23);
//float4 TESR_FogColor : register(c24);
row_major float4x4 TESR_ShadowCameraToLightTransform[2] : register(c34);

// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   ModelViewProj[0]  const_0        1
//   ModelViewProj[1]  const_1        1
//   ModelViewProj[2]  const_2        1
//   ModelViewProj[3]  const_3        1
//   LightDirection[0] const_13       1
//


// Structures:

struct VS_INPUT {
    float4 LPOSITION : POSITION;
    float3 LTANGENT : TANGENT;
    float3 LBINORMAL : BINORMAL;
    float3 LNORMAL : NORMAL;
    float4 LTEXCOORD_0 : TEXCOORD0;
    float4 LCOLOR_0 : COLOR0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
    float2 texcoord_1 : TEXCOORD1;
    float4 texcoord_2 : TEXCOORD2;
    float3 texcoord_3 : TEXCOORD3;
    float4 texcoord_6 : TEXCOORD6;
	float4 texcoord_7 : TEXCOORD7;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

#define	expand(v)		(((v) - 0.5) / 0.5)
#define	compress(v)		(((v) * 0.5) + 0.5)

    const float4 const_4 = {0.5, 1, 0, 0};

    float3 q0;
	float4 r0;
	
    q0.xyz = mul(float3x3(IN.LTANGENT.xyz, IN.LBINORMAL.xyz, IN.LNORMAL.xyz), LightDirection[0].xyz);
	r0.xyzw = mul(ModelViewProj, IN.LPOSITION.xyzw);
    OUT.position.xyzw = r0.xyzw;
    OUT.texcoord_0.xy = IN.LTEXCOORD_0.xy;
    OUT.texcoord_1.xy = IN.LTEXCOORD_0.xy;
    OUT.texcoord_2.xyzw = (IN.LCOLOR_0.xyzx * const_4.yyyz) + const_4.zzzy;
    OUT.texcoord_3.xyz = compress(q0.xyz);	// [-1,+1] to [0,1]
	OUT.texcoord_6.xyzw = mul(r0.xyzw, TESR_ShadowCameraToLightTransform[0]);
	OUT.texcoord_7.xyzw = mul(r0.xyzw, TESR_ShadowCameraToLightTransform[1]);
    return OUT;
	
};

// approximately 11 instruction slots used