#version 330 core

in vec4 frontColor;
in vec3 N, P;
out vec4 fragColor;

uniform mat4 modelViewMatrix;
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
    vec3 Nfs = normalize(normalMatrix * N);
    vec3 Pfs = (modelViewMatrix * vec4(P, 1.0)).xyz;
    vec3 V = -Pfs;
    vec3 L = lightPosition.xyz - Pfs;

    fragColor = light(Nfs, V, L);
}
