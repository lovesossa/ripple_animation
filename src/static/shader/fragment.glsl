uniform float time;
uniform float progress;
uniform sampler2D uTexture;
uniform sampler2D uDisplacement;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
float PI = 3.141592653589793238;
void main()	{
	vec4 displacement = texture2D(uDisplacement, vUv);
	float theta = displacement.r  * 2. * PI;
	vec2 direction = vec2(sin(theta), cos(theta));
	vec2 uV = vUv + direction * displacement.r * 0.05;  // distortion
	vec4 color = texture2D(uTexture, uV);
	gl_FragColor = color;
	// gl_FragColor = displacement;
}