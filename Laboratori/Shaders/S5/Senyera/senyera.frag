#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;

out vec4 fragColor;


const vec4 yellow = vec4(1, 1, 0, 1);
const vec4 red = vec4(1, 0, 0, 1);
const float a = 1.0 / 9;

void main()
{
	float f = fract(vtexCoord.s);
	if (f >= 0 && f < a) {
		fragColor = yellow;
	} else if (f >= 2 * a && f < 3 * a) {
		fragColor = yellow;
	} else if (f >= 4 * a && f < 5 * a) {
		fragColor = yellow;
	} else if (f >= 6 * a && f < 7 * a) {
		fragColor = yellow;
	} else if (f >= 8 * a && f < 9 * a) {
		fragColor = yellow;
	} else {
		fragColor = red;
	}
    
}
