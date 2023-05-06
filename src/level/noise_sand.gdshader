shader_type canvas_item;

uniform sampler2D noise_tex : repeat_enable;
uniform float cut_factor;
uniform float border;

uniform sampler2D texture_a;
uniform sampler2D texture_b;

void fragment() {
	float noise = texture(noise_tex, UV).r;
	noise = smoothstep(cut_factor, cut_factor+border, noise);
	COLOR = mix(texture(texture_a, UV), texture(texture_b, UV), noise);
}
