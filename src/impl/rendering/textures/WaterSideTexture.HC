// Batch 003. Source: minecraftpe/impl/rendering/textures/WaterSideTexture.cpp
U0 WaterSideTexture_Init(WaterSideTexture *self) { DynamicTexture_Init(self,&MC_textureTiles.waterSide,2);self->tickFn=&WaterSideTexture_tick;self -> field_28 = 0 ;
 self -> field_2C = 0 ;
 self -> field_30 = 0 ;
 self -> field_34 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_38 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_3C = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 self -> field_40 = MC_Alloc ( ( 256 ) * sizeof ( F32 ) ) ;
 for ( I32 i = 0 ;
 i != 256 ;
 ++ i ) {
 self -> field_34 [ i ] = 0 ;
 self -> field_38 [ i ] = 0 ;
 self -> field_3C [ i ] = 0 ;
 self -> field_40 [ i ] = 0 ;
 
}
}
U0 WaterSideTexture_tick(DynamicTexture *base) { WaterSideTexture *self=base;I32 i ;
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
 I32 v13 ;
 I32 v14 ;
 F32 v15 ;
 F32 v16 ;
 U8 * v17 ;
 ++ self -> field_30 ;
 for ( i = 0 ;
 i != 16 ;
 ++ i ) {
 for ( j = 0 ;
 j != 16 ;
 ++ j ) {
 v3 = i - 2 ;
 v4 = 0.0 ;
 while ( v3 != i + 1 ) {
 v5 = v3 ++ & 0xF ;
 v4 = v4 + self -> field_34 [ 16 * v5 + j ] ;
 
}
 v6 = j + 16 * i ;
 self -> field_38 [ v6 ] = ((v4 / 3.2))(F32) + ((self -> field_3C [ v6 ] * 0.8))(F32) ;
 
}
 
}
 for ( k = 0 ;
 k != 256 ;
 k += 16 ) {
 for ( m = 0 ;
 m != 16 ;
 ++ m ) {
 v8 = m * 4 + k * 4 ;
 self -> field_3C [ m + k ] = self -> field_3C [ m + k ] + ((self -> field_40 [ m + k ] * 0.05))(F32) ;
 v9 = & self -> field_3C [ m + k ] ;
 if ( * v9 < 0.0 ) {
 * v9 = 0.0 ;
 
}
 self -> field_40 [ v8 / 4 ] = self -> field_40 [ v8 / 4 ] - 0.3 ;
 if ( Mth_fastRandom ( ) <= 0x33333332 ) {
 self -> field_40 [ v8 / 4 ] = 0.5 ;
 
}
 
}
 
}
 v12 = self -> field_34 ;
 self -> field_34 = self -> field_38 ;
 v13 = 1 ;
 self -> field_38 = v12 ;
 v14 = 0 ;
 do {
 v15 = self -> field_34 [ ((v14 - 16 * self -> field_30))(U8) ] ;
 if ( v15 > 1.0 ) {
 v15 = 1.0 ;
 
}
 else if ( v15 < 0.0 ) {
 v15 = 0.0 ;
 
}
 v16 = v15 * v15 ;
 self -> data [ 4 * v14 ++ ] = (((((v16 * 32.0))(F32) + 32.0))(F32))(I32) ;
 self -> data [ v13 ] = (((((v16 * 64.0))(F32) + 50.0))(F32))(I32) ;
 self -> data [ v13 + 1 ] = - 1 ;
 v17 = & self -> data [ v13 ] ;
 v13 += 4 ;
 v17 [ 2 ] = (((((v16 * 50.0))(F32) + 146.0))(F32))(I32) ;
 
}
 while ( v14 != 256 ) ;
}
U0 WaterSideTexture_Destroy(WaterSideTexture *self) {free ( self -> field_34 ) ;
 free ( self -> field_38 ) ;
 free ( self -> field_3C ) ;
 free ( self -> field_40 ) ;
DynamicTexture_Destroy(self);}

