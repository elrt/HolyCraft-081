// Batch 003. Source: minecraftpe/impl/rendering/textures/WaterTexture.cpp
U0 WaterTexture_Init(WaterTexture *self,TextureUVCoordinateSet *uv) { DynamicTexture_Init(self,&MC_textureTiles.water,1);self->tickFn=&WaterTexture_tick;self -> field_28 = 0 ;
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
U0 WaterTexture_tick(DynamicTexture *base) { WaterTexture *self=base;I32 i ;
 I32 v3 ;
 F32 v4 ;
 I32 v5 ;
 I32 v6 ;
 I32 j ;
 I32 v8 ;
 F32 * v9 ;
 I32 m ;
 I32 k ;
 F32 * v12 ;
 U32 v13 ;
 F32 v14 ;
 F32 v15 ;
 for ( i = 0 ;
 i != 256 ;
 i += 16 ) {
 for ( j = 0 ;
 j != 16 ;
 ++ j ) {
 v3 = j - 1 ;
 v4 = 0.0 ;
 while ( v3 != j + 2 ) {
 v5 = ( v3 ++ & 0xF ) + i ;
 v4 = v4 + self -> field_30 [ v5 ] ;
 
}
 v6 = j + i ;
 self -> field_34 [ v6 ] = ((v4 / 3.3))(F32) + ((self -> field_38 [ v6 ] * 0.8))(F32) ;
 
}
 
}
 for ( k = 0 ;
 k != 256 ;
 k += 16 ) {
 for ( m = 0 ;
 m != 16 ;
 ++ m ) {
 v8 = m * 4 + k * 4 ;
 self -> field_38 [ m + k ] = self -> field_38 [ m + k ] + ((self -> field_3C [ m + k ] * 0.05))(F32) ;
 v9 = & self -> field_38 [ m + k ] ;
 if ( * v9 < 0.0 ) {
 * v9 = 0.0 ;
 
}
 self -> field_3C [ v8 / 4 ] = self -> field_3C [ v8 / 4 ] - 0.1 ;
 if ( Mth_fastRandom ( ) <= 0xCCCCCCC ) {
 self -> field_3C [ v8 / 4 ] = 0.5 ;
 
}
 
}
 
}
 v12 = self -> field_34 ;
 self -> field_34 = self -> field_30 ;
 v13 = 0 ;
 self -> field_30 = v12 ;
 do {
 v14 = self -> field_30 [ v13 / 4 ] ;
 if ( v14 > 1.0 ) {
 v14 = 1.0 ;
 
}
 else if ( v14 < 0.0 ) {
 v14 = 0.0 ;
 
}
 v15 = v14 * v14 ;
 self -> data [ v13 ] = (((((v15 * 32.0))(F32) + 32.0))(F32))(I32) ;
 self -> data [ v13 + 1 ] = (((((v15 * 64.0))(F32) + 50.0))(F32))(I32) ;
 self -> data [ v13 + 2 ] = - 1 ;
 self -> data [ v13 + 3 ] = (((((v15 * 50.0))(F32) + 146.0))(F32))(I32) ;
 v13 += 4 ;
 
}
 while ( v13 != 1024 ) ;
}
U0 WaterTexture_Destroy(WaterTexture *self) {free ( self -> field_30 ) ;
 free ( self -> field_34 ) ;
 free ( self -> field_38 ) ;
 free ( self -> field_3C ) ;
DynamicTexture_Destroy(self);}

