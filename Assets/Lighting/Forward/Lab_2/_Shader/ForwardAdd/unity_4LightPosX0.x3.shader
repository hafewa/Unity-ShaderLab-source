Shader "Tut/Lighting/Forward/Lab_2/Add/unity_4LightPosX0.x3" {

	SubShader {
		pass{
		Tags{ "LightMode"="ForwardBase"}
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#pragma multi_compile_fwdbase
		#include "UnityCG.cginc"
		#include "Lighting.cginc"

		struct vertOut{
			float4 pos:SV_POSITION;
			float4 color:COLOR;
		};
		vertOut vert(appdata_base v)
		{
			vertOut o;
			o.pos=mul(UNITY_MATRIX_MVP,v.vertex);
			o.color=float4(0,0.5,1,1);
			return o;
		}
		float4 frag(vertOut i):COLOR
		{
			return i.color;
		}
		ENDCG
		}//end pass

		pass{
		Tags{ "LightMode"="ForwardAdd"}
		Blend One Zero
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"
		#include "Lighting.cginc"

		struct vertOut{
			float4 pos:SV_POSITION;
			float4 color:COLOR;
		};
		vertOut vert(appdata_base v)
		{
			vertOut o;
			o.pos=mul(UNITY_MATRIX_MVP,v.vertex);
			o.color=unity_4LightPosX0[3];
			return o;
		}
		float4 frag(vertOut i):COLOR
		{
			return i.color;
		}
		ENDCG
		}//end pass
	}
}
