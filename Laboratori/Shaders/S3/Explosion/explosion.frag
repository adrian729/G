#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

uniform float time;

void main()
{
	int i = int(time/(1.0/30.0)) % 48;
	int j =(i/8) + 1;

	vec2 vtexCoordExp = vtexCoord;
	vtexCoordExp.s = (vtexCoord.s + i)/8;
	vtexCoordExp.t = (vtexCoord.t - j)/6;
	vec4 color = texture(explosion, vtexCoordExp);
    fragColor = color * color.a;
}
