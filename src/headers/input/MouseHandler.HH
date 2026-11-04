// Batch 002. Source: minecraftpe/headers/input/MouseHandler.hpp
#ifndef MCPE_HEADERS_INPUT_MOUSEHANDLER_HPP
#define MCPE_HEADERS_INPUT_MOUSEHANDLER_HPP
class MouseHandler { F32 field_0,field_4; I32 field_8; ITurnInput *turnInput; };
U0 MouseHandler_Init(MouseHandler *self,ITurnInput *turn=NULL);
U0 MouseHandler_Destroy(MouseHandler *self);
U0 MouseHandler_setTurnInput(MouseHandler *self,ITurnInput *turn);
U0 MouseHandler_grab(MouseHandler *self); U0 MouseHandler_release(MouseHandler *self); U0 MouseHandler_poll(MouseHandler *self);

#endif

