#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin; 
uniform vec3 boundingBoxMax;

const vec3 red = vec3(1, 0, 0);
const vec3 yellow = vec3(1, 1, 0);
const vec3 green = vec3(0, 1, 0);
const vec3 cyan = vec3(0, 1, 1);
const vec3 blue = vec3(0, 0, 1);



void main()
{
	float y = vertex.y;
    float yMin = boundingBoxMin.y;
    float yMax = boundingBoxMax.y;
    y = 4*(y - yMin) / abs(yMax - yMin);



    vec3 inter;
    if (y < 1) inter = mix(red, yellow, fract(y));
    else if (y < 2) inter = mix(yellow, green, fract(y));
    else if (y < 3) inter = mix(green, cyan, fract(y));
    else if (y < 4) inter = mix(cyan, blue, fract(y));
    else inter = blue;

    frontColor = vec4(inter, 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
