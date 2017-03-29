#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin; // Cantonada minima capsa englobant
uniform vec3 boundingBoxMax; // Cantonada maxima capsa englobant

void main()
{
	float minY = boundingBoxMin.y;
	float maxY = boundingBoxMax.y;
	float mixed = mix(boundingBoxMin.y, boundingBoxMax.y, vertex.y);
    frontColor = fract(mixed) * vec4(1,1,1,1);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}


