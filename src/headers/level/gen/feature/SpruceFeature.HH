// Batch 004. Source: minecraftpe/headers/level/gen/feature/SpruceFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_SPRUCEFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_SPRUCEFEATURE_HPP
class SpruceFeature { Feature base;  };
Bool SpruceFeature_place(SpruceFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool SpruceFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { SpruceFeature *self=base; return SpruceFeature_place(self,world,random,x,y,z); }
U0 SpruceFeature_Init(SpruceFeature *self,Bool u) { Feature_Init(&self->base,u); self->base.context=self; self->base.place=&SpruceFeature_dispatch;  }
Bool SpruceFeature_place(SpruceFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I8 v8 ;
 I8 v9 ;
 I32 v11 ;
 Bool v12 ;
 I32 v13 ;
 I32 i ;
 I32 v15 ;
 I32 v16 ;
 I32 v17 ;
 I32 v18 ;
 I32 v19 ;
 I32 v20 ;
 I32 v21 ;
 I32 v22 ;
 I32 v23 ;
 I32 v24 ;
 I32 v25 ;
 I32 v26 ;
 I32 v27 ;
 I32 v28 ;
 I32 v29 ;
 I32 v30 ;
 I32 v31 ;
 I32 v33 ;
 I32 a4 ;
 I32 a4a ;
 I32 v36 ;
 I32 v38 ;
 I32 v39 ;
 v28 = Random_genrand_int32 ( random ) & 3 ;
 v33 = v28 + 6 ;
 v8 = Random_genrand_int32 ( random ) ;
 v9 = Random_genrand_int32 ( random ) ;
 if ( y <= 0 || y + v33 > 127 ) {
 return 0 ;
 
}
 v30 = ( v8 & 1 ) + 1 ;
 v11 = y ;
 v12 = 1 ;
 v36 = ( v9 & 1 ) + 2 ;
 while ( v11 <= y + 1 + v33 ) {
 if ( ! v12 ) {
 return 0 ;
 
}
 v26 = v36 ;
 if ( v11 - y < v30 ) {
 v26 = 0 ;
 
}
 v15 = x - v26 ;
 v27 = v26 ;
 a4a = v26 + x ;
 v38 = z + v26 ;
 while ( v15 <= a4a && v12 ) {
 for ( i = z - v27 ;
 i <= v38 && v12 ;
 ++ i ) {
 if ( ((v11))(U32) <= 0x7F ) {
 v13 = MCWorld_getTile ( level , v15 , v11 , i ) ;
 if ( v13 ) {
 v12 = v13 == MC_featureTiles. leaves ;
 
}
 
}
 else {
 v12 = 0 ;
 
}
 
}
 ++ v15 ;
 
}
 ++ v11 ;
 
}
 if ( ! v12 ) {
 return 0 ;
 
}
 v16 = MCWorld_getTile ( level , x , y - 1 , z ) ;
 if ( v16 != MC_featureTiles. grass && v16 != MC_featureTiles. dirt ) {
 return 0 ;
 
}
 if ( y >= 121 - v28 ) {
 return 0 ;
 
}
 v17 = 1 ;
 v18 = 0 ;
 Feature_placeBlock ( & self -> base , level , x , y - 1 , z , MC_featureTiles. dirt ) ;
 v29 = 0 ;
 v39 = v33 - v30 ;
 v19 = Random_genrand_int32 ( random ) & 1 ;
 do {
 v20 = x - v19 ;
 a4 = y + v33 - v18 ;
 while ( v20 <= x + v19 ) {
 v21 = z - v19 ;
 v31 = MCAbs004 ( v20 - x ) ;
 while ( v21 <= z + v19 ) {
 if ( v31 != v19 ) {
 goto LABEL_58 ;
 
}
 v22 = v21 - z ;
 if ( v21 - z < 0 ) {
 v22 = z - v21 ;
 
}
 if ( v22 != v31 || ! v31 ) {
 LABEL_58 : if ( ! MC_featureTiles. solid [ MCWorld_getTile ( level , v20 , a4 , v21 ) ] ) {
 Feature_placeBlock ( & self -> base , level , v20 , a4 , v21 , MC_featureTiles. leaves , 1 ) ;
 
}
 
}
 ++ v21 ;
 
}
 ++ v20 ;
 
}
 if ( v19 < v17 ) {
 ++ v19 ;
 
}
 else {
 if ( ++ v17 > v36 ) {
 v17 = v36 ;
 
}
 v19 = v29 ;
 v29 = 1 ;
 
}
 ++ v18 ;
 
}
 while ( v18 <= v39 ) ;
 v23 = 0 ;
 v24 = v33 - Random_genrand_int32 ( random ) % 3 ;
 while ( v23 < v24 ) {
 v25 = MCWorld_getTile ( level , x , v23 + y , z ) ;
 if ( ! v25 || v25 == MC_featureTiles. leaves ) {
 Feature_placeBlock ( & self -> base , level , x , v23 + y , z , MC_featureTiles. treeTrunk , 1 ) ;
 
}
 ++ v23 ;
 
}
 return 1 ;

}

#endif

