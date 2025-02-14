#version 330 core


uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform sampler2D noise;

in vec3 V;
in vec3 N;

out vec4 fragColor;

const vec4 WHITE = vec4(1);
const vec4 REDISH = vec4(0.5,0.2,0.2,1);

const vec4 SPLANE = 0.3 * vec4(0,1,-1,0);
const vec4 TPLANE = 0.3 * vec4(-2,-1,1,0);


vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) {
 vec3 lightPos = vec3(0.0,0.0,2.0);
 vec3 L = normalize( lightPos - Pos );
 vec3 V = normalize( -Pos);
 vec3 R = reflect(-L,N);
 float NdotL = max( 0.0, dot( N,L ) );
 float RdotV = max( 0.0, dot( R,V ) );
 float Ispec = pow( RdotV, 20.0 );
 return diffuse * NdotL + Ispec;
}

void main()
{
    
    vec4 vcoords = vec4(V,1);
    
    // Calcular coordenadas de textura
    
    float s = dot(vcoords,SPLANE);
    float t = dot(vcoords,TPLANE);
    
    vec2 texCoord = vec2(s,t);
    
    // Calcular diffuse (gradiente)
    
    float v = 2*texture(noise,texCoord).r;
    vec4 diffuse = WHITE;
    if (v < 1) diffuse = mix(WHITE,REDISH,fract(v));
    else if (v < 2) diffuse = mix(REDISH,WHITE,fract(v));
    
    vec3 N_eyeSpace = normalMatrix * N;
    vec3 V_eyeSpace = (modelViewMatrix * vcoords).xyz;
    
    fragColor = shading(N_eyeSpace,V_eyeSpace,diffuse);
 
}












