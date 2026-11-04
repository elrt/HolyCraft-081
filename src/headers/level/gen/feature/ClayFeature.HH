// Batch 004. Source: minecraftpe/headers/level/gen/feature/ClayFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_CLAYFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_CLAYFEATURE_HPP
class ClayFeature { Feature base; I32 id ;
 I32 size ;
 };
Bool ClayFeature_place(ClayFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool ClayFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { ClayFeature *self=base; return ClayFeature_place(self,world,random,x,y,z); }
U0 ClayFeature_Init(ClayFeature *self) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&ClayFeature_dispatch; self->size=32; self->id=MC_featureTiles.clay; }
Bool ClayFeature_place(ClayFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v11 ;
 F64 v12 ;
 F64 v13 ;
 F64 v14 ;
 F64 size ;
 F64 v16 ;
 F32 v17 ;
 F32 v18 ;
 F64 v19 ;
 F64 v20 ;
 F32 v21 ;
 F32 v22 ;
 F32 v23 ;
 F32 v24 ;
 F32 v26 ;
 F32 v27 ;
 F32 v28 ;
 F32 Float ;
 I32 v30 ;
 F32 v31 ;
 F32 v32 ;
 F32 v33 ;
 I32 v34 ;
 F32 v35 ;
 F32 v36 ;
 I32 i ;
 I32 j ;
 I32 v39 ;
 if ( MC_featureTiles. waterMaterial != MCWorld_getMaterial ( level , x , y , z ) ) {
 return 0 ;
 
}
 v11 = 0 ;
 v12 = ((( x + 8 )))(F64) ;
 v13 = ((( Random_nextFloat ( random ) * 3.1416 )))(F32) ;
 v14 = sin ( v13 ) ;
 size = ((self -> size))(F64) ;
 v16 = v14 * size * 0.125 ;
 v17 = v12 + v16 ;
 v18 = v12 - v16 ;
 v19 = ((( z + 8 )))(F64) ;
 v20 = cos ( v13 ) * size * 0.125 ;
 v21 = v19 + v20 ;
 v22 = v19 - v20 ;
 v23 = ((((( y + Random_genrand_int32 ( random ) % 3 + 2 )))(I32)))(F32) ;
 v24 = ((((( y + Random_genrand_int32 ( random ) % 3 + 2 )))(I32)))(F32) ;
 while ( 1 ) {
 v39 = self -> size ;
 if ( v11 > v39 ) {
 break ;
 
}
 v26 = ((( ((( v18 - v17 )))(F32) * ((v11))(F32) )))(F32) / ((v39))(F32) ;
 v27 = ((( ((( v24 - v23 )))(F32) * ((v11))(F32) )))(F32) / ((v39))(F32) ;
 v28 = ((( ((( v22 - v21 )))(F32) * ((v11))(F32) )))(F32) / ((v39))(F32) ;
 Float = Random_nextFloat ( random ) ;
 v30 = self -> size ;
 v31 = v17 + v26 ;
 v32 = ( sin ( ((( ((( ((v11))(F32) * 3.1416 )))(F32) / ((v30))(F32) )))(F32) ) + 1.0 ) * ((( Float * ((( v30 >> 4 )))(F32) )))(F32) + 1.0 ;
 v33 = v32 * 0.5 ;
 v34 = ((((( v31 - v33 )))(F32)))(I32) ;
 v35 = v23 + v27 ;
 v36 = v21 + v28 ;
 while ( v34 <= ((((( v31 + v33 )))(F32)))(I32) ) {
 for ( i = ((((( v35 - v33 )))(F32)))(I32) ;
 i <= ((((( v35 + v33 )))(F32)))(I32) ;
 ++ i ) {
 for ( j = ((((( v36 - v33 )))(F32)))(I32) ;
 j <= ((((( v36 + v33 )))(F32)))(I32) ;
 ++ j ) {
 if ( ((( ((( ((( ((( ((( ((( ((i))(F32) + 0.5 )))(F32) - v35 )))(F32) / v33 )))(F32) * ((( ((( ((( ((i))(F32) + 0.5 )))(F32) - v35 )))(F32) / v33 )))(F32) )))(F32) + ((( ((( ((( ((( ((v34))(F32) + 0.5 )))(F32) - v31 )))(F32) / v33 )))(F32) * ((( ((( ((( ((v34))(F32) + 0.5 )))(F32) - v31 )))(F32) / v33 )))(F32) )))(F32) )))(F32) + ((( ((( ((( ((( ((j))(F32) + 0.5 )))(F32) - v36 )))(F32) / v33 )))(F32) * ((( ((( ((( ((j))(F32) + 0.5 )))(F32) - v36 )))(F32) / v33 )))(F32) )))(F32) )))(F32) < 1.0 && MCWorld_getTile ( level , v34 , i , j ) == MC_featureTiles. sand ) {
 MCWorld_setTileNoUpdate ( level , v34 , i , j , self -> id ) ;
 
}
 
}
 
}
 ++ v34 ;
 
}
 ++ v11 ;
 
}
 return 1 ;

}

#endif

