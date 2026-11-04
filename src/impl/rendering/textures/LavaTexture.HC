// Batch 003. Source: minecraftpe/impl/rendering/textures/LavaTexture.cpp
U0 LavaTexture_Init(LavaTexture *self) { DynamicTexture_Init(self,&MC_textureTiles.lava,1);self->tickFn=&LavaTexture_tick;self -> field_28 = 0 ;
 self -> field_2C = 0 ;
 self -> field_30 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_34 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_38 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_3C = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 for ( I32 i = 0 ;
 i != 256 ;
 ++ i ) {
 self -> field_30 [ i ] = 0 ;
 self -> field_34 [ i ] = 0 ;
 self -> field_38 [ i ] = 0 ;
 self -> field_3C [ i ] = 0 ;
 
}
}
U0 LavaTexture_tick(DynamicTexture *base) { LavaTexture *self=base;I32 v1 ;
 I32 v3 ;
 F32 v4 ;
 F32 v5 ;
 I32 v6 ;
 I32 v7 ;
 F32 v8 ;
 I32 i ;
 I32 v10 ;
 I32 v11 ;
 F32 * v12 ;
 F32 * v13 ;
 I32 v14 ;
 I32 v15 ;
 I32 v16 ;
 F32 v17 ;
 F32 * v18 ;
 I32 v19 ;
 F32 v20 ;
 U8 * v21 ;
 v1 = 0 ;
 v3 = 0 ;
 do {
 v15 = v3 + 1 ;
 v14 = v1 ;
 v11 = 0 ;
 v16 = 16 * ( ( v3 + 1 ) & 0xF ) ;
 v17 = (((((v3)(F32) * 3.1416))(F32) + (((v3)(F32) * 3.1416))(F32)))(F32) * 0.0625 ;
 do {
 v4 = Mth_sin ( v17 ) * 1.2 ;
 v5 = Mth_sin ( (((((v11)(F32) * 3.1416))(F32) + (((v11)(F32) * 3.1416))(F32)))(F32) * 0.0625 ) ;
 v6 = (v4)(I32) ;
 v7 = v15 - 2 ;
 v8 = 0.0 ;
 while ( v7 != v15 + 1 ) {
 for ( i = v11 - 1 ;
 i != v11 + 2 ;
 ++ i ) {
 v10 = ( (i)(I8) + (v6)(I8) ) & 0xF ;
 v8 = v8 + self -> field_30 [ 16 * ( ( (v7)(I8) + ((((v5 * 1.2))(F32))(I32))(U8) ) & 0xF ) + v10 ] ;
 
}
 ++ v7 ;
 
}
 ++ v11 ;
 v12 = self -> field_38 ;
 self -> field_34 [ v14 ] = ((v8 / 10.0))(F32) + ((((((((((v12 [ v14 ] + v12 [ ( v11 & 0xF ) + v1 ]))(F32) + v12 [ ( v11 & 0xF ) + v16 ]))(F32) + v12 [ v14 + v16 - v1 ]))(F32) * 0.25))(F32) * 0.8))(F32) ;
 self -> field_38 [ v14 ] = self -> field_38 [ v14 ] + ((self -> field_3C [ v14 ] * 0.01))(F32) ;
 v13 = & self -> field_38 [ v14 ] ;
 if ( * v13 < 0.0 ) {
 * v13 = 0.0 ;
 
}
 self -> field_3C [ v14 ] = self -> field_3C [ v14 ] - 0.06 ;
 if ( Mth_fastRandom ( ) <= 0x147AE14 ) {
 self -> field_3C [ v14 ] = 1.5 ;
 
}
 ++ v14 ;
 
}
 while ( v11 != 16 ) ;
 v3 = v15 ;
 v1 += 16 ;
 
}
 while ( v15 != 16 ) ;
 v18 = self -> field_34 ;
 self -> field_34 = self -> field_30 ;
 v19 = 0 ;
 self -> field_30 = v18 ;
 do {
 v20 = self -> field_30 [ v19 ] + self -> field_30 [ v19 ] ;
 if ( v20 > 1.0 ) {
 v20 = 1.0 ;
 
}
 else if ( v20 < 0.0 ) {
 v20 = 0.0 ;
 
}
 self -> data [ v19 * 4 ] = (((((v20 * 100.0))(F32) + 155.0))(F32))(I32) ;
 self -> data [ v19 * 4 + 1 ] = (((((v20 * v20))(F32) * 255.0))(F32))(I32) ;
 self -> data [ v19 * 4 + 2 ] = (((((((((v20 * v20))(F32) * v20))(F32) * v20))(F32) * 128.0))(F32))(I32) ;
 v21 = & self -> data [ v19 * 4 ] ;
 ++ v19 ;
 v21 [ 3 ] = - 1 ;
 
}
 while ( v19 != 256 ) ;
}
U0 LavaTexture_Destroy(LavaTexture *self) {free ( self -> field_30 ) ;
 free ( self -> field_34 ) ;
 free ( self -> field_38 ) ;
 free ( self -> field_3C ) ;
DynamicTexture_Destroy(self);}

