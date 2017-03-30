#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

const vec4 GREY = vec4(vec3(0.8), 1);
const vec4 BLACK = vec4(vec3(0), 1);

uniform float n = 8;

void main() {
  int x = int(mod(n * vtexCoord.x, 2));
  int y = int(mod(n * vtexCoord.y, 2));
  if (x == y) fragColor = GREY;
  else fragColor = BLACK;
}