#version 330 core

in vec3 fN;
in vec3 fP;
in vec3 fcolor;
out vec4 fragColor;



const vec4 yellow = vec4(0.7, 0.6, 0.0, 1);
uniform float epsilon = 0.1;
uniform float light = 0.5;

void main()
{
  	float c = abs(length(dot(normalize(fP), normalize(fN))));
	if (c < epsilon){
		fragColor = yellow;
	} else {
		fragColor = vec4(fcolor, 1) * light * fN.z;
	}
}
