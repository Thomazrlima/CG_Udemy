#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;

uniform float speed = 0.5;
uniform float time;


void main()
{
    
    
    float o = speed*time;
    
    mat3 Ry = mat3(vec3(cos(o),0,-sin(o)),
                   vec3(0,1,0),
                   vec3(sin(o),0,cos(o)));
                
    frontColor = vec4(color,1.0);
    
    vec3 V = Ry * vertex;
    
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
