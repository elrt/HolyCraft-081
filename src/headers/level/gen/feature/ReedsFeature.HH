// Batch 004. Source: minecraftpe/headers/level/gen/feature/ReedsFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_REEDSFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_REEDSFEATURE_HPP
class ReedsFeature { Feature base;  };
Bool ReedsFeature_place(ReedsFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool ReedsFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { ReedsFeature *self=base; return ReedsFeature_place(self,world,random,x,y,z); }
U0 ReedsFeature_Init(ReedsFeature *self) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&ReedsFeature_dispatch;  }
Bool ReedsFeature_place(ReedsFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v8 ;
 I32 v9 ;
 I32 v10 ;
 I32 v11 ;
 I32 v12 ;
 I32 v13 ;
 I32 v14 ;
 I32 v16 ;
 I32 v17 ;
 v16 = 20 ;
 v8 = y - 1 ;
 do {
 v9 = x + ( Random_genrand_int32 ( random ) & 3 ) ;
 v10 = v9 - ( Random_genrand_int32 ( random ) & 3 ) ;
 v11 = z + ( Random_genrand_int32 ( random ) & 3 ) ;
 v12 = v11 - ( Random_genrand_int32 ( random ) & 3 ) ;
 if ( MCWorld_isEmptyTile ( level , v10 , y , v12 ) && ( MC_featureTiles. waterMaterial == MCWorld_getMaterial ( level , v10 - 1 , v8 , v12 ) || MC_featureTiles. waterMaterial == MCWorld_getMaterial ( level , v10 + 1 , v8 , v12 ) || MC_featureTiles. waterMaterial == MCWorld_getMaterial ( level , v10 , v8 , v12 - 1 ) || MC_featureTiles. waterMaterial == MCWorld_getMaterial ( level , v10 , v8 , v12 + 1 ) ) ) {
 v14 = Random_genrand_int32 ( random ) ;
 v13 = 0 ;
 v17 = Random_genrand_int32 ( random ) % ( v14 % 3 + 1 ) + 2 ;
 do {
 if ( MCWorld_canSurvive ( level , MC_featureTiles. reeds , v10 , v13 + y , v12 ) ) {
 MCWorld_setTileNoUpdate ( level , v10 , v13 + y , v12 , MC_featureTiles. reeds ) ;
 
}
 ++ v13 ;
 
}
 while ( v13 < v17 ) ;
 
}
 -- v16 ;
 
}
 while ( v16 ) ;
 return 1 ;

}

#endif

