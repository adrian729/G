#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;

uniform float time;

void main()
{
	frontColor = vec4(0.0, 0.0, 1.0, 1.0);
	
	float phi = -time * texCoord.s;
	mat3 rotation = mat3( vec3(cos(phi), 0, -sin(phi)), vec3(0., 1., 0.), vec3(sin(phi), 0, cos(phi)) );
	vec3 vertexRotated = rotation * vertex;
    gl_Position = modelViewProjectionMatrix * vec4(vertexRotated, 1.0);
}



