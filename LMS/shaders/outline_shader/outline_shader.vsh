//
// Simple passthrough vertex shader
//
attribute vec2 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 v_TexCoord;

void main()
{
    gl_Position = vec4(in_Position.x, in_Position.y, 0.0, 1.0);
    v_TexCoord = in_TextureCoord;
}