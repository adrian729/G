#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

uniform mat3 normalMatrix;

uniform vec4 lightAmbient; 
uniform vec4 lightDiffuse; 
uniform vec4 lightSpecular; 
uniform vec4 lightPosition;

uniform vec4 matAmbient; 
uniform vec4 matDiffuse; 
uniform vec4 matSpecular; 
uniform float matShininess;
 

vec4 light(vec3 N, vec3 L, vec3 V) {
	N = normalize(N);
	L = normalize(L);
	V = normalize(V);

	vec3 H = normalize(V + L);

	vec4 ambient = matAmbient * lightAmbient;
	vec4 diffuse = matDiffuse * lightDiffuse * max(0.0, dot(N, L));
	vec4 specular = matSpecular * lightSpecular * pow(max(0.0, dot(N, H)), matShininess);

	return ambient + diffuse + specular;
}

void main()
{
    // normalMatrix = transpose(inverse(modelViewMatrix))
    vec3 nEye = normalMatrix * normal;

    // V és el vector del vèrtex cap a la càmera, aquí valor per defecte de OpenGL
    vec3 v = vec3(0.0, 0.0, 1.0);

    // Peye és la posició del vèrtex. Com esta en object space, el pasem a eye space
    vec3 pvEye = (modelViewMatrix * vec4(vertex, 1.0)).xyz;

    // L és el vector del vèrtex cap a la font de llum
    vec3 lEye = lightPosition.xyz - pvEye;

    frontColor = light(nEye, lEye, v);

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
