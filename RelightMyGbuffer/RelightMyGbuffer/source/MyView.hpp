#pragma once

#include <tygra/WindowViewDelegate.hpp>
#include <tgl/tgl.h>
#include <glm/glm.hpp>

class MyView : public tygra::WindowViewDelegate
{
public:

    MyView();

    ~MyView();

private:

    void windowViewWillStart(tygra::Window * window) override;

    void windowViewDidReset(tygra::Window * window,
                            int width,
                            int height) override;

    void windowViewDidStop(tygra::Window * window) override;

    void windowViewRender(tygra::Window * window) override;

    GLuint global_light_prog_{ 0 };
    GLuint point_light_prog_{ 0 };

    struct Mesh
    {
        GLuint vertex_vbo{ 0 };
        GLuint element_vbo{ 0 };
        GLuint vao{ 0 };
        int element_count{ 0 };
    };

    Mesh light_quad_mesh_; // vertex array of vec2 position
    Mesh light_sphere_mesh_; // element array into vec3 position

    GLuint gbuffer_position_tex_{ 0 };
    GLuint gbuffer_normal_tex_{ 0 };
    GLuint gbuffer_depth_tex_{ 0 };

    GLuint lbuffer_fbo_{ 0 };
    GLuint lbuffer_colour_rbo_{ 0 };

    /*
    * Tutorial: All of the resources you'll need are already defined.
    *           You should not need to add further member variables.
    */

};
