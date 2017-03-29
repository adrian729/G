#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 projectionMatrix, viewMatrix, modelMatrix;
uniform mat3 normalMatrix;

uniform vec2 Min = vec2(-1, -1);
uniform vec2 Max = vec2(1, 1);


void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;

    vtexCoord = texCoord;
	
    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(vertex, 1.0);
}