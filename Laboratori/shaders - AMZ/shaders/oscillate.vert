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

const float PI = 3.141592;
uniform float time;


void main()
{
	float period = 2 * PI * time;

	float y = vertex.y;
    float r = distance(boundingBoxMin, boundingBoxMax) / 2.0;
    vec3 N = normal * (r / 10) * y * sin(time);

    frontColor = vec4(color,1.0);
	mat4 T = mat4(  
                    vec4(1, 0, 0, 0),
                    vec4(0, 1, 0, 0),
                    vec4(0, 0, 1, 0),
                    vec4(N.x, N.y, N.z, 1)
                 );

    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * T * vec4(vertex, 1.0);
}
