// Batch 005. Source: minecraftpe/impl/rendering/model/HumanoidModel.cpp
U0 HumanoidModel_render(HumanoidModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
if ( a2 && a2 -> isMob && a2 -> useItemDuration > 0 && a2 -> useAnimation == 4 ) self -> isUsingBow = 1 ;
 Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 ModelPart_render ( & self -> headModel , a8 ) ;
 ModelPart_render ( & self -> bodyModel , a8 ) ;
 ModelPart_render ( & self -> rightArmModel , a8 ) ;
 ModelPart_render ( & self -> leftArmModel , a8 ) ;
 ModelPart_render ( & self -> rightLegModel , a8 ) ;
 ModelPart_render ( & self -> leftLegModel , a8 ) ;
 self -> isUsingBow = 0 ;
}
U0 HumanoidModel_renderHorrible(HumanoidModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
Model_setupAnim ( self , a2 , a3 , a4 , a5 , a6 , a7 ) ;
 ModelPart_renderHorrible ( & self -> headModel , a7 ) ;
 ModelPart_renderHorrible ( & self -> bodyModel , a7 ) ;
 ModelPart_renderHorrible ( & self -> rightArmModel , a7 ) ;
 ModelPart_renderHorrible ( & self -> leftArmModel , a7 ) ;
 ModelPart_renderHorrible ( & self -> rightLegModel , a7 ) ;
 ModelPart_renderHorrible ( & self -> leftLegModel , a7 ) ;
}
U0 HumanoidModel_setupAnim(HumanoidModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
F32 v10 ;
 F32 v11 ;
 F32 v12 ;
 F32 v14 ;
 F32 v15 ;
 F32 v17 ;
 F32 v18 ;
 F32 v19 ;
 F32 v20 ;
 F32 v21 ;
 F32 v22 ;
 F32 v23 ;
 F32 v24 ;
 F32 v25 ;
 F32 v26 ;
 F32 v28 ;
 F32 yRotAngle ;
 F32 v30 ;
 self -> headModel. yRotAngle = a5 / ((180.0 / 3.1416))(F32) ;
 v10 = a2 * 0.6662 ;
 self -> headModel. xRotAngle = a6 / ((180.0 / 3.1416))(F32) ;
 v11 = Mth_cos ( a2 * 0.6662 ) * a3 ;
 v12 = Mth_cos ( v10 + 3.1416 ) ;
 self -> leftArmModel. xRotAngle = v11 ;
 self -> rightArmModel. zRotAngle = 0.0 ;
 self -> leftArmModel. zRotAngle = 0.0 ;
 self -> rightLegModel. yRotAngle = 0.0 ;
 self -> leftLegModel. yRotAngle = 0.0 ;
 self -> rightArmModel. xRotAngle = v12 * a3 ;
 self -> rightLegModel. xRotAngle = v11 * 1.4 ;
 self -> leftLegModel. xRotAngle = ((v12 * a3))(F32) * 1.4 ;
 if ( self -> field_4 ) {
 v14 = - ((3.1416 * 0.5))(F32) ;
 self -> rightArmModel. xRotAngle = ((v12 * a3))(F32) + ((v14 * 0.4))(F32) ;
 self -> rightLegModel. xRotAngle = v14 * 0.8 ;
 self -> leftLegModel. xRotAngle = v14 * 0.8 ;
 self -> rightLegModel. yRotAngle = ((3.1416 * 0.5))(F32) * 0.2 ;
 self -> leftLegModel. yRotAngle = v14 * 0.2 ;
 self -> leftArmModel. xRotAngle = v11 + ((v14 * 0.4))(F32) ;
 
}
 if ( self -> field_318 ) {
 self -> leftArmModel. xRotAngle = ((self -> leftArmModel. xRotAngle * 0.5))(F32) - ((((3.1416 * 0.5))(F32) * 0.2))(F32) ;
 
}
 if ( self -> field_319 ) {
 self -> rightArmModel. xRotAngle = ((self -> rightArmModel. xRotAngle * 0.5))(F32) - ((((3.1416 * 0.5))(F32) * 0.2))(F32) ;
 
}
 v15 = self -> field_0 ;
 self -> rightArmModel. yRotAngle = 0.0 ;
 self -> leftArmModel. yRotAngle = 0.0 ;
 if ( v15 > - 9990.0 ) {
 v17 = Mth_sin ( ((sqrt ( v15 ) * 3.1416))(F32) * 2 ) * 0.2 ;
 self -> bodyModel. yRotAngle = v17 ;
 self -> rightArmModel. zOffset = Mth_sin ( v17 ) * 5.0 ;
 self -> rightArmModel. xOffset = - ((Mth_cos ( v17 ) * 5.0))(F32) ;
 self -> leftArmModel. zOffset = - ((Mth_sin ( v17 ) * 5.0))(F32) ;
 v18 = Mth_cos ( v17 ) ;
 v19 = self -> field_0 ;
 self -> leftArmModel. yRotAngle = self -> leftArmModel. yRotAngle + v17 ;
 self -> leftArmModel. xRotAngle = self -> leftArmModel. xRotAngle + v17 ;
 self -> leftArmModel. xOffset = v18 * 5.0 ;
 v20 = v17 + self -> rightArmModel. yRotAngle ;
 self -> rightArmModel. yRotAngle = v20 ;
 v21 = Mth_sin ( ((1.0 - ((((((1.0 - v19))(F32) * ((1.0 - v19))(F32)))(F32) * ((((1.0 - v19))(F32) * ((1.0 - v19))(F32)))(F32)))(F32)))(F32) * 3.1416 ) ;
 v22 = Mth_sin ( v19 * 3.1416 ) ;
 v23 = self -> headModel. xRotAngle - 0.7 ;
 self -> rightArmModel. yRotAngle = v20 + ((v17 + v17))(F32) ;
 self -> rightArmModel. xRotAngle = self -> rightArmModel. xRotAngle - (((((-((v23 * v22))(F32))(F32) * 0.75))(F32) + ((v21 * 1.2))(F32)))(F32) ;
 self -> rightArmModel. zRotAngle = Mth_sin ( v19 * 3.1416 ) * - 0.4 ;
 
}
 if ( self -> field_31A ) {
 v24 = self -> rightArmModel. xRotAngle + 0.4 ;
 self -> bodyModel. xRotAngle = 0.5 ;
 self -> rightLegModel. zOffset = 4.0 ;
 self -> leftLegModel. zOffset = 4.0 ;
 self -> rightLegModel. yOffset = 9.0 ;
 self -> leftLegModel. yOffset = 9.0 ;
 self -> headModel. yOffset = 1.0 ;
 self -> rightArmModel. xRotAngle = v24 ;
 self -> leftArmModel. xRotAngle = self -> leftArmModel. xRotAngle + 0.4 ;
 
}
 else {
 self -> bodyModel. xRotAngle = 0.0 ;
 self -> rightLegModel. zOffset = 0.0 ;
 self -> leftLegModel. zOffset = 0.0 ;
 self -> headModel. yOffset = 0.0 ;
 self -> rightLegModel. yOffset = 12.0 ;
 self -> leftLegModel. yOffset = 12.0 ;
 
}
 v25 = ((Mth_cos ( a4 * 0.09 ) * 0.05))(F32) + 0.05 ;
 v26 = Mth_sin ( a4 * 0.067 ) ;
 self -> rightArmModel. zRotAngle = self -> rightArmModel. zRotAngle + v25 ;
 v28 = v26 * 0.05 ;
 self -> leftArmModel. zRotAngle = self -> leftArmModel. zRotAngle - v25 ;
 self -> rightArmModel. xRotAngle = self -> rightArmModel. xRotAngle + ((v26 * 0.05))(F32) ;
 self -> leftArmModel. xRotAngle = self -> leftArmModel. xRotAngle - ((v26 * 0.05))(F32) ;
 if ( self -> isUsingBow ) {
 yRotAngle = self -> headModel. yRotAngle ;
 self -> rightArmModel. yRotAngle = yRotAngle - 0.1 ;
 self -> leftArmModel. yRotAngle = ((yRotAngle + 0.1))(F32) + 0.4 ;
 v30 = self -> headModel. xRotAngle - ((3.1416 * 0.5))(F32) ;
 self -> rightArmModel. zRotAngle = v25 + 0.0 ;
 self -> leftArmModel. zRotAngle = 0.0 - v25 ;
 self -> rightArmModel. xRotAngle = v30 + v28 ;
 self -> leftArmModel. xRotAngle = v30 - v28 ;
 
}
}
U0 HumanoidModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {HumanoidModel_render(base(HumanoidModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 HumanoidModel__horribleFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {HumanoidModel_renderHorrible(base(HumanoidModel*),a2,a3,a4,a5,a6,a7);}
U0 HumanoidModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {HumanoidModel_setupAnim(base(HumanoidModel*),a2,a3,a4,a5,a6,a7);}
U0 HumanoidModel_Init(HumanoidModel *self,F32 a2 , F32 a3) {Model_Init(self);ModelPart_Init(&self->headModel,0, 0, 64, 32);ModelPart_Init(&self->bodyModel,16, 16, 64, 32);ModelPart_Init(&self->rightArmModel,40, 16, 64, 32);ModelPart_Init(&self->leftArmModel,40, 16, 64, 32);ModelPart_Init(&self->rightLegModel,0, 16, 64, 32);ModelPart_Init(&self->leftLegModel,0, 16, 64, 32);self->field_318=0;self->field_319=0;self->field_31A=0;self->isUsingBow=0;self->field_31C=0;self->renderFn=&HumanoidModel__renderFn;self->horribleFn=&HumanoidModel__horribleFn;self->animFn=&HumanoidModel__animFn;self -> field_0 = 0 ;
 self -> field_14 = 1 ;
 self -> field_4 = 0 ;
 self -> field_5 = 0 ;
 MC_modelPlatform. add ( self , 1.0 ) ;
 self -> field_318 = 0 ;
 self -> field_319 = 0 ;
 self -> field_31A = 0 ;
 self -> isUsingBow = 0 ;
 ModelPart_setModel ( & self -> headModel , self ) ;
 ModelPart_setModel ( & self -> bodyModel , self ) ;
 ModelPart_setModel ( & self -> rightArmModel , self ) ;
 ModelPart_setModel ( & self -> leftArmModel , self ) ;
 ModelPart_setModel ( & self -> rightLegModel , self ) ;
 ModelPart_setModel ( & self -> leftLegModel , self ) ;
 ModelPart_addBox ( & self -> headModel , - 4.0 , - 8.0 , - 4.0 , 8 , 8 , 8 , a2 ) ;
 ModelPart_setPos ( & self -> headModel , 0.0 , a3 + 0.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> bodyModel , - 4.0 , 0.0 , - 2.0 , 8 , 12 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> bodyModel , 0.0 , a3 + 0.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> rightArmModel , - 3.0 , - 2.0 , - 2.0 , 4 , 12 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> rightArmModel , - 5.0 , a3 + 2.0 , 0.0 ) ;
 self -> leftArmModel. mirror = 1 ;
 ModelPart_addBox ( & self -> leftArmModel , - 1.0 , - 2.0 , - 2.0 , 4 , 12 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> leftArmModel , 5.0 , a3 + 2.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> rightLegModel , - 2.0 , 0.0 , - 2.0 , 4 , 12 , 4 , a2 ) ;
 F32 v8 = a3 + 12.0 ;
 ModelPart_setPos ( & self -> rightLegModel , - 2.0 , v8 , 0.0 ) ;
 self -> leftLegModel. mirror = 1 ;
 ModelPart_addBox ( & self -> leftLegModel , - 2.0 , 0.0 , - 2.0 , 4 , 12 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> leftLegModel , 2.0 , v8 , 0.0 ) ;
}
U0 HumanoidModel_Destroy(HumanoidModel *self) {ModelPart_Destroy(&self->headModel);ModelPart_Destroy(&self->bodyModel);ModelPart_Destroy(&self->rightArmModel);ModelPart_Destroy(&self->leftArmModel);ModelPart_Destroy(&self->rightLegModel);ModelPart_Destroy(&self->leftLegModel);Model_Destroy(self);}

