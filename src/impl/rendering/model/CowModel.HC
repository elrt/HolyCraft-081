// Batch 005. Source: minecraftpe/impl/rendering/model/CowModel.cpp
U0 CowModel_Init(CowModel *self) {QuadrupedModel_Init(self,12, 0, 64, 32);{
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 0 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_18 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> field_18 , self ) ;
 ModelPart_addBox ( & self -> field_18 , - 4.0 , - 4.0 , - 6.0 , 8 , 8 , 6 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_18 , 0.0 , 4.0 , - 8.0 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_18 , 22 , 0 ) , - 5.0 , - 5.0 , - 4.0 , 1 , 3 , 1 , 0.0 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_18 , 22 , 0 ) , 4.0 , - 5.0 , - 4.0 , 1 , 3 , 1 , 0.0 ) ;
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 18 , 4 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> field_118 , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> field_118 , self ) ;
 ModelPart_addBox ( & self -> field_118 , - 6.0 , - 10.0 , - 7.0 , 12 , 18 , 10 , 0.0 ) ;
 ModelPart_setPos ( & self -> field_118 , 0.0 , 5.0 , 2.0 ) ;
 ModelPart_addBox ( ModelPart_texOffs ( & self -> field_118 , 52 , 0 ) , - 2.0 , 2.0 , - 8.0 , 4 , 6 , 1 ) ;
 self -> field_198. xOffset = self -> field_198. xOffset - 1.0 ;
 self -> field_218. xOffset = self -> field_218. xOffset + 1.0 ;
 self -> field_198. zOffset = self -> field_198. zOffset + 0.0 ;
 F32 v5 = self -> field_298. xOffset - 1.0 ;
 self -> field_218. zOffset = self -> field_218. zOffset + 0.0 ;
 self -> field_298. xOffset = v5 ;
 self -> field_318. xOffset = self -> field_318. xOffset + 1.0 ;
 self -> field_298. zOffset = self -> field_298. zOffset - 1.0 ;
 self -> field_318. zOffset = self -> field_318. zOffset - 1.0 ;
 self -> field_39C = self -> field_39C + 2.0 ;
}
U0 CowModel_Destroy(CowModel *self) {QuadrupedModel_Destroy(self);}

