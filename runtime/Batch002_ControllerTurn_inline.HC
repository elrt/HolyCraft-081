U0 ControllerTurnInput_getTurnDelta(ITurnInput *base,Vec3 *out) {
 ControllerTurnInput *self=base;
#ifdef MCPE_PC_MOUSE
 Vec3_Init(out,Mouse_getDX()*0.3,Mouse_getDY()*0.3,0); return;
#else
 Bool touched=Controller_isTouched(self->field_14); F32 dt,x,y,dx=0,dy=0;
 if(self->field_10==1) {
  dt=ITurnInput_getDeltaTime(self);
  if(touched) { x=Controller_getX(self->field_14); y=Controller_getY(self->field_14); }
  else { x=self->field_18*0.7; y=self->field_1C*0.7; }
  dx=ITurnInput_linearTransform(x,0.1,250,FALSE)*dt;
  dy=ITurnInput_linearTransform(y,0.1,200,FALSE)*dt; self->field_18=x; self->field_1C=y;
 } else if(self->field_10==2 && (self->field_20 || touched)) {
  x=Controller_getX(self->field_14); y=Controller_getY(self->field_14);
  if(!self->field_20) { self->field_18=x; self->field_1C=y; }
  if(touched) { dx=ITurnInput_linearTransform(x-self->field_18,0,1,FALSE)*100; dy=ITurnInput_linearTransform(y-self->field_1C,0,1,FALSE)*100; self->field_18=x; self->field_1C=y; }
 }
 self->field_20=touched; Vec3_Init(out,dx,-dy,0);
#endif
}
