#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;


uniform mat4 modelViewProjectionMatrix;

uniform float time;

void main()
{
    
    frontColor = vec4(color,1.0);
    
    float A = (vertex.y-0.5)*sin(time);
    
    mat3 Rx = mat3(vec3(1,0,0),
                   vec3(0,cos(A),-sin(A)),
                   vec3(0,sin(A),cos(A)));
    
    
    
    vec3 V = vertex + vec3(0,-1,0);     // TRANSLAÇAO
    
    if (vertex.y > 0.5) { V = Rx * V; } // ROTAÇAO
    
    V = V + vec3(0,1,0);                // TRANSLAÇAO
    
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}

