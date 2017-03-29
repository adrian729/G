#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;

uniform float time;
uniform float speed = 0.5; // rad/s

#define M_PI 3.1415926535897932384626433832795

void main()
{
	frontColor = vec4(color, 1.0);
	
	float phi = 0.5*time;
	mat3 rotation = mat3( vec3(cos(phi), 0, -sin(phi)), vec3(0., 1., 0.), vec3(sin(phi), 0, cos(phi)) );
	vec3 vertexRotated = rotation * vertex;
    gl_Position = modelViewProjectionMatrix * vec4(vertexRotated, 1.0);
}