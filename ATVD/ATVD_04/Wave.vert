#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float PI = 3.141592;
uniform float amp = 0.5;
uniform float freq = 0.25;
uniform float time;


void main()
{
    vec3 N = normalize(normalMatrix * normal);  // eye space
    frontColor = vec4(color,1.0) * N.z;
    
    float theta = amp * sin(2*PI*time*freq + vertex.y);
    mat3 Rx = mat3(vec3(1,0,0),
                   vec3(0,cos(theta),-sin(theta)),
                   vec3(0,sin(theta),cos(theta)));
    
    vec3 V = Rx * vertex;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
