#version 330 core

in vec4 frontColor;
out vec4 fragColor;

void main()
{
	gl_FragCoord.z = -gl_FragCoord.z;
    fragColor = frontColor;
}
