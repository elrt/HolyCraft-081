// Batch 005. Source: minecraftpe/impl/rendering/model/ChestModel.cpp
U0 ChestModel_renderSimple(ChestModel *self) {
self -> field_118. xRotAngle = self -> field_18. xRotAngle ;
 ModelPart_render ( & self -> field_18 , 0.0625 ) ;
 ModelPart_render ( & self -> field_118 , 0.0625 ) ;
 ModelPart_render ( & self -> field_98 , 0.0625 ) ;
}
U0 ChestModel__simpleFn(Model *base) {ChestModel_renderSimple(base(ChestModel*));}
U0 ChestModel_Init(ChestModel *self,Bool a2) {Model_Init(self);ModelPart_Init(&self->field_18,0, 0, 64, 32);ModelPart_Init(&self->field_98,0, 0, 64, 32);ModelPart_Init(&self->field_118,0, 0, 64, 32);self->field_198=0;self->field_199=0;self->field_19A=0;self->field_19B=0;self->simpleFn=&ChestModel__simpleFn;F32 v4 = - 8.0 ;
 I32 v5 ;
 I32 v6 ;
 F32 v8 ;
 I32 v11 ;
 if ( a2 ) {
 v5 = 128 ;
 
}
 else {
 v5 = 64 ;
 
}
 if ( a2 ) {
 v6 = 30 ;
 
}
 else {
 v6 = 14 ;
 
}
 self -> field_198 = a2 ;
 v11 = v6 ;
 if ( ! a2 ) {
 v4 = 0.0 ;
 
}
 {
 ModelPart tmp ;
 ModelPart_InitModel ( & tmp , self , 0 , 0 , 64 , 32 ) ;
 ModelPart_setTexSize ( & tmp , v5 , 64 ) ;
 ModelPart_Assign ( & self -> field_18 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_18 , 0.0 , - 5.0 , - 14.0 , v11 , 5 , 14 , 0.0 ) ;
 v8 = v4 + 1.0 ;
 self -> field_18. yOffset = 7.0 ;
 self -> field_18. zOffset = 15.0 ;
 self -> field_18. xOffset = v8 ;
 {
 ModelPart tmp ;
 ModelPart_InitModel ( & tmp , self , 0 , 0 , 64 , 32 ) ;
 ModelPart_setTexSize ( & tmp , v5 , 64 ) ;
 ModelPart_Assign ( & self -> field_118 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_118 , - 1.0 , - 2.0 , - 15.0 , 2 , 4 , 1 , 0.0 ) ;
 self -> field_118. yOffset = 7.0 ;
 self -> field_118. xOffset = 8.0 ;
 self -> field_118. zOffset = 15.0 ;
 {
 ModelPart tmp ;
 ModelPart_InitModel ( & tmp , self , 0 , 19 , 64 , 32 ) ;
 ModelPart_setTexSize ( & tmp , v5 , 64 ) ;
 ModelPart_Assign ( & self -> field_98 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_98 , 0.0 , 0.0 , 0.0 , v11 , 10 , 14 , 0.0 ) ;
 self -> field_98. xOffset = v8 ;
 self -> field_98. zOffset = 1.0 ;
 self -> field_98. yOffset = 6.0 ;
}
U0 ChestModel_Destroy(ChestModel *self) {ModelPart_Destroy(&self->field_18);ModelPart_Destroy(&self->field_98);ModelPart_Destroy(&self->field_118);Model_Destroy(self);}

