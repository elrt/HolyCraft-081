// Batch 005. Source: minecraftpe/impl/rendering/model/CreeperModel.cpp
U0 CreeperModel_render(CreeperModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 ModelPart_render ( & self -> field_1C , a8 ) ;
 ModelPart_render ( & self -> field_9C , a8 ) ;
 ModelPart_render ( & self -> field_11C , a8 ) ;
 ModelPart_render ( & self -> field_19C , a8 ) ;
 ModelPart_render ( & self -> field_21C , a8 ) ;
 ModelPart_render ( & self -> field_29C , a8 ) ;
}
U0 CreeperModel_setupAnim(CreeperModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
self -> field_1C. yRotAngle = a5 / ((( 180.0 / Mth_PI )))(F32) ;
 self -> field_1C. xRotAngle = a6 / ((( 180.0 / Mth_PI )))(F32) ;
 F32 v8 = ((( Mth_cos ( a2 * 0.6662 ) * 1.4 )))(F32) * a3 ;
 self -> field_11C. xRotAngle = v8 ;
 self -> field_29C. xRotAngle = v8 ;
 self -> field_19C. xRotAngle = - v8 ;
 self -> field_21C. xRotAngle = - v8 ;
}
U0 CreeperModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {CreeperModel_render(base(CreeperModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 CreeperModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {CreeperModel_setupAnim(base(CreeperModel*),a2,a3,a4,a5,a6,a7);}
U0 CreeperModel_Init(CreeperModel *self,F32 a2) {Model_Init(self);ModelPart_Init(&self->field_1C,0, 0, 64, 32);ModelPart_Init(&self->field_9C,16, 16, 64, 32);ModelPart_Init(&self->field_11C,0, 16, 64, 32);ModelPart_Init(&self->field_19C,0, 16, 64, 32);ModelPart_Init(&self->field_21C,0, 16, 64, 32);ModelPart_Init(&self->field_29C,0, 16, 64, 32);self->renderFn=&CreeperModel__renderFn;self->animFn=&CreeperModel__animFn;ModelPart_setModel ( & self -> field_1C , self ) ;
 ModelPart_setModel ( & self -> field_9C , self ) ;
 ModelPart_setModel ( & self -> field_11C , self ) ;
 ModelPart_setModel ( & self -> field_19C , self ) ;
 ModelPart_setModel ( & self -> field_21C , self ) ;
 ModelPart_setModel ( & self -> field_29C , self ) ;
 ModelPart_addBox ( & self -> field_1C , - 4.0 , - 8.0 , - 4.0 , 8 , 8 , 8 , a2 ) ;
 ModelPart_setPos ( & self -> field_1C , 0.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_9C , - 4.0 , 0.0 , - 2.0 , 8 , 12 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> field_9C , 0.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_11C , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> field_11C , - 2.0 , 16.0 , 4.0 ) ;
 ModelPart_addBox ( & self -> field_19C , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> field_19C , 2.0 , 16.0 , 4.0 ) ;
 ModelPart_addBox ( & self -> field_21C , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> field_21C , - 2.0 , 16.0 , - 4.0 ) ;
 ModelPart_addBox ( & self -> field_29C , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , a2 ) ;
 ModelPart_setPos ( & self -> field_29C , 2.0 , 16.0 , - 4.0 ) ;
}
U0 CreeperModel_Destroy(CreeperModel *self) {ModelPart_Destroy(&self->field_1C);ModelPart_Destroy(&self->field_9C);ModelPart_Destroy(&self->field_11C);ModelPart_Destroy(&self->field_19C);ModelPart_Destroy(&self->field_21C);ModelPart_Destroy(&self->field_29C);Model_Destroy(self);}

