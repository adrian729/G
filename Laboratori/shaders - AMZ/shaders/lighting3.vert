#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec3 fN;
out vec3 fP;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;

void main()
{
    fN = (normalMatrix * normal);
    fP = (modelViewMatrix * vec4(vertex, 1)).xyz;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
