shader_type spatial;

uniform vec2 amplitude = vec2(0.4, 0.5);
uniform vec2 frequency = vec2(7.0, 4.5);
uniform vec2 time_factor = vec2(5.0, 2.5);

uniform sampler2D uv_offset_texture : hint_black;
uniform vec2 uv_offset_scale = vec2(0.2, 0.2);
uniform float uv_offset_time_scale = 0.05;
uniform float uv_offset_amplitude = 0.2;

uniform sampler2D texturemap : hint_albedo;
uniform vec2 texture_scale = vec2(8.0, 4.0);

uniform sampler2D normalmap : hint_normal;
uniform float refraction = 0.05;

float height(vec2 pos, float time) {
	return (amplitude.y * sin(pos.y * frequency.y + time * time_factor.y)) + (amplitude.x * sin(pos.x * frequency.x + time * time_factor.x));
}


void vertex() {
	VERTEX.y += height(VERTEX.xz, TIME); // sample the height at the location of our vertex
	TANGENT = normalize(vec3(0.0, height(VERTEX.xy - vec2(0.0, 0.2), TIME) + height(VERTEX.xy + vec2(0.0, -0.2), TIME), 0.4));
	BINORMAL = normalize(vec3(0.4, height(VERTEX.xy - vec2(0.2, 0.0), TIME) + height(VERTEX.xy + vec2(-0.2, 0.0), TIME ), 0.0));
	//NORMAL = cross(TANGENT, BINORMAL);
}
render_mode blend_mix,depth_draw_opaque,cull_back,diffuse_burley,specular_schlick_ggx;
uniform vec4 albedo : hint_color;
uniform sampler2D texture_albedo : hint_albedo;
uniform float specular;
uniform float roughness : hint_range(0,1);
uniform sampler2D texture_roughness : hint_white;
uniform vec4 roughness_texture_channel;
uniform sampler2D texture_emission : hint_black_albedo;
uniform vec4 emission : hint_color;
uniform float emission_energy;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;




void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	SPECULAR = specular;
	vec3 emission_tex = texture(texture_emission,base_uv).rgb;
	EMISSION = (emission.rgb+emission_tex)*emission_energy;
}


void light() {
// Salida:0

}