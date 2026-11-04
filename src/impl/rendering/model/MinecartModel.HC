// Batch 005. Source: minecraftpe/impl/rendering/model/MinecartModel.cpp
U0 MinecartModel_render(MinecartModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
self -> field_18 [ 5 ] . yOffset = 4 - a5 ;
 for ( I32 i = 0 ;
 i != 6 ;
 ++ i ) {
 ModelPart_render ( & self -> field_18 [ i ] , a8 ) ;
 
}
}
U0 MinecartModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {MinecartModel_render(base(MinecartModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 MinecartModel_Init(MinecartModel *self) {Model_Init(self);ModelPart_Init(&self->field_18[0]);ModelPart_Init(&self->field_18[1]);ModelPart_Init(&self->field_18[2]);ModelPart_Init(&self->field_18[3]);ModelPart_Init(&self->field_18[4]);ModelPart_Init(&self->field_18[5]);ModelPart_Init(&self->field_18[6]);self->renderFn=&MinecartModel__renderFn;{
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 10 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 0 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 0 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 1 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 0 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 2 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 0 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 3 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 0 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 4 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 44 , 10 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 [ 5 ] , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_18 [ 0 ] , - 10.0 , - 8.0 , - 1.0 , 20 , 16 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 0 ] , 0.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_18 [ 5 ] , - 9.0 , - 7.0 , - 1.0 , 18 , 14 , 1 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 5 ] , 0.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_18 [ 1 ] , - 8.0 , - 9.0 , - 1.0 , 16 , 8 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 1 ] , - 9.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_18 [ 2 ] , - 8.0 , - 9.0 , - 1.0 , 16 , 8 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 2 ] , 9.0 , 4.0 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_18 [ 3 ] , - 8.0 , - 9.0 , - 1.0 , 16 , 8 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 3 ] , 0.0 , 4.0 , - 7.0 ) ;
 ModelPart_addBox ( & self -> field_18 [ 4 ] , - 8.0 , - 9.0 , - 1.0 , 16 , 8 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 [ 4 ] , 0.0 , 4.0 , 7.0 ) ;
 self -> field_18 [ 0 ] . xRotAngle = 3.1416 * 0.5 ;
 self -> field_18 [ 2 ] . yRotAngle = 3.1416 * 0.5 ;
 self -> field_18 [ 1 ] . yRotAngle = ((3.1416 * 0.5))(F32) * 3.0 ;
 self -> field_18 [ 5 ] . xRotAngle = - ((3.1416 * 0.5))(F32) ;
 self -> field_18 [ 3 ] . yRotAngle = ((3.1416 * 0.5))(F32) + ((3.1416 * 0.5))(F32) ;
}
U0 MinecartModel_Destroy(MinecartModel *self) {ModelPart_Destroy(&self->field_18[0]);ModelPart_Destroy(&self->field_18[1]);ModelPart_Destroy(&self->field_18[2]);ModelPart_Destroy(&self->field_18[3]);ModelPart_Destroy(&self->field_18[4]);ModelPart_Destroy(&self->field_18[5]);ModelPart_Destroy(&self->field_18[6]);Model_Destroy(self);}

