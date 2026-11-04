// Batch 003. Source: minecraftpe/impl/rendering/textures/FireTexture.cpp
U0 FireTexture_Init(FireTexture *self) { DynamicTexture_Init(self,&MC_textureTiles.fire,1);self->tickFn=&FireTexture_tick;Random_Init(&self->random);self -> field_28 = MC_Alloc ( ( 320 ) * sizeof ( F32 ) ) ;
 self -> field_2C = MC_Alloc ( ( 320 ) * sizeof ( F32 ) ) ;
 for ( I32 i = 0 ;
 i < 320 ;
 ++ i ) {
 self -> field_28 [ i ] = 0 ;
 self -> field_2C [ i ] = 0 ;
 
}
}
U0 FireTexture_tick(DynamicTexture *base) { FireTexture *self=base;I32 v2 ;
 F32 v4 ;
 I32 i ;
 I32 v6 ;
 I32 j ;
 U32 v8 ;
 I32 v9 ;
 I32 v10 ;
 I32 v11 ;
 I32 v12 ;
 I32 v13 ;
 F32 * v14 ;
 U32 v15 ;
 F32 v16 ;
 I8 v17 ;
 U8 * v18 ;
 v2 = 0 ;
 do {
 v11 = v2 + 1 ;
 v9 = 0 ;
 v12 = ( v2 + 1 ) % 20 ;
 v10 = v12 << 6 ;
 v13 = ( v2 - v12 ) << 6 ;
 do {
 v4 = self -> field_28 [ v10 / 4 ] * 18.0 ;
 for ( i = 0 ;
 i != 2 ;
 ++ i ) {
 v6 = v9 - 1 ;
 for ( j = 0 ;
 j != 3 ;
 ++ j ) {
 if ( v6 != - 1 && v6 != 16 && i + v2 != 20 ) {
 v4 = v4 + self -> field_28 [ 16 * i - 1 + 16 * v2 + v9 + j ] ;
 
}
 ++ v6 ;
 
}
 
}
 self -> field_2C [ ( v10 + v13 ) / 4 ] = v4 / 25.2 ;
 if ( v2 == 19 ) {
 v8 = Random_genrand_int32 ( & self -> random ) ;
 self -> field_2C [ ( v10 + v13 ) / 4 ] = ((((((((( v8 >> 24 ) & 0xff))(F32) * 0.0039062))(F32) * 0.1))(F32) + ((((((((((v8 & 0xff))(F32) * 0.0039062))(F32) * ((((( v8 >> 8 ) & 0xff))(F32) * 0.0039062))(F32)))(F32) * ((((( v8 >> 16 ) & 0xff))(F32) * 0.0039062))(F32)))(F32) * 4.0))(F32)))(F32) + 0.2 ;
 
}
 ++ v9 ;
 v10 += 4 ;
 
}
 while ( v9 != 16 ) ;
 ++ v2 ;
 
}
 while ( v11 != 20 ) ;
 v14 = self -> field_2C ;
 self -> field_2C = self -> field_28 ;
 v15 = 0 ;
 self -> field_28 = v14 ;
 do {
 v16 = self -> field_28 [ v15 / 4 ] * 1.8 ;
 if ( v16 > 1.0 ) {
 v16 = 1.0 ;
 
}
 else if ( v16 < 0.0 ) {
 v16 = 0.0 ;
 
}
 self -> data [ v15 ] = (((((v16 * 155.0))(F32) + 100.0))(F32))(I32) ;
 if ( v16 >= 0.5 ) {
 v17 = - 1 ;
 
}
 else {
 v17 = 0 ;
 
}
 self -> data [ v15 + 1 ] = (((((v16 * v16))(F32) * 255.0))(F32))(I32) ;
 self -> data [ v15 + 2 ] = (((((((((((v16 * v16))(F32) * ((v16 * v16))(F32)))(F32) * ((((v16 * v16))(F32) * ((v16 * v16))(F32)))(F32)))(F32) * ((v16 * v16))(F32)))(F32) * 255.0))(F32))(I32) ;
 v18 = & self -> data [ v15 ] ;
 v15 += 4 ;
 v18 [ 3 ] = v17 ;
 
}
 while ( v15 != 1024 ) ;
}
U0 FireTexture_Destroy(FireTexture *self) {free ( self -> field_28 ) ;
 free ( self -> field_2C ) ;
DynamicTexture_Destroy(self);}

