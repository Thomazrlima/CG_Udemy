#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;


void main()
{
    float ruido = texture(noise0,vtexCoord).r;
    vec4 pedra = texture(rock1,vtexCoord);
    vec4 grama = texture(grass2,vtexCoord);
    
    fragColor = mix(pedra,grama,ruido);
    
}



        
