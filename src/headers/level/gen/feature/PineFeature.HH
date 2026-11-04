// Batch 004. Source: minecraftpe/headers/level/gen/feature/PineFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_PINEFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_PINEFEATURE_HPP
class PineFeature { Feature base;  };
Bool PineFeature_place(PineFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool PineFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { PineFeature *self=base; return PineFeature_place(self,world,random,x,y,z); }
U0 PineFeature_Init(PineFeature *self) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&PineFeature_dispatch;  }
Bool PineFeature_place(PineFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v9 ;
 I8 v10 ;
 I32 v11 ;
 I32 v13 ;
 Bool v14 ;
 I32 v15 ;
 I32 v16 ;
 I32 i ;
 I32 v18 ;
 I32 v19 ;
 I32 v20 ;
 I32 j ;
 I32 v22 ;
 I32 a5 ;
 I32 v24 ;
 I32 k ;
 I32 v26 ;
 I32 v27 ;
 I32 v28 ;
 I32 a4 ;
 I32 v30 ;
 I32 v31 ;
 I32 v33 ;
 I32 v34 ;
 I32 v35 ;
 I32 v36 ;
 v31 = Random_genrand_int32 ( random ) % 5 ;
 v9 = v31 + 7 ;
 v10 = Random_genrand_int32 ( random ) ;
 v11 = Random_genrand_int32 ( random ) ;
 if ( y <= 0 ) {
 return 0 ;
 
}
 a4 = y + v9 ;
 if ( y + v9 > 127 ) {
 return 0 ;
 
}
 v30 = v9 - ( v10 & 1 ) - 3 ;
 v13 = ( v10 & 1 ) + 3 ;
 v14 = 1 ;
 v15 = y ;
 v36 = y + 1 + v9 ;
 v35 = (v11)(U32) % ((( v13 + 1 )))(U32) + 1 ;
 while ( v15 <= v36 ) {
 if ( ! v14 ) {
 return 0 ;
 
}
 v27 = v35 ;
 if ( v15 - y < v30 ) {
 v27 = 0 ;
 
}
 v18 = x - v27 ;
 v28 = v27 ;
 v33 = x + v27 ;
 v34 = z + v27 ;
 while ( v18 <= v33 && v14 ) {
 for ( i = z - v28 ;
 i <= v34 && v14 ;
 ++ i ) {
 if ( ((v15))(U32) <= 0x7F ) {
 v16 = MCWorld_getTile ( level , v18 , v15 , i ) ;
 if ( v16 ) {
 v14 = v16 == MC_featureTiles. leaves ;
 
}
 
}
 else {
 v14 = 0 ;
 
}
 
}
 ++ v18 ;
 
}
 ++ v15 ;
 
}
 if ( ! v14 ) {
 return 0 ;
 
}
 v19 = MCWorld_getTile ( level , x , y - 1 , z ) ;
 if ( v19 != MC_featureTiles. grass && v19 != MC_featureTiles. dirt ) {
 return 0 ;
 
}
 if ( y >= 120 - v31 ) {
 return 0 ;
 
}
 Feature_placeBlock ( & self -> base , level , x , y - 1 , z , MC_featureTiles. dirt ) ;
 v20 = 0 ;
 while ( a4 >= y + v30 ) {
 for ( j = x - v20 ;
 j <= x + v20 ;
 ++ j ) {
 v22 = j - x ;
 if ( j - x < 0 ) {
 v22 = x - j ;
 
}
 for ( a5 = z - v20 ;
 a5 <= z + v20 ;
 ++ a5 ) {
 if ( v22 != v20 ) {
 goto LABEL_61 ;
 
}
 v24 = a5 - z ;
 if ( a5 - z < 0 ) {
 v24 = z - a5 ;
 
}
 if ( v24 != v22 || ! v22 ) {
 LABEL_61 : if ( ! MC_featureTiles. solid [ MCWorld_getTile ( level , j , a4 , a5 ) ] ) {
 Feature_placeBlock ( & self -> base , level , j , a4 , a5 , MC_featureTiles. leaves , 1 ) ;
 
}
 
}
 
}
 
}
 if ( v20 > 0 && a4 == y + v30 + 1 ) {
 -- v20 ;
 
}
 else if ( v20 < v35 ) {
 ++ v20 ;
 
}
 -- a4 ;
 
}
 for ( k = 0 ;
 k < v31 + 6 ;
 ++ k ) {
 v26 = MCWorld_getTile ( level , x , k + y , z ) ;
 if ( ! v26 || v26 == MC_featureTiles. leaves ) {
 Feature_placeBlock ( & self -> base , level , x , k + y , z , MC_featureTiles. treeTrunk , 1 ) ;
 
}
 
}
 return 1 ;

}

#endif

