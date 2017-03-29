#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 3;

void main()
{
	if(mod(gl_FragColor.y, n) != 0) discard;
    fragColor = frontColor;
}

