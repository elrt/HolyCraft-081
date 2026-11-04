// Batch 005. Source: minecraftpe/impl/rendering/model/SkeletonModel.cpp
U0 SkeletonModel_render(SkeletonModel *self,MCModelEntity * a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7 , F32 a8) {
if ( a2 && a2 -> isMob && a2 -> useItemDuration > 0 && a2 -> useAnimation == 4 ) self -> isUsingBow = 1 ;
 Model_setupAnim ( self , a3 , a4 , a5 , a6 , a7 , a8 ) ;
 glLightModelf ( 0xB52 , 1.0 ) ;
 ModelPart_render ( & self -> headModel , a8 ) ;
 ModelPart_render ( & self -> bodyModel , a8 ) ;
 ModelPart_render ( & self -> rightArmModel , a8 ) ;
 ModelPart_render ( & self -> leftArmModel , a8 ) ;
 ModelPart_render ( & self -> rightLegModel , a8 ) ;
 ModelPart_render ( & self -> leftLegModel , a8 ) ;
 self -> isUsingBow = 0 ;
 glLightModelf ( 0xB52 , 0.0 ) ;
}
U0 SkeletonModel_setupAnim(SkeletonModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
self -> isUsingBow = 1 ;
 ZombieModel_setupAnim ( self , a2 , a3 , a4 , a5 , a6 , a7 ) ;
}
U0 SkeletonModel__renderFn(Model *base,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) {SkeletonModel_render(base(SkeletonModel*),entity,a3,a4,a5,a6,a7,a8);}
U0 SkeletonModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {SkeletonModel_setupAnim(base(SkeletonModel*),a2,a3,a4,a5,a6,a7);}
U0 SkeletonModel_Init(SkeletonModel *self) {ZombieModel_Init(self);self->renderFn=&SkeletonModel__renderFn;self->animFn=&SkeletonModel__animFn;{
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 40 , 16 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> rightArmModel , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> rightArmModel , self ) ;
 ModelPart_addBox ( & self -> rightArmModel , - 1.0 , - 2.0 , - 1.0 , 2 , 12 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> rightArmModel , - 5.0 , 2.0 , 0.0 ) ;
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 40 , 16 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> leftArmModel , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> leftArmModel , self ) ;
 self -> leftArmModel. mirror = 1 ;
 ModelPart_addBox ( & self -> leftArmModel , - 1.0 , - 2.0 , - 1.0 , 2 , 12 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> leftArmModel , 5.0 , 2.0 , 0.0 ) ;
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 16 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> rightLegModel , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> rightLegModel , self ) ;
 ModelPart_addBox ( & self -> rightLegModel , - 1.0 , 0.0 , - 1.0 , 2 , 12 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> rightLegModel , - 2.0 , 12.0 , 0.0 ) ;
 {
 ModelPart tmp ;
 ModelPart_Init ( & tmp , 0 , 16 , 64 , 32 ) ;
 ModelPart_Assign ( & self -> leftLegModel , & tmp ) ;
 ModelPart_Destroy ( & tmp ) ;
 
}
 ModelPart_setModel ( & self -> leftLegModel , self ) ;
 self -> leftLegModel. mirror = 1 ;
 ModelPart_addBox ( & self -> leftLegModel , - 1.0 , 0.0 , - 1.0 , 2 , 12 , 2 , 0.0 ) ;
 ModelPart_setPos ( & self -> leftLegModel , 2.0 , 12.0 , 0.0 ) ;
 self -> bodyModel. noFaceCull = 1 ;
}
U0 SkeletonModel_Destroy(SkeletonModel *self) {ZombieModel_Destroy(self);}

