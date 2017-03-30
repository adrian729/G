#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;



void main()
{
	float a = - time * texCoord.s;
	
	mat3 R=mat3(vec3(cos(a), 0, -sin(a)),
			    vec3(0, 1, 0),
	    		vec3(sin(a), 0, cos(a)));
	vec3 V = R * vertex;
	frontColor=vec4(0, 0, 1, 1);
	gl_Position=modelViewProjectionMatrix*vec4(V, 1);
}
