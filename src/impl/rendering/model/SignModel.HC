// Batch 005. Source: minecraftpe/impl/rendering/model/SignModel.cpp
U0 SignModel_renderSimple(SignModel *self) {
ModelPart_render ( & self -> field_1C , 0.060606 ) ;
 ModelPart_render ( & self -> field_9C , 0.0625 ) ;
}
U0 SignModel__simpleFn(Model *base) {SignModel_renderSimple(base(SignModel*));}
U0 SignModel_Init(SignModel *self) {Model_Init(self);ModelPart_Init(&self->field_1C,0, 0, 64, 32);ModelPart_Init(&self->field_9C,0, 14, 64, 32);self->simpleFn=&SignModel__simpleFn;ModelPart_addBox ( & self -> field_1C , - 12.0 , - 14.0 , - 1.0 , 24 , 12 , 2 , 0.0 ) ;
 ModelPart_addBox ( & self -> field_9C , - 1.0 , - 2.0 , - 1.0 , 2 , 14 , 2 , 0.0 ) ;
 ModelPart_setModel ( & self -> field_1C , self ) ;
 ModelPart_setModel ( & self -> field_9C , self ) ;
}
U0 SignModel_Destroy(SignModel *self) {ModelPart_Destroy(&self->field_1C);ModelPart_Destroy(&self->field_9C);Model_Destroy(self);}

