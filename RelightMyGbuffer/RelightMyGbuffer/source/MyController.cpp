#include "MyController.hpp"
#include "MyView.hpp"

#include <tygra/Window.hpp>

#include <iostream>

MyController::MyController()
{
    view_ = new MyView();
}

MyController::~MyController()
{
    delete view_;
}

void MyController::windowControlWillStart(tygra::Window * window)
{
    window->setView(view_);
    window->setTitle("Real-Time Graphics :: Relight My Gbuffer");
}

void MyController::windowControlDidStop(tygra::Window * window)
{
    window->setView(nullptr);
}

void MyController::windowControlViewWillRender(tygra::Window * window)
{
}

void MyController::windowControlMouseMoved(tygra::Window * window,
                                           int x,
                                           int y)
{
}

void MyController::windowControlMouseButtonChanged(tygra::Window * window,
                                                   int button_index,
                                                   bool down)
{
}


void MyController::windowControlMouseWheelMoved(tygra::Window * window,
                                                int position)
{
}

void MyController::windowControlKeyboardChanged(tygra::Window * window,
                                                int key_index,
                                                bool down)
{
}

void MyController::windowControlGamepadAxisMoved(tygra::Window * window,
                                                 int gamepad_index,
                                                 int axis_index,
                                                 float pos)
{
}

void MyController::windowControlGamepadButtonChanged(tygra::Window * window,
                                                     int gamepad_index,
                                                     int button_index,
                                                     bool down)
{
}
