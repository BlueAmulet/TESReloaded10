//
// Generated by Microsoft (R) HLSL Shader Compiler 9.23.949.2378
//
// Parameters:
float4 geometryOffset : register(c0);
float4 texOffset0 : register(c1);

// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   geometryOffset const_0       1
//   texOffset0     const_1       1
//


// Structures:

struct VS_INPUT {
    float4 LPOSITION : POSITION;
    float4 LTEXCOORD_0 : TEXCOORD0;
};

struct VS_OUTPUT {
    float4 position : POSITION;
    float2 texcoord_0 : TEXCOORD0;
};

// Code:

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    const int4 const_2 = {2, -2, 0, 0};

    OUT.position.xy = IN.LPOSITION.xy - (const_2.xy * geometryOffset.xy);
    OUT.position.zw = IN.LPOSITION.zw;
    OUT.texcoord_0.xy = IN.LTEXCOORD_0.xy + texOffset0.xy;
    return OUT;
	
};