// Batch 002. Source: minecraftpe/impl/input/Mouse.cpp
MouseDevice Mouse_instance;
U0 MouseDevice_Init(MouseDevice *self) {
 self->hasDX=-9999; self->hasDY=-9999; self->eventId=-1; self->mouseX=0; self->mouseY=0;
 self->prevMouseX=0; self->prevMouseY=0; self->firstMovement=0; MemSet(self->buttonStates,0,4); self->field_12=0; self->field_13=0;
 MCVector_Init(&self->mouseEvents,sizeof(MouseAction));
}
U0 MouseDevice_Destroy(MouseDevice *self) { MCVector_Destroy(&self->mouseEvents); }
U0 MouseDevice_reset(MouseDevice *self) { self->eventId=-1; self->mouseEvents.size=0; self->field_13=0; }
U8 MouseDevice_getButtonState(MouseDevice *self,I32 button) { if(button<1 || button>3) return 0; return self->buttonStates[button]; }
Bool MouseDevice_isButtonDown(MouseDevice *self,I32 button) { return MouseDevice_getButtonState(self,button)!=0; }
Bool MouseDevice_wasFirstMovement(MouseDevice *self) { return self->firstMovement==1; }
I16 MouseDevice_getX(MouseDevice *self) { return self->mouseX; }
I16 MouseDevice_getY(MouseDevice *self) { return self->mouseY; }
I16 MouseDevice_getDX(MouseDevice *self) { if(self->hasDX==-9999) return self->mouseX-self->prevMouseX; return self->hasDX; }
I16 MouseDevice_getDY(MouseDevice *self) { if(self->hasDY==-9999) return self->mouseY-self->prevMouseY; return self->hasDY; }
U0 MouseDevice_reset2(MouseDevice *self) { self->prevMouseX=self->mouseX; self->prevMouseY=self->mouseY; self->hasDX=-9999; self->hasDY=-9999; }
Bool MouseDevice_next(MouseDevice *self) { I32 next=self->eventId+1; if(next>=self->mouseEvents.size) return FALSE; self->eventId=next; return TRUE; }
U0 MouseDevice_rewind(MouseDevice *self) { self->eventId=-1; }
MouseAction *MouseDevice_getEvent(MouseDevice *self) { if(self->eventId<0 || self->eventId>=self->mouseEvents.size) return NULL; return MCVector_At(&self->mouseEvents,self->eventId); }
Bool MouseDevice_getEventButtonState(MouseDevice *self) { MouseAction *event=MouseDevice_getEvent(self); return event && event->state==1; }
I32 MouseDevice_getEventButton(MouseDevice *self) { MouseAction *event=MouseDevice_getEvent(self); if(event) return event->evButton; return 0; }
U0 MouseDevice_feedDelta(MouseDevice *self,I8 button,I8 state,I16 x,I16 y,I16 dx,I16 dy) {
 MouseAction event; MouseAction_InitDelta(&event,button,state,x,y,dx,dy,0); MCVector_Push(&self->mouseEvents,&event);
 if(button==0) {
  if(self->hasDX==-9999) self->hasDX=0; if(self->hasDY==-9999) self->hasDY=0;
  self->hasDX+=dx; self->hasDY+=dy; self->firstMovement=self->firstMovement==-1;
 } else {
  if(button>0 && button<=3) self->buttonStates[button]=state;
  if(button==1) self->firstMovement=-1;
 }
 self->prevMouseX=self->mouseX; self->mouseX=x; self->prevMouseY=self->mouseY; self->mouseY=y;
}
U0 Mouse_reset() { MouseDevice_reset(&Mouse_instance); }
U8 Mouse_getButtonState(I32 button) { return MouseDevice_getButtonState(&Mouse_instance,button); }
Bool Mouse_isButtonDown(I32 button) { return MouseDevice_isButtonDown(&Mouse_instance,button); }
I16 Mouse_getX() { return MouseDevice_getX(&Mouse_instance); }
I16 Mouse_getY() { return MouseDevice_getY(&Mouse_instance); }
I16 Mouse_getDX() { return MouseDevice_getDX(&Mouse_instance); }
I16 Mouse_getDY() { return MouseDevice_getDY(&Mouse_instance); }
U0 Mouse_reset2() { MouseDevice_reset2(&Mouse_instance); }
Bool Mouse_next() { return MouseDevice_next(&Mouse_instance); }
U0 Mouse_rewind() { MouseDevice_rewind(&Mouse_instance); }
Bool Mouse_getEventButtonState() { return MouseDevice_getEventButtonState(&Mouse_instance); }
I32 Mouse_getEventButton() { return MouseDevice_getEventButton(&Mouse_instance); }
MouseAction* Mouse_getEvent() { return MouseDevice_getEvent(&Mouse_instance); }
U0 Mouse_feedDelta(I8 button,I8 state,I16 x,I16 y,I16 dx,I16 dy) { MouseDevice_feedDelta(&Mouse_instance,button,state,x,y,dx,dy); }
U0 Mouse_feed(I8 button,I8 state,I16 x,I16 y) { Mouse_feedDelta(button,state,x,y,0,0); }

