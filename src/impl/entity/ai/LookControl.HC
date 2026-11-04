// Batch 008: minecraftpe/impl/entity/ai/LookControl.cpp
U0 LookControl_Init(LookControl *self,MCAIActor008 *a) { memset(self,0,sizeof(LookControl));self->controlledEntity=a; }
U0 LookControl_setLookAtEntity(LookControl *self,MCAILookTarget008 *target,F32 ys,F32 ps) { self->lookX=target->posX;if(target->isMob)self->lookY=target->posY+target->headHeight;else self->lookY=(target->minY+target->maxY)*0.5;self->lookZ=target->posZ;self->yawRotationSpeed=ys;self->pitchRotationSpeed=ps;self->isLooking=TRUE; }
U0 LookControl_setLookAt(LookControl *self,F32 x,F32 y,F32 z,F32 ys,F32 ps) { self->lookX=x;self->lookY=y;self->lookZ=z;self->yawRotationSpeed=ys;self->pitchRotationSpeed=ps;self->isLooking=TRUE; }
U0 LookControl_tick(LookControl *self) { MCAIActor008 *a=self->controlledEntity;a->pitch=0.0;F32 targetYaw,speed;
 if(self->isLooking) { self->isLooking=FALSE;F32 dx=self->lookX-a->posX,dz=self->lookZ-a->posZ;F32 dist=sqrtf(dx*dx+dz*dz);F32 ysum=a->posY+a->headHeight,ydiff=self->lookY-ysum;F64 h=atan2f(dz,dx),v=atan2f(ydiff,dist);F32 pitch=v*180.0/3.1416;a->pitch=Mth_clampRotate(a->pitch,-pitch,self->pitchRotationSpeed);F32 y=h*180.0/3.1416;targetYaw=y-90.0;speed=self->yawRotationSpeed; }
 else {targetYaw=a->bodyYaw;speed=10.0;}
 a->headYaw=Mth_clampRotate(a->headYaw,targetYaw,speed);F32 delta=a->headYaw-a->bodyYaw;while(delta< -180.0)delta+=360.0;while(delta>=180.0)delta-=360.0;
 if(!a->navigationDone) {if(delta< -75.0)a->headYaw=a->bodyYaw-75.0;if(delta>75.0)a->headYaw=a->bodyYaw+75.0;}
}
