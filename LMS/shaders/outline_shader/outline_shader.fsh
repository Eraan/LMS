//
// Simple passthrough fragment shader
//
uniform vec4 outline_color;  // Color of the outline (e.g., c_white)
uniform float outline_thickness;  // Thickness of the outline

varying vec2 v_TexCoord;

void main()
{
    vec4 color = texture2D(gm_BaseTexture, v_TexCoord);
    
    if (color.a < 0.5) {
        // This is the outline part, just give it the outline color
        gl_FragColor = outline_color;
    } else {
        // Else, render the sprite as is
        gl_FragColor = color;
    }
}
