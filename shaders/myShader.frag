#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform float time;
uniform vec2 mousePosition;

void main()
{
    fragColor = frontColor;
    float d = distance(gl_FragCoord.xy, mousePosition);
    //if(d > 60)
        //fragColor.rgb = vec3(0,0,0);
}
