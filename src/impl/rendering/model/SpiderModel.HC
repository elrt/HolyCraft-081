// Batch 005. Source: minecraftpe/impl/rendering/model/SpiderModel.cpp
U0 SpiderEyesModel_render(SpiderEyesModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 glEnable ( GL_POLYGON_OFFSET_FILL ) ;
 ModelPart_render ( & self -> field_1C , a8 ) ;
 glDisable ( GL_POLYGON_OFFSET_FILL ) ;
}
U0 SpiderEyesModel_setupAnim(SpiderEyesModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
self -> field_1C. yRotAngle = a5 / ( 180.0 / 3.1416 ) ;
 self -> field_1C. xRotAngle = a6 / ( 180.0 / 3.1416 ) ;
}
U0 SpiderEyesModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {SpiderEyesModel_render(base(SpiderEyesModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 SpiderEyesModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {SpiderEyesModel_setupAnim(base(SpiderEyesModel*),a2,a3,a4,a5,a6,a7);}
U0 SpiderEyesModel_Init(SpiderEyesModel *self) {Model_Init(self);ModelPart_Init(&self->field_1C,32, 4, 64, 32);self->renderFn=&SpiderEyesModel__renderFn;self->animFn=&SpiderEyesModel__animFn;self -> field_5 = 1 ;
 ModelPart_setModel ( & self -> field_1C , self ) ;
 ModelPart_addBox ( & self -> field_1C , - 4.0 , - 4.0 , - 8.0 , 8.0 , 8.0 , 8.0 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_1C , 0 , 15 , - 3 ) ;
}
U0 SpiderEyesModel_Destroy(SpiderEyesModel *self) {ModelPart_Destroy(&self->field_1C);Model_Destroy(self);}
U0 SpiderModel_render(SpiderModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 ModelPart_render ( & self -> field_1C , a8 ) ;
 ModelPart_render ( & self -> field_9C , a8 ) ;
 ModelPart_render ( & self -> field_11C , a8 ) ;
 ModelPart_render ( & self -> field_19C , a8 ) ;
 ModelPart_render ( & self -> field_21C , a8 ) ;
 ModelPart_render ( & self -> field_29C , a8 ) ;
 ModelPart_render ( & self -> field_31C , a8 ) ;
 ModelPart_render ( & self -> field_39C , a8 ) ;
 ModelPart_render ( & self -> field_41C , a8 ) ;
 ModelPart_render ( & self -> field_49C , a8 ) ;
 ModelPart_render ( & self -> field_51C , a8 ) ;
}
U0 SpiderModel_setupAnim(SpiderModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
self -> field_1C. yRotAngle = a5 / ((( 180.0 / 3.1416 )))(F32) ;
 self -> field_1C. xRotAngle = a6 / ((( 180.0 / 3.1416 )))(F32) ;
 self -> field_21C. zRotAngle = 3.1416 * 0.25 ;
 F32 v15 = a2 * 0.6662 ;
 F32 v16 = ((( ((( 3.1416 + 3.1416 )))(F32) * 0.0 )))(F32) * 0.25 ;
 F32 v17 = - ((( 3.1416 * 0.25 )))(F32) ;
 self -> field_19C. zRotAngle = v17 ;
 F32 v18 = ((( 3.1416 * 0.25 )))(F32) * 0.74 ;
 self -> field_29C. zRotAngle = v17 * 0.74 ;
 self -> field_39C. zRotAngle = v17 * 0.74 ;
 self -> field_31C. zRotAngle = v18 ;
 self -> field_41C. zRotAngle = v18 ;
 self -> field_49C. zRotAngle = v17 ;
 self -> field_51C. zRotAngle = 3.1416 * 0.25 ;
 self -> field_21C. yRotAngle = v17 ;
 self -> field_29C. yRotAngle = 3.1416 * 0.125 ;
 self -> field_19C. yRotAngle = 3.1416 * 0.25 ;
 F32 v19 = - ((( 3.1416 * 0.125 )))(F32) ;
 self -> field_31C. yRotAngle = v19 ;
 self -> field_39C. yRotAngle = v19 ;
 self -> field_41C. yRotAngle = 3.1416 * 0.125 ;
 self -> field_49C. yRotAngle = v17 ;
 self -> field_51C. yRotAngle = 3.1416 * 0.25 ;
 F32 v20 = ((( ((( 3.1416 + 3.1416 )))(F32) + ((( 3.1416 + 3.1416 )))(F32) )))(F32) * 0.25 ;
 F32 v21 = - ((( 0.4 * Mth_cos ( ((( v15 + v15 )))(F32) + v16 ) )))(F32) ;
 F32 v31 = ((- ((( 0.4 * Mth_cos ( ((( v15 + v15 )))(F32) + v20 ) )))(F32)))(F32) * a3 ;
 F32 v22 = v21 * a3 ;
 F32 v32 = ((- ((( 0.4 * Mth_cos ( ((( v15 + v15 )))(F32) + ((( ((( 3.1416 + 3.1416 )))(F32) * 0.25 )))(F32) ) )))(F32)))(F32) * a3 ;
 F32 v23 = ((( ((( 3.1416 + 3.1416 )))(F32) * 3.0 )))(F32) * 0.25 ;
 F32 v24 = ((- ((( 0.4 * Mth_cos ( ((( v15 + v15 )))(F32) + v23 ) )))(F32)))(F32) * a3 ;
 F32 v25 = fabsf ( Mth_sin ( v15 + v16 ) * 0.4 ) * a3 ;
 F32 v26 = fabsf ( Mth_sin ( v15 + v20 ) * 0.4 ) * a3 ;
 F32 v27 = Mth_sin ( v15 + ((( ((( 3.1416 + 3.1416 )))(F32) * 0.25 )))(F32) ) * 0.4 ;
 F32 v28 = Mth_sin ( v15 + v23 ) ;
 self -> field_21C. yRotAngle = v17 - v22 ;
 self -> field_31C. yRotAngle = v19 - v31 ;
 F32 v29 = fabsf ( v27 ) * a3 ;
 self -> field_19C. yRotAngle = ((( 3.1416 * 0.25 )))(F32) + v22 ;
 self -> field_29C. yRotAngle = ((( 3.1416 * 0.125 )))(F32) + v31 ;
 self -> field_39C. yRotAngle = v32 - ((( 3.1416 * 0.125 )))(F32) ;
 self -> field_41C. yRotAngle = ((( 3.1416 * 0.125 )))(F32) - v32 ;
 self -> field_49C. yRotAngle = v24 - ((( 3.1416 * 0.25 )))(F32) ;
 self -> field_51C. yRotAngle = ((( 3.1416 * 0.25 )))(F32) - v24 ;
 self -> field_19C. zRotAngle = v25 - ((( 3.1416 * 0.25 )))(F32) ;
 F32 v30 = fabsf ( v28 * 0.4 ) * a3 ;
 self -> field_29C. zRotAngle = ((( v17 * 0.74 )))(F32) + v26 ;
 self -> field_21C. zRotAngle = ((( 3.1416 * 0.25 )))(F32) - v25 ;
 self -> field_31C. zRotAngle = v18 - v26 ;
 self -> field_39C. zRotAngle = ((( v17 * 0.74 )))(F32) + v29 ;
 self -> field_41C. zRotAngle = v18 - v29 ;
 self -> field_49C. zRotAngle = v30 - ((( 3.1416 * 0.25 )))(F32) ;
 self -> field_51C. zRotAngle = ((( 3.1416 * 0.25 )))(F32) - v30 ;
}
U0 SpiderModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {SpiderModel_render(base(SpiderModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 SpiderModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {SpiderModel_setupAnim(base(SpiderModel*),a2,a3,a4,a5,a6,a7);}
U0 SpiderModel_Init(SpiderModel *self) {Model_Init(self);ModelPart_Init(&self->field_1C,32, 4, 64, 32);ModelPart_Init(&self->field_9C,0, 0, 64, 32);ModelPart_Init(&self->field_11C,0, 12, 64, 32);ModelPart_Init(&self->field_19C,18, 0, 64, 32);ModelPart_Init(&self->field_21C,18, 0, 64, 32);ModelPart_Init(&self->field_29C,18, 0, 64, 32);ModelPart_Init(&self->field_31C,18, 0, 64, 32);ModelPart_Init(&self->field_39C,18, 0, 64, 32);ModelPart_Init(&self->field_41C,18, 0, 64, 32);ModelPart_Init(&self->field_49C,18, 0, 64, 32);ModelPart_Init(&self->field_51C,18, 0, 64, 32);self->renderFn=&SpiderModel__renderFn;self->animFn=&SpiderModel__animFn;ModelPart_setModel ( & self -> field_1C , self ) ;
 ModelPart_setModel ( & self -> field_9C , self ) ;
 ModelPart_setModel ( & self -> field_11C , self ) ;
 ModelPart_setModel ( & self -> field_19C , self ) ;
 ModelPart_setModel ( & self -> field_21C , self ) ;
 ModelPart_setModel ( & self -> field_29C , self ) ;
 ModelPart_setModel ( & self -> field_31C , self ) ;
 ModelPart_setModel ( & self -> field_39C , self ) ;
 ModelPart_setModel ( & self -> field_41C , self ) ;
 ModelPart_setModel ( & self -> field_49C , self ) ;
 ModelPart_setModel ( & self -> field_51C , self ) ;
 ModelPart_addBox ( & self -> field_1C , - 4.0 , - 4.0 , - 8.0 , 8 , 8 , 8 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_1C , 0.0 , 15.0 , - 3.0 ) ;
 ModelPart_addBox ( & self -> field_9C , - 3.0 , - 3.0 , - 3.0 , 6 , 6 , 6 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_9C , 0.0 , 15.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_11C , - 5.0 , - 4.0 , - 6.0 , 10 , 8 , 12 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_11C , 0.0 , 15.0 , 9.0 ) ;
 ModelPart_addBox ( & self -> field_19C , - 15.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_19C , - 4.0 , 15.0 , 2.0 ) ;
 ModelPart_addBox ( & self -> field_21C , - 1.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_21C , 4.0 , 15.0 , 2.0 ) ;
 ModelPart_addBox ( & self -> field_29C , - 15.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_29C , - 4.0 , 15.0 , 1.0 ) ;
 ModelPart_addBox ( & self -> field_31C , - 1.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_31C , 4.0 , 15.0 , 1.0 ) ;
 ModelPart_addBox ( & self -> field_39C , - 15.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_39C , - 4.0 , 15.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_41C , - 1.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_41C , 4.0 , 15.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_49C , - 15.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_49C , - 4.0 , 15.0 , - 1.0 ) ;
 ModelPart_addBox ( & self -> field_51C , - 1.0 , - 1.0 , - 1.0 , 16 , 2 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_51C , 4.0 , 15.0 , - 1.0 ) ;
}
U0 SpiderModel_Destroy(SpiderModel *self) {ModelPart_Destroy(&self->field_1C);ModelPart_Destroy(&self->field_9C);ModelPart_Destroy(&self->field_11C);ModelPart_Destroy(&self->field_19C);ModelPart_Destroy(&self->field_21C);ModelPart_Destroy(&self->field_29C);ModelPart_Destroy(&self->field_31C);ModelPart_Destroy(&self->field_39C);ModelPart_Destroy(&self->field_41C);ModelPart_Destroy(&self->field_49C);ModelPart_Destroy(&self->field_51C);Model_Destroy(self);}

