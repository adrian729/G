#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix, modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;// eyeSpace

vec4 light(vec3 N, vec3 V, vec3 L) {

    N = normalize(N);
    V = normalize(V);
    L = normalize(L);

    vec3 R = normalize(2.0 * dot(N,L) * N - L);
    float NL = max(0.0, dot(N,L));
    float RV = max(0.0, dot(R, V));
    float RVs = 0;
    if(NL > 0) RVs = pow(RV, matShininess);

    return (matAmbient * lightAmbient
        + matDiffuse * lightDiffuse * NL
        + matSpecular * lightSpecular * RVs);
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 P = (modelViewMatrix * vec4(vertex, 1.0)).xyz;
    vec3 V = -P;
    vec3 L = lightPosition.xyz - P;

    frontColor = light(N, V, L);

    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}



