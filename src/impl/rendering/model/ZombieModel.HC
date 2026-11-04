// Batch 005. Source: minecraftpe/impl/rendering/model/ZombieModel.cpp
U0 ZombieModel_setupAnim(ZombieModel *self,F32 a2 , F32 a3 , F32 a4 , F32 a5 , F32 a6 , F32 a7) {
HumanoidModel_setupAnim ( self , a2 , a3 , a4 , a5 , a6 , a7 ) ;
 if ( ! self -> field_318 && ! self -> field_319 ) {
 F32 v9 = self -> field_0 ;
 F32 v10 = Mth_sin ( v9 * 3.1416 ) ;
 F32 v11 = Mth_sin ( ( 1.0 - ( ( 1.0 - v9 ) * ( 1.0 - v9 ) ) ) * 3.1416 ) ;
 F32 v12 = 0.1 - ( v10 * 0.6 ) ;
 self -> rightArmModel. zRotAngle = 0.0 ;
 self -> leftArmModel. zRotAngle = 0.0 ;
 self -> leftArmModel. yRotAngle = v12 ;
 self -> rightArmModel. yRotAngle = - v12 ;
 F32 v13 = - ((3.1416 * 0.5))(F32) - ((((v10 * 1.2))(F32) - ((v11 * 0.4))(F32)))(F32) ;
 self -> rightArmModel. xRotAngle = v13 ;
 self -> leftArmModel. xRotAngle = v13 ;
 F32 v14 = ((Mth_cos ( a4 * 0.09 ) * 0.05))(F32) + 0.05 ;
 F32 v15 = Mth_sin ( a4 * 0.067 ) ;
 self -> rightArmModel. zRotAngle = v14 + 0.0 ;
 self -> leftArmModel. zRotAngle = 0.0 - v14 ;
 self -> rightArmModel. xRotAngle = v13 + ((v15 * 0.05))(F32) ;
 self -> leftArmModel. xRotAngle = v13 - ((v15 * 0.05))(F32) ;
 
}
}
U0 ZombieModel__animFn(Model *base,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) {ZombieModel_setupAnim(base(ZombieModel*),a2,a3,a4,a5,a6,a7);}
U0 ZombieModel_Init(ZombieModel *self) {HumanoidModel_Init(self,0, 0);self->animFn=&ZombieModel__animFn;}
U0 ZombieModel_Destroy(ZombieModel *self) {HumanoidModel_Destroy(self);}

