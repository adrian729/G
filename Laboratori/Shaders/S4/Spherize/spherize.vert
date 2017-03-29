#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 projectionMatrix, viewMatrix, modelMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float speed = 0.5; // rad/s

#define M_PI 3.1415926535897932384626433832795

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
	
	vec3 vertexProjected = normalize(vertex);
    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(vertexProjected, 1.0);
}