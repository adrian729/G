#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

const vec4 RED = vec4(1, 0, 0, 1);

uniform float n = 8;

void main() {
  float x = fract(vtexCoord.x * n);
  float y = fract(vtexCoord.y * n);
  if (x > 0.1 && y > 0.1) discard;
  else fragColor = RED;
}