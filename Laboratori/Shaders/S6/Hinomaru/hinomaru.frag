#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

const vec4 RED = vec4(vec3(1.,0.,0.), 1);
const vec4 WHITE = vec4(1.);
const vec4 BLACK = vec4(vec3(0.), 1);


uniform vec2 C = vec2(0.5);

void main() {
  // canvi espai (centre al 0.5 0.5)
  float sP = vtexCoord.s - C.x;
  float tP = vtexCoord.t - C.y;
  float d = sqrt(abs(sP) + abs(tP)); // sqrt(pow(sP, 2.) + pow(tP, 2.));

  if(d <= 0.2) fragColor = RED;
  else fragColor = BLACK;
}