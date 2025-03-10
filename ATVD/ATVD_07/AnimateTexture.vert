#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;   // object space
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float speed = 0.1;
uniform float time;

void main()
{
    frontColor = vec4(normalize(normalMatrix*normal).z);
    // Horizontal coordenada S
    
    vtexCoord = texCoord + speed * time;
   
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}



