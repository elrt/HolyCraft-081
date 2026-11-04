// Batch 004. Source: minecraftpe/headers/level/gen/feature/CactusFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_CACTUSFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_CACTUSFEATURE_HPP
class CactusFeature { Feature base;  };
Bool CactusFeature_place(CactusFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool CactusFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { CactusFeature *self=base; return CactusFeature_place(self,world,random,x,y,z); }
U0 CactusFeature_Init(CactusFeature *self) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&CactusFeature_dispatch;  }
Bool CactusFeature_place(CactusFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
U32 v8 ;
 I32 v9 ;
 U32 v10 ;
 I32 v11 ;
 U32 v12 ;
 I32 v13 ;
 U32 v14 ;
 I32 v15 ;
 I32 v17 ;
 I32 v18 ;
 v17 = 10 ;
 do {
 v8 = x + ( Random_genrand_int32 ( random ) & 7 ) ;
 v9 = v8 - ( Random_genrand_int32 ( random ) & 7 ) ;
 v10 = y + ( Random_genrand_int32 ( random ) & 3 ) ;
 v11 = v10 - ( Random_genrand_int32 ( random ) & 3 ) ;
 v12 = z + ( Random_genrand_int32 ( random ) & 7 ) ;
 v13 = v12 - ( Random_genrand_int32 ( random ) & 7 ) ;
 if ( MCWorld_isEmptyTile ( level , v9 , v11 , v13 ) ) {
 v14 = Random_genrand_int32 ( random ) ;
 v15 = 0 ;
 v18 = Random_genrand_int32 ( random ) % ( v14 % 3 + 1 ) ;
 do {
 if ( MCWorld_canSurvive ( level , MC_featureTiles. cactus , v9 , v15 + v11 , v13 ) ) {
 MCWorld_setTileNoUpdate ( level , v9 , v15 + v11 , v13 , MC_featureTiles. cactus ) ;
 
}
 ++ v15 ;
 
}
 while ( v18 >= v15 ) ;
 
}
 -- v17 ;
 
}
 while ( v17 ) ;
 return 1 ;

}

#endif

