// Batch 008: minecraftpe/impl/entity/ai/MoveControl.cpp
U0 MoveControl_Init(MoveControl *self,MCAIActor008 *a) { self->controlledEntity=a;self->posX=a->posX;self->posY=a->posY;self->posZ=a->posZ;self->speedMultiplier=0;self->hasWanted=FALSE; }
F32 MoveControl_getSpeed(MoveControl *self) { return self->speedMultiplier; } Bool MoveControl_hasWanted(MoveControl *self) { return self->hasWanted; }
U0 MoveControl_setWantedPosition(MoveControl *self,F32 x,F32 y,F32 z,F32 speed) { self->posX=x;self->posY=y;self->posZ=z;self->speedMultiplier=speed;self->hasWanted=TRUE; }
U0 MoveControl_tick(MoveControl *self) { MCAIActor008 *a=self->controlledEntity;a->speedUpdated=FALSE;a->yyaUpdated=TRUE;a->yya=0.0;if(!self->hasWanted)return;self->hasWanted=FALSE;
 F32 v3=a->minY+0.5;I32 floorY=v3(I32);if(v3<(floorY)(F32))floorY--;
 F32 dx=self->posX-a->posX,dy=self->posY-(floorY)(F32),dz=self->posZ-a->posZ;
 F32 d2=(dx*dx+dy*dy)+dz*dz;if(d2>=0.00000025) { F64 angle=atan2f(dz,dx);F32 yaw=a->yaw;F32 v12=angle*180.0/3.1416;F32 target=v12-90.0;F32 delta=target-yaw;F32 diff=fmodf(delta,360.0);
 if(diff>=180.0)diff-=360.0;if(diff< -180.0)diff+=360.0;if(diff>30.0)diff=30.0;else if(diff< -30.0)diff= -30.0;a->yaw=yaw+diff;a->speed=self->speedMultiplier*a->baseSpeed;a->speedUpdated=TRUE;
 if(dy>0.0 && dx*dx+dz*dz<1.0) { if(!a->jumpControl){printf("Missing jump control\n");exit(92);}JumpControl_jump((a->jumpControl)(JumpControl*)); }
 }
}
