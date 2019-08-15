Shader "Tut/Effects/Dof" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
Subshader {
 Pass {
	  ZTest Always Cull Off ZWrite Off
	  Fog { Mode off }      
	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag
	#include "UnityCG.cginc"
	struct v2f {
		float4 pos : POSITION;
		float2 uv : TEXCOORD0;
	};
	sampler2D _MainTex;
	sampler2D _CameraDepthTexture;
	sampler2D _BlurTex;
	v2f vert (appdata_img v) {
		v2f o;
		o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uv.xy = v.texcoord.xy;
		return o;  
	}
	half4 frag (v2f i) : COLOR {
		half4 ori =tex2D(_MainTex,i.uv);
		half4 blur=tex2D(_BlurTex,i.uv);
		float dep=tex2D(_CameraDepthTexture,i.uv).r;
		dep=Linear01Depth(dep);
		return lerp(ori,blur,dep);
	} 
      ENDCG
  }
}
Fallback off
}