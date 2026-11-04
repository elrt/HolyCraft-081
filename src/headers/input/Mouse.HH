// Batch 002. Source: minecraftpe/headers/input/Mouse.hpp
#ifndef MCPE_HEADERS_INPUT_MOUSE_HPP
#define MCPE_HEADERS_INPUT_MOUSE_HPP
class MouseAction { I16 field_0,field_2,field_4,field_6; I8 evButton,state,field_A; };
U0 MouseAction_InitDelta(MouseAction *self,I8 button,I8 state,I16 x,I16 y,I16 dx,I16 dy,I8 pointer) {
 self->field_0=x; self->field_2=y; self->field_4=dx; self->field_6=dy; self->evButton=button; self->state=state; self->field_A=pointer;
}
U0 MouseAction_Init(MouseAction *self,I8 button,I8 state,I16 x,I16 y,I8 pointer) { MouseAction_InitDelta(self,button,state,x,y,0,0,pointer); }
Bool MouseAction_isButton(MouseAction *self) { return (self->evButton(U8)(U32)-1)(U32)<=1; }
class MouseDevice {
 I32 eventId; I16 mouseX,mouseY,hasDX,hasDY,prevMouseX,prevMouseY;
 U8 buttonStates[4]; I8 field_12,field_13; MCVector mouseEvents; I32 firstMovement;
};
U0 MouseDevice_Init(MouseDevice *self);
U0 MouseDevice_Destroy(MouseDevice *self);
U0 MouseDevice_reset(MouseDevice *self);
U8 MouseDevice_getButtonState(MouseDevice *self,I32 button);
Bool MouseDevice_isButtonDown(MouseDevice *self,I32 button);
Bool MouseDevice_wasFirstMovement(MouseDevice *self);
I16 MouseDevice_getX(MouseDevice *self); I16 MouseDevice_getY(MouseDevice *self);
I16 MouseDevice_getDX(MouseDevice *self); I16 MouseDevice_getDY(MouseDevice *self);
U0 MouseDevice_reset2(MouseDevice *self); Bool MouseDevice_next(MouseDevice *self); U0 MouseDevice_rewind(MouseDevice *self);
Bool MouseDevice_getEventButtonState(MouseDevice *self); I32 MouseDevice_getEventButton(MouseDevice *self);
MouseAction *MouseDevice_getEvent(MouseDevice *self);
U0 MouseDevice_feedDelta(MouseDevice *self,I8 button,I8 state,I16 x,I16 y,I16 dx,I16 dy);
U0 MouseDevice_feed(MouseDevice *self,I8 button,I8 state,I16 x,I16 y) { MouseDevice_feedDelta(self,button,state,x,y,0,0); }
U0 Mouse_reset();
U8 Mouse_getButtonState(I32 button);
Bool Mouse_isButtonDown(I32 button);
I16 Mouse_getX();
I16 Mouse_getY();
I16 Mouse_getDX();
I16 Mouse_getDY();
U0 Mouse_reset2();
Bool Mouse_next();
U0 Mouse_rewind();
Bool Mouse_getEventButtonState();
I32 Mouse_getEventButton();
MouseAction* Mouse_getEvent();
U0 Mouse_feedDelta(I8 button,I8 state,I16 x,I16 y,I16 dx,I16 dy);
U0 Mouse_feed(I8 button,I8 state,I16 x,I16 y);

#endif

