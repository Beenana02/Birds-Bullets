shader_type canvas_item;

uniform sampler2D noise : repeat_enable;
uniform vec2 scroll = vec2(0.05, 0.05);
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;
uniform float distStre : hint_range(-1,1) = 0.2;

void vertex() {
	vec4 noise_col = texture(noise, UV + scroll * TIME);
	vec4 screen_col = texture(SCREEN_TEXTURE, SCREEN_UV + distStre * noise_col.rr);
	COLOR = noise_col;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
