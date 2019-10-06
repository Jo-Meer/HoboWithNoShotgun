//
// Shade everything in a soft light shade.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 blendSoftLight(vec3 base, vec3 blend) {
    return mix(
        sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend),
        2.0 * base * blend + base * base * (1.0 - 2.0 * blend),
        step(base, vec3(0.5))
    );
}

void main()
{
    vec4 textureColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec3 myColor = vec3(0.356, 0.431, 0.882);
    vec3 newColor = blendSoftLight(textureColor.rgb, myColor);

    gl_FragColor = vec4(newColor, 1.0);
}
