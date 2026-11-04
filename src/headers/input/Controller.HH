// Batch 002. Source: minecraftpe/headers/input/Controller.hpp
#ifndef MCPE_HEADERS_INPUT_CONTROLLER_HPP
#define MCPE_HEADERS_INPUT_CONTROLLER_HPP
F32 Controller_linearTransform(F32 value,F32 deadzone,F32 scale,Bool clamp);
Bool Controller_isValidStick(I32 stick);
F32 Controller_getTransformedY(I32 stick,F32 deadzone,F32 scale,Bool clamp);
F32 Controller_getTransformedX(I32 stick,F32 deadzone,F32 scale,Bool clamp);
F32 Controller_getY(I32 stick); F32 Controller_getX(I32 stick);
U0 Controller_feed(I32 stick,I32 touched,F32 x,F32 y); Bool Controller_isTouched(I32 stick);

#endif

