// Batch 005. Source: minecraftpe/impl/rendering/model/ChickenModel.cpp
U0 ChickenModel_render(ChickenModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 glLightModelf ( GL_LIGHT_MODEL_TWO_SIDE , 1.0 ) ;
 if ( self -> field_14 ) {
 glPushMatrix ( ) ;
 glTranslatef ( 0.0 , a8 * 5.0 , a8 + a8 ) ;
 ModelPart_render ( & self -> headModel , a8 ) ;
 ModelPart_render ( & self -> beakModel , a8 ) ;
 ModelPart_render ( & self -> redThingModel , a8 ) ;
 glPopMatrix ( ) ;
 glPushMatrix ( ) ;
 glScalef ( 0.5 , 0.5 , 0.5 ) ;
 glTranslatef ( 0.0 , a8 * 24.0 , 0.0 ) ;
 ModelPart_render ( & self -> bodyModel , a8 ) ;
 ModelPart_render ( & self -> leg1Model , a8 ) ;
 ModelPart_render ( & self -> leg2Model , a8 ) ;
 ModelPart_render ( & self -> wing1Model , a8 ) ;
 ModelPart_render ( & self -> wing2Model , a8 ) ;
 glPopMatrix ( ) ;
 
}
 else {
 ModelPart_render ( & self -> headModel , a8 ) ;
 ModelPart_render ( & self -> beakModel , a8 ) ;
 ModelPart_render ( & self -> redThingModel , a8 ) ;
 ModelPart_render ( & self -> bodyModel , a8 ) ;
 ModelPart_render ( & self -> leg1Model , a8 ) ;
 ModelPart_render ( & self -> leg2Model , a8 ) ;
 ModelPart_render ( & self -> wing1Model , a8 ) ;
 ModelPart_render ( & self -> wing2Model , a8 ) ;
 
}
 glLightModelf ( GL_LIGHT_MODEL_TWO_SIDE , 0.0 ) ;
}
U0 ChickenModel_setupAnim(ChickenModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
F32 v7 = a5 / ( 180.0 / 3.1416 ) ;
 F32 v8 = - ( a6 / ( 180.0 / 3.1416 ) ) ;
 self -> headModel. yRotAngle = v7 ;
 self -> beakModel. yRotAngle = v7 ;
 self -> headModel. xRotAngle = v8 ;
 self -> beakModel. xRotAngle = v8 ;
 self -> redThingModel. xRotAngle = v8 ;
 self -> redThingModel. yRotAngle = v7 ;
 self -> bodyModel. xRotAngle = 90.0 / ( 180.0 / 3.1416 ) ;
 F32 v9 = Mth_cos ( a2 * 0.6662 ) * 1.4 ;
 self -> wing1Model. zRotAngle = a4 ;
 F32 v10 = v9 * a3 ;
 self -> leg1Model. xRotAngle = v10 ;
 self -> wing2Model. zRotAngle = - a4 ;
 self -> leg2Model. xRotAngle = - v10 ;
}
U0 ChickenModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {ChickenModel_render(base(ChickenModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 ChickenModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {ChickenModel_setupAnim(base(ChickenModel*),a2,a3,a4,a5,a6,a7);}
U0 ChickenModel_Init(ChickenModel *self) {Model_Init(self);ModelPart_Init(&self->headModel,0, 0, 64, 32);ModelPart_Init(&self->field_98,0, 0, 64, 32);ModelPart_Init(&self->bodyModel,0, 9, 64, 32);ModelPart_Init(&self->leg1Model,26, 0, 64, 32);ModelPart_Init(&self->leg2Model,26, 0, 64, 32);ModelPart_Init(&self->wing1Model,24, 13, 64, 32);ModelPart_Init(&self->wing2Model,24, 13, 64, 32);ModelPart_Init(&self->beakModel,14, 0, 64, 32);ModelPart_Init(&self->redThingModel,14, 4, 64, 32);self->renderFn=&ChickenModel__renderFn;self->animFn=&ChickenModel__animFn;ModelPart_setModel ( & self -> headModel , self ) ;
 ModelPart_setModel ( & self -> beakModel , self ) ;
 ModelPart_setModel ( & self -> redThingModel , self ) ;
 ModelPart_setModel ( & self -> bodyModel , self ) ;
 ModelPart_setModel ( & self -> leg1Model , self ) ;
 ModelPart_setModel ( & self -> leg2Model , self ) ;
 ModelPart_setModel ( & self -> wing1Model , self ) ;
 ModelPart_setModel ( & self -> wing2Model , self ) ;
 ModelPart_addBox ( & self -> headModel , - 2.0 , - 6.0 , - 2.0 , 4 , 6 , 3 , 0.0 ) ;
 ModelPart_setPos ( & self -> headModel , 0.0 , 15.0 , - 4.0 ) ;
 ModelPart_addBox ( & self -> beakModel , - 2.0 , - 4.0 , - 4.0 , 4 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> beakModel , 0.0 , 15.0 , - 4.0 ) ;
 ModelPart_addBox ( & self -> redThingModel , - 1.0 , - 2.0 , - 3.0 , 2 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> redThingModel , 0.0 , 15.0 , - 4.0 ) ;
 ModelPart_addBox ( & self -> bodyModel , - 3.0 , - 4.0 , - 3.0 , 6 , 8 , 6 , 0.0 ) ;
 ModelPart_setPos ( & self -> bodyModel , 0.0 , 16.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> leg1Model , - 1.0 , 0.0 , - 3.0 , 3 , 5 , 3 ) ;
 ModelPart_setPos ( & self -> leg1Model , - 2.0 , 19.0 , 1.0 ) ;
 ModelPart_addBox ( & self -> leg2Model , - 1.0 , 0.0 , - 3.0 , 3 , 5 , 3 ) ;
 ModelPart_setPos ( & self -> leg2Model , 1.0 , 19.0 , 1.0 ) ;
 ModelPart_addBox ( & self -> wing1Model , 0.0 , 0.0 , - 3.0 , 1 , 4 , 6 ) ;
 ModelPart_setPos ( & self -> wing1Model , - 4.0 , 13.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> wing2Model , - 1.0 , 0.0 , - 3.0 , 1 , 4 , 6 ) ;
 ModelPart_setPos ( & self -> wing2Model , 4.0 , 13.0 , 0.0 ) ;
 self -> leg1Model. noFaceCull = 1 ;
 self -> leg2Model. noFaceCull = 1 ;
}
U0 ChickenModel_Destroy(ChickenModel *self) {ModelPart_Destroy(&self->headModel);ModelPart_Destroy(&self->field_98);ModelPart_Destroy(&self->bodyModel);ModelPart_Destroy(&self->leg1Model);ModelPart_Destroy(&self->leg2Model);ModelPart_Destroy(&self->wing1Model);ModelPart_Destroy(&self->wing2Model);ModelPart_Destroy(&self->beakModel);ModelPart_Destroy(&self->redThingModel);Model_Destroy(self);}

