#version 330

uniform mat4 projection_xform;
uniform mat4 view_xform;
uniform mat4 model_xform;

in vec3 vertex_position;

void main(void)
{
    gl_Position = (projection_xform * view_xform* model_xform) * vec4(vertex_position, 1.0);
}
