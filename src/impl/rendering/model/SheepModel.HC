// Batch 005. Source: minecraftpe/impl/rendering/model/SheepModel.cpp
U0 SheepModel_setupAnim(SheepModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
QuadrupedModel_setupAnim ( self , a2 , a3 , a4 , a5 , a6 , a7 ) ;
 self -> field_18. xRotAngle = self -> headEatAngleScale ;
}
U0 SheepModel_prepareMobModel(SheepModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5) {
self -> field_18. yOffset = a2 -> headEatPosition * 9.0 + 6.0 ;
 self -> headEatAngleScale = a2 -> headEatAngle ;
}
U0 SheepModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {SheepModel_setupAnim(base(SheepModel*),a2,a3,a4,a5,a6,a7);}
U0 SheepModel__prepareFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5) {SheepModel_prepareMobModel(base(SheepModel*),entity,a3,a4,a5);}
U0 SheepModel_Init(SheepModel *self,Bool a2) {QuadrupedModel_Init(self,12, 0, 64, 64);self->headEatAngleScale=0;self->animFn=&SheepModel__animFn;self->prepareFn=&SheepModel__prepareFn;if ( a2 ) {
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 28 , 8 , 64 , 64 ) ;
 ModelPart_Assign ( & self -> field_118 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_118 , - 4.0 , - 10.0 , - 7.0 , 8 , 16 , 6 , 0 ) ;
 
}
 else {
 {
 ModelPart tmp ;
 ModelPart_InitModel ( & tmp , self , 28 , 40 , 64 , 64 ) ;
 ModelPart_Assign ( & self -> field_118 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_118 , - 4.0 , - 10.0 , - 7.0 , 8 , 16 , 6 , 1.75 ) ;
 
}
 ModelPart_setPos ( & self -> field_118 , 0.0 , 5.0 , 2.0 ) ;
 {
 ModelPart tmp ;
 ModelPart_InitModel ( & tmp , self , 0 , 0 , 64 , 64 ) ;
 ModelPart_Assign ( & self -> field_18 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_addBox ( & self -> field_18 , - 3.0 , - 4.0 , - 6.0 , 6 , 6 , 8 , 0 ) ;
 ModelPart_setPos ( & self -> field_18 , 0.0 , 6.0 , - 8.0 ) ;
 if ( ! a2 ) {
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_18 , 0 , 32 ) , - 3.0 , - 4.0 , - 4.0 , 6 , 6 , 6 , 0.6 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_198 , 0 , 48 ) , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , 0.5 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_218 , 0 , 48 ) , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , 0.5 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_298 , 0 , 48 ) , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , 0.5 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_318 , 0 , 48 ) , - 2.0 , 0.0 , - 2.0 , 4 , 6 , 4 , 0.5 ) ;
 
}
}
U0 SheepModel_Destroy(SheepModel *self) {QuadrupedModel_Destroy(self);}

