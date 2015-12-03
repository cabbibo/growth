
uniform float time;
uniform vec3 lightPosition;
uniform mat4 iModelMat;
uniform sampler2D t_audio;

varying vec3 vPos;
varying vec3 vNorm;
varying vec2 vUv;
varying vec3 vLight;
varying vec3 vMPos;
varying float vLookup;

$simplex

void main(){

  vUv = uv;

  vPos = position;
  vLight = ( iModelMat * vec4( lightPosition , 1. ) ).xyz;

  vNorm =  normal;

  vLookup = 0.;//   .6 * snoise(  vPos * .05 + vec3( 0., 0. time * .01 ) ;

  float aVal = length( texture2D( t_audio , vec2( vLookup , 0. )));



  //vPos += vNorm * aVal * 6. * .00002 * pow( length( vPos.xy ) , 3.) ;
  //vLight = ( iModelMat * vec4(  vec3( 400. , 1000. , 400. ) , 1. ) ).xyz;


  // Use this position to get the final position 
  gl_Position = projectionMatrix * modelViewMatrix * vec4( vPos , 1.);

}