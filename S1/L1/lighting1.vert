#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 lightAmbient;//Ia
uniform vec4 lightDiffuse;//Id
uniform vec4 lightSpecular;//Is
uniform vec4 lightPosition;//posicio focus (eye space)

uniform vec4 matAmbient;//Ka
uniform vec4 matDiffuse;//Kd
uniform vec4 matSpecular;//Ks
uniform float matShininess;//s

void main()
{
    
    vec3 P = (modelViewMatrix*vec4(vertex,1.0)).xyz;
    
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize(lightPosition.xyz - P);
    vec3 H = normalize(vec3(0,0,1) + L);//calculat com diu als pdf per aquest exercici

    float NL = max(0.0,dot(N,L));
    float NHS = pow(max(0.0,dot(N,H)),matShininess);

    vec4 result = matAmbient*lightAmbient
                + matDiffuse*lightDiffuse*NL
                + matSpecular*lightSpecular*NHS;

    frontColor = result;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
