Shader "Custom/Chromatic Aberration"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color (RGBA)", Color) = (1, 1, 1, 1) // add _Color property

		[Header(Red)]
		_RedX ("Offset X", Range(-0.5, 0.5)) = 0.0
		_RedY ("Offset Y", Range(-0.5, 0.5)) = 0.0

		[Header(Green)]
		_GreenX ("Offset X", Range(-0.5, 0.5)) = 0.0
		_GreenY ("Offset Y", Range(-0.5, 0.5)) = 0.0

		[Header(Blue)]
		_BlueX ("Offset X", Range(-0.5, 0.5)) = 0.0
		_BlueY ("Offset Y", Range(-0.5, 0.5)) = 0.0
	}
	SubShader
	{
		Tags { "RenderType" = "Transparent" "Queue" = "Transparent" }
			ZWrite Off
			// ZTest Less
			Blend SrcAlpha OneMinusSrcAlpha
			Cull Off 
			LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			// #pragma fragment frag
			#pragma fragment frag Lambert alpha

			#include "UnityCG.cginc"
		
			sampler2D _MainTex;
			float _RedX;
			float _RedY;
			float _GreenX;
			float _GreenY;
			float _BlueX;
			float _BlueY;
			
			fixed4 frag (v2f_img i) : SV_Target
			{
				fixed4 col = fixed4(1, 1, 1, 1);

				float2 red_uv = i.uv + float2(_RedX, _RedY);
				float2 green_uv = i.uv + float2(_GreenX, _GreenY);
				float2 blue_uv = i.uv + float2(_BlueX, _BlueY);

				col.r = tex2D(_MainTex, red_uv).r;
				col.g = tex2D(_MainTex, green_uv).g;
				col.b = tex2D(_MainTex, blue_uv).b;
				col.a = tex2D(_MainTex,i.uv).a;

				return col;
			}
			ENDCG
		}
	}
}