#version 330 core

in float NDCx;
out vec4 fragColor;

uniform float time;

void main()
{
	if(NDCx >= time) discard;
    fragColor = vec4(0.,0.,1.,1.);
}

