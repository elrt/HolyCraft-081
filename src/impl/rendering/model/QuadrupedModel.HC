// Batch 005. Source: minecraftpe/impl/rendering/model/QuadrupedModel.cpp
U0 QuadrupedModel_render(QuadrupedModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 if ( self -> field_14 ) {
 glPushMatrix ( ) ;
 glTranslatef ( 0.0 , a8 * self -> field_398 , a8 * self -> field_39C ) ;
 ModelPart_render ( & self -> field_18 , a8 ) ;
 glPopMatrix ( ) ;
 glPushMatrix ( ) ;
 glScalef ( 0.5 , 0.5 , 0.5 ) ;
 glTranslatef ( 0.0 , a8 * 24.0 , 0.0 ) ;
 ModelPart_render ( & self -> field_118 , a8 ) ;
 ModelPart_render ( & self -> field_198 , a8 ) ;
 ModelPart_render ( & self -> field_218 , a8 ) ;
 ModelPart_render ( & self -> field_298 , a8 ) ;
 ModelPart_render ( & self -> field_318 , a8 ) ;
 glPopMatrix ( ) ;
 
}
 else {
 ModelPart_render ( & self -> field_18 , a8 ) ;
 ModelPart_render ( & self -> field_118 , a8 ) ;
 ModelPart_render ( & self -> field_198 , a8 ) ;
 ModelPart_render ( & self -> field_218 , a8 ) ;
 ModelPart_render ( & self -> field_298 , a8 ) ;
 ModelPart_render ( & self -> field_318 , a8 ) ;
 
}
}
U0 QuadrupedModel_setupAnim(QuadrupedModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
F32 v7 ;
 self -> field_18. xRotAngle = a6 / ((180.0 / 3.1416))(F32) ;
 self -> field_18. yRotAngle = a5 / ((180.0 / 3.1416))(F32) ;
 self -> field_118. xRotAngle = 90.0 / ((180.0 / 3.1416))(F32) ;
 v7 = ((Mth_cos ( a2 * 0.6662 ) * 1.4))(F32) * a3 ;
 self -> field_198. xRotAngle = v7 ;
 self -> field_318. xRotAngle = v7 ;
 self -> field_218. xRotAngle = - v7 ;
 self -> field_298. xRotAngle = - v7 ;
}
U0 QuadrupedModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {QuadrupedModel_render(base(QuadrupedModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 QuadrupedModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {QuadrupedModel_setupAnim(base(QuadrupedModel*),a2,a3,a4,a5,a6,a7);}
U0 QuadrupedModel_Init(QuadrupedModel *self,I32 a2 , F32 a3 , I32 a4 , I32 a5) {Model_Init(self);ModelPart_Init(&self->field_18,0, 0, a4, a5);ModelPart_Init(&self->field_98,0, 0, 64, 32);ModelPart_Init(&self->field_118,28, 8, a4, a5);ModelPart_Init(&self->field_198,0, 16, a4, a5);ModelPart_Init(&self->field_218,0, 16, a4, a5);ModelPart_Init(&self->field_298,0, 16, a4, a5);ModelPart_Init(&self->field_318,0, 16, a4, a5);self->field_398=0;self->field_39C=0;self->renderFn=&QuadrupedModel__renderFn;self->animFn=&QuadrupedModel__animFn;self -> field_0 = 0 ;
 self -> field_14 = 1 ;
 self -> field_4 = 0 ;
 self -> field_5 = 0 ;
 MC_modelPlatform. add ( self , 1.0 ) ;
 self -> field_398 = 8 ;
 self -> field_39C = 4 ;
 ModelPart_setModel ( & self -> field_18 , self ) ;
 ModelPart_setModel ( & self -> field_118 , self ) ;
 ModelPart_setModel ( & self -> field_198 , self ) ;
 ModelPart_setModel ( & self -> field_218 , self ) ;
 ModelPart_setModel ( & self -> field_298 , self ) ;
 ModelPart_setModel ( & self -> field_318 , self ) ;
 ModelPart_addBox ( & self -> field_18 , - 4.0 , - 4.0 , - 8.0 , 8 , 8 , 8 , a3 ) ;
 ModelPart_setPos ( & self -> field_18 , 0.0 , 18.0 - (a2)(F32) , - 6.0 ) ;
 ModelPart_addBox ( & self -> field_118 , - 5.0 , - 10.0 , - 7.0 , 10 , 16 , 8 , a3 ) ;
 ModelPart_setPos ( & self -> field_118 , 0.0 , 17.0 - (a2)(F32) , 2.0 ) ;
 ModelPart_addBox ( & self -> field_198 , - 2.0 , 0.0 , - 2.0 , 4 , a2 , 4 , a3 ) ;
 F32 v10 = 24.0 - (a2)(F32) ;
 ModelPart_setPos ( & self -> field_198 , - 3.0 , v10 , 7.0 ) ;
 ModelPart_addBox ( & self -> field_218 , - 2.0 , 0.0 , - 2.0 , 4 , a2 , 4 , a3 ) ;
 ModelPart_setPos ( & self -> field_218 , 3.0 , v10 , 7.0 ) ;
 ModelPart_addBox ( & self -> field_298 , - 2.0 , 0.0 , - 2.0 , 4 , a2 , 4 , a3 ) ;
 ModelPart_setPos ( & self -> field_298 , - 3.0 , v10 , - 5.0 ) ;
 ModelPart_addBox ( & self -> field_318 , - 2.0 , 0.0 , - 2.0 , 4 , a2 , 4 , a3 ) ;
 ModelPart_setPos ( & self -> field_318 , 3.0 , v10 , - 5.0 ) ;
}
U0 QuadrupedModel_Destroy(QuadrupedModel *self) {ModelPart_Destroy(&self->field_18);ModelPart_Destroy(&self->field_98);ModelPart_Destroy(&self->field_118);ModelPart_Destroy(&self->field_198);ModelPart_Destroy(&self->field_218);ModelPart_Destroy(&self->field_298);ModelPart_Destroy(&self->field_318);Model_Destroy(self);}

