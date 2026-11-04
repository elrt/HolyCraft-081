// Batch 005. Source: minecraftpe/impl/rendering/model/PigModel.cpp
U0 PigModel_Init(PigModel *self,F32 a2) {QuadrupedModel_Init(self,6, a2, 64, 32);ModelPart_addBox ( ModelPart_texOffs ( & self -> field_18 , 16 , 16 ) , - 2.0 , 0.0 , - 9.0 , 4 , 3 , 1 , a2 ) ;
 self -> field_398 = 4 ;
}
U0 PigModel_Destroy(PigModel *self) {QuadrupedModel_Destroy(self);}

