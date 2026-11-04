// Batch 003. Source: minecraftpe/impl/gui/NinePatchDescription.cpp
U0 NinePatchDescription_Init(NinePatchDescription *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8,F32 a9,F32 a10,F32 a11,F32 a12,F32 a13) {self -> field_0 = a2 ;
 self -> field_4 = a2 + a4 ;
 self -> field_8 = a2 + a5 ;
 self -> field_C = a2 + a6 ;
 self -> field_10 = a3 ;
 self -> field_20 = a10 ;
 self -> field_24 = a11 ;
 self -> field_28 = a12 ;
 self -> field_14 = a3 + a7 ;
 self -> field_2C = a13 ;
 self -> width = - 1 ;
 self -> height = - 1 ;
 self -> field_18 = a3 + a8 ;
 self -> field_1C = a3 + a9 ;
}
U0 NinePatchDescription_transformUVForImageSize(NinePatchDescription *self,I32 w,I32 h) {if ( self -> width < 0 ) {
 self -> height = 1 ;
 self -> width = 1 ;
 
}
 F32 width = self -> width ;
 self -> width = (w)(F32) ;
 F32 v4 = width / (w)(F32) ;
 I32 height = self -> height ;
 F32 v6 = (height)(F32) / (h)(F32) ;
 self -> field_0 *= v4 ;
 self -> field_4 *= v4 ;
 self -> field_8 *= v4 ;
 self -> field_C *= v4 ;
 self -> field_10 *= v6 ;
 self -> field_14 *= v6 ;
 self -> field_18 *= v6 ;
 self -> field_1C *= v6 ;
}
