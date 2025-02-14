#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;


out vec3 V;     // posiçao em object space
out vec3 N;     // normal em object space

uniform mat4 modelViewProjectionMatrix;

void main()
{
   
    V = vertex;
    N = normal;

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
