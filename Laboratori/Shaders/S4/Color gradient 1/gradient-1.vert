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

const vec3 red = vec3(1, 0, 0);
const vec3 yellow = vec3(1, 1, 0);
const vec3 green = vec3(0, 1, 0);
const vec3 cyan = vec3(0, 1, 1);
const vec3 blue = vec3(0, 0, 1);

void main()
{
	float minY = boundingBoxMin.y;
	float maxY = boundingBoxMax.y;
	float y = 4*(vertex.y - minY) / abs(maxY - minY);
	vec3 interp;
	if (y < 1) interp = mix(red, yellow, fract(y));
	else if (y < 2) interp = mix(yellow, green, fract(y));
	else if (y < 3) interp = mix(green, cyan, fract(y));
	else if (y < 4) interp = mix(cyan, blue, fract(y));
	else interp = blue;
	frontColor = vec4(interp, 1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}



