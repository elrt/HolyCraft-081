// Batch 008: minecraftpe/impl/entity/ai/BodyControl.cpp
U0 BodyControl_Init(BodyControl *self,MCAIActor008 *a) { self->controlledEntity=a;self->field_4=0;self->field_8=0.0; }
U0 BodyControl_clientTick(BodyControl *self) { MCAIActor008 *a=self->controlledEntity;F32 dx=a->posX-a->prevX,dz=a->posZ-a->prevZ;F32 dist=dz*dz+dx*dx;
 if(dist<=MoveControl_MIN_SPEED_SQR) { F32 max=75.0;if(fabsf(a->headYaw-self->field_8)<=15.0) { I32 old=self->field_4;self->field_4=old+1;if(old+1>10) { F32 factor=1.0-(old-9)/10.0;if(factor<0.0)factor=0.0;max=factor*75.0; } }else {self->field_4=0;self->field_8=a->headYaw;}
 F32 diff=Mth_wrapDegrees(a->headYaw-a->bodyYaw),v= -max;if(diff>= -max)v=diff;if(v<max)max=v;a->bodyYaw=a->headYaw-max;a->yaw=a->bodyYaw;
 }else { F32 body=a->bodyYaw,diff=Mth_wrapDegrees(a->yaw-body);if(diff>10.0)diff=10.0;else if(diff< -10.0)diff= -10.0;a->bodyYaw=body+diff;body=a->bodyYaw;diff=Mth_wrapDegrees(body-a->headYaw);if(diff< -75.0)diff= -75.0;else if(diff>=75.0)diff=75.0;a->headYaw=body-diff;self->field_8=a->headYaw;self->field_4=0; }
}
