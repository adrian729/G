#version 330 core

in vec4 frontColor;
out vec4 fragColor;


void main()
{   
    float fx = dFdx(fragColor);
    float fy = dFdy(fragColor);
    vec4 color = frontColor;
    color.x *= fx;
    color.y *= fy;
    fragColor = color;
}

