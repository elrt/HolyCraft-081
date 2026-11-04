// Batch 004. Source: minecraftpe/headers/level/gen/feature/TallgrassFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_TALLGRASSFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_TALLGRASSFEATURE_HPP
class TallgrassFeature { Feature base; I32 blockID ;
 I32 field_C ;
 };
Bool TallgrassFeature_place(TallgrassFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool TallgrassFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { TallgrassFeature *self=base; return TallgrassFeature_place(self,world,random,x,y,z); }
U0 TallgrassFeature_Init(TallgrassFeature *self,I32 id,I32 data) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&TallgrassFeature_dispatch; self->blockID=id; self->field_C=data; }
Bool TallgrassFeature_place(TallgrassFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v10 ;
 I32 v11 ;
 I32 v12 ;
 I32 v13 ;
 I32 v14 ;
 I32 v15 ;
 I32 v16 ;
 I32 v17 ;
 I32 v19 ;
 while ( 1 ) {
 v10 = MCWorld_getTile ( level , x , y , z ) ;
 if ( v10 ) {
 if ( v10 != MC_featureTiles. leaves ) {
 break ;
 
}
 
}
 if ( y <= 0 ) {
 break ;
 
}
 -- y ;
 
}
 v19 = 128 ;
 do {
 v11 = x + ( Random_genrand_int32 ( random ) & 7 ) ;
 v12 = v11 - ( Random_genrand_int32 ( random ) & 7 ) ;
 v13 = y + ( Random_genrand_int32 ( random ) & 3 ) ;
 v14 = v13 - ( Random_genrand_int32 ( random ) & 3 ) ;
 v15 = z + ( Random_genrand_int32 ( random ) & 7 ) ;
 v16 = v15 - ( Random_genrand_int32 ( random ) & 7 ) ;
 if ( MCWorld_isEmptyTile ( level , v12 , v14 , v16 ) ) {
 v17 = self -> blockID ;
 if ( MCWorld_canSurvive ( level , v17 , v12 , v14 , v16 ) ) {
 MCWorld_setTileAndDataNoUpdate ( level , v12 , v14 , v16 , self -> blockID , self -> field_C ) ;
 
}
 
}
 -- v19 ;
 
}
 while ( v19 ) ;
 return 1 ;

}

#endif

