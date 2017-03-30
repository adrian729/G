#version 330 core

uniform vec4 lightAmbient; 
uniform vec4 lightDiffuse; 
uniform vec4 lightSpecular; 
uniform vec4 lightPosition;

uniform vec4 matAmbient; 
uniform vec4 matDiffuse;  
uniform vec4 matSpecular; 
uniform float matShininess;


in vec3 fN;
in vec3 fP; 

out vec4 fragColor;

vec4 light(vec3 N, vec3 L, vec3 V) {
	N = normalize(N);
	L = normalize(L);
	V = normalize(V); 

	vec3 R = normalize(2 * dot(N, L)* N - L);

	vec4 ambient = matAmbient * lightAmbient;
	vec4 diffuse = matDiffuse * lightDiffuse * max(0.0, dot(N, L));
	vec4 specular = matSpecular * lightSpecular * pow(max(0.0, dot(R, V)), matShininess);

	return ambient + diffuse + specular;
}

void main()
{
	vec3 fV = - fP;
	vec3 fL = normalize(lightPosition.xyz - fP);
    fragColor = light(fN, fL, fV);
}
