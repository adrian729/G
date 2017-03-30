#version 330 core

in float nF;
in vec3 fcolor;

out vec4 fragColor;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
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

void main()
{
    fragColor = vec4(fcolor,1.0) * nF;
}
