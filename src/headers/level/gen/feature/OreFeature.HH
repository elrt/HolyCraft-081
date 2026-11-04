// Batch 004. Source: minecraftpe/headers/level/gen/feature/OreFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_OREFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_OREFEATURE_HPP
class OreFeature { Feature base; I32 id ;
 I32 amount ;
 };
Bool OreFeature_place(OreFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool OreFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { OreFeature *self=base; return OreFeature_place(self,world,random,x,y,z); }
U0 OreFeature_Init(OreFeature *self,I32 id,I32 amount) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&OreFeature_dispatch; self->id=id; self->amount=amount; }
Bool OreFeature_place(OreFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v9 ;
 F32 v10 ;
 F32 v11 ;
 F32 amount ;
 F32 v13 ;
 F32 v14 ;
 F32 v15 ;
 F32 v16 ;
 F32 v17 ;
 F32 v18 ;
 F32 v19 ;
 F32 v20 ;
 I32 v21 ;
 F32 v22 ;
 F32 v23 ;
 F32 v24 ;
 F32 v25 ;
 F32 v26 ;
 F32 v27 ;
 F32 v28 ;
 I32 i ;
 F32 v30 ;
 I32 j ;
 F32 v32 ;
 I32 k ;
 I32 v34 ;
 F32 v36 ;
 v9 = 0 ;
 v10 = ((( x + 8 )))(F32) ;
 v11 = ((( Random_nextFloat ( random ) * 3.1416 )))(F32) ;
 amount = ((self -> amount))(F32) ;
 v13 = ((( amount * Mth_sin ( v11 ) )))(F32) * 0.125 ;
 v14 = v10 + v13 ;
 v36 = v10 - v13 ;
 v15 = ((( z + 8 )))(F32) ;
 v16 = ((( amount * Mth_cos ( v11 ) )))(F32) * 0.125 ;
 v17 = v15 + v16 ;
 v18 = v15 - v16 ;
 v19 = ((((( y + Random_genrand_int32 ( random ) % 3 + 2 )))(I32)))(F32) ;
 v20 = ((((( y + Random_genrand_int32 ( random ) % 3 + 2 )))(I32)))(F32) ;
 while ( 1 ) {
 v34 = self -> amount ;
 if ( v9 > v34 ) {
 break ;
 
}
 v21 = self -> amount ;
 v22 = ((( ((( v36 - v14 )))(F32) * ((v9))(F32) )))(F32) / ((v34))(F32) ;
 v23 = ((( ((( v20 - v19 )))(F32) * ((v9))(F32) )))(F32) / ((v34))(F32) ;
 v24 = ((( ((( v18 - v17 )))(F32) * ((v9))(F32) )))(F32) / ((v34))(F32) ;
 v25 = ((( ((( ((( Mth_sin ( ((( ((( ((v9))(F32) * 3.1416 )))(F32) / ((v21))(F32) )))(F32) ) + 1.0 )))(F32) * ((( ((( Random_nextFloat ( random ) * ((v21))(F32) )))(F32) * 0.0625 )))(F32) )))(F32) + 1.0 )))(F32) * 0.5 ;
 v26 = v19 + v23 ;
 v27 = v17 + v24 ;
 v28 = v14 + v22 ;
 for ( i = ((((( v28 - v25 )))(F32)))(I32) ;
 i <= ((((( v28 + v25 )))(F32)))(I32) ;
 ++ i ) {
 v30 = ((( ((( ((( ((i))(F32) + 0.5 )))(F32) - v28 )))(F32) / v25 )))(F32) * ((( ((( ((( ((i))(F32) + 0.5 )))(F32) - v28 )))(F32) / v25 )))(F32) ;
 if ( v30 < 1.0 ) {
 for ( j = ((((( v26 - v25 )))(F32)))(I32) ;
 j <= ((((( v26 + v25 )))(F32)))(I32) ;
 ++ j ) {
 v32 = v30 + ((( ((( ((( ((( ((j))(F32) + 0.5 )))(F32) - v26 )))(F32) / v25 )))(F32) * ((( ((( ((( ((j))(F32) + 0.5 )))(F32) - v26 )))(F32) / v25 )))(F32) )))(F32) ;
 if ( v32 < 1.0 ) {
 for ( k = ((((( v27 - v25 )))(F32)))(I32) ;
 k <= ((((( v27 + v25 )))(F32)))(I32) ;
 ++ k ) {
 if ( ((( v32 + ((( ((( ((( ((( ((k))(F32) + 0.5 )))(F32) - v27 )))(F32) / v25 )))(F32) * ((( ((( ((( ((k))(F32) + 0.5 )))(F32) - v27 )))(F32) / v25 )))(F32) )))(F32) )))(F32) < 1.0 && MCWorld_getTile ( level , i , j , k ) == MC_featureTiles. rock ) {
 MCWorld_setTileNoUpdate ( level , i , j , k , self -> id ) ;
 
}
 
}
 
}
 
}
 
}
 
}
 ++ v9 ;
 
}
 return 1 ;

}

#endif

