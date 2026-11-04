// Batch 004. Source: minecraftpe/headers/level/gen/feature/FlowerFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_FLOWERFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_FLOWERFEATURE_HPP
class FlowerFeature { Feature base; I32 id ;
 };
Bool FlowerFeature_place(FlowerFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool FlowerFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { FlowerFeature *self=base; return FlowerFeature_place(self,world,random,x,y,z); }
U0 FlowerFeature_Init(FlowerFeature *self,I32 id) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&FlowerFeature_dispatch; self->id=id; }
Bool FlowerFeature_place(FlowerFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v9 ;
 I32 v10 ;
 I32 v11 ;
 I32 v12 ;
 I32 v13 ;
 I32 v14 ;
 I32 v15 ;
 I32 v16 ;
 v9 = 64 ;
 do {
 v10 = x + ( Random_genrand_int32 ( random ) & 7 ) ;
 v11 = v10 - ( Random_genrand_int32 ( random ) & 7 ) ;
 v12 = y + ( Random_genrand_int32 ( random ) & 3 ) ;
 v13 = v12 - ( Random_genrand_int32 ( random ) & 3 ) ;
 v14 = z + ( Random_genrand_int32 ( random ) & 7 ) ;
 v15 = v14 - ( Random_genrand_int32 ( random ) & 7 ) ;
 if ( MCWorld_isEmptyTile ( level , v11 , v13 , v15 ) ) {
 v16 = self -> id ;
 if ( MCWorld_canSurvive ( level , v16 , v11 , v13 , v15 ) ) {
 MCWorld_setTileNoUpdate ( level , v11 , v13 , v15 , self -> id ) ;
 
}
 
}
 -- v9 ;
 
}
 while ( v9 ) ;
 return 1 ;

}

#endif

