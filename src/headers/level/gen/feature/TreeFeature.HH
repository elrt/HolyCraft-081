// Batch 004. Source: minecraftpe/headers/level/gen/feature/TreeFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_TREEFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_TREEFEATURE_HPP
class TreeFeature { Feature base; I32 meta ;
 };
Bool TreeFeature_place(TreeFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool TreeFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { TreeFeature *self=base; return TreeFeature_place(self,world,random,x,y,z); }
U0 TreeFeature_Init(TreeFeature *self,Bool u,I32 meta) { Feature_Init(&self->base,u); self->base.context=self; self->base.place=&TreeFeature_dispatch; self->meta=meta; }
Bool TreeFeature_place(TreeFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v9 ;
 Bool v10 ;
 I32 v11 ;
 I32 i ;
 I32 v13 ;
 I32 j ;
 I32 v15 ;
 I32 k ;
 I32 v17 ;
 I32 m ;
 I32 a5 ;
 I32 v20 ;
 I32 v21 ;
 I32 v22 ;
 I32 v23 ;
 I32 v24 ;
 I32 v25 ;
 I32 v27 ;
 I32 v28 ;
 v23 = Random_genrand_int32 ( random ) % 3 ;
 v25 = v23 + 4 ;
 if ( y <= 0 ) {
 return 0 ;
 
}
 v28 = y + v25 ;
 if ( y + v25 > 127 ) {
 return 0 ;
 
}
 v9 = y ;
 v10 = 1 ;
 v27 = y + 1 + v25 ;
 while ( v9 <= v27 ) {
 if ( v9 >= v27 - 2 ) {
 v11 = 2 ;
 
}
 else {
 v11 = v9 != y ;
 
}
 for ( i = x - v11 ;
 i <= x + v11 && v10 ;
 ++ i ) {
 for ( j = z - v11 ;
 j <= z + v11 && v10 ;
 ++ j ) {
 if ( (v9)(U32) <= 0x7F ) {
 v13 = MCWorld_getTile ( level , i , v9 , j ) ;
 if ( v13 ) {
 v10 = v13 == MC_featureTiles. leaves ;
 
}
 
}
 else {
 v10 = 0 ;
 
}
 
}
 
}
 ++ v9 ;
 
}
 if ( ! v10 ) {
 return 0 ;
 
}
 v15 = MCWorld_getTile ( level , x , y - 1 , z ) ;
 if ( v15 != MC_featureTiles. grass && v15 != MC_featureTiles. dirt ) {
 return 0 ;
 
}
 if ( y >= 123 - v23 ) {
 return 0 ;
 
}
 Feature_placeBlock ( & self -> base , level , x , y - 1 , z , MC_featureTiles. dirt ) ;
 for ( k = y - 3 + v25 ;
 k <= v28 ;
 ++ k ) {
 v17 = 1 - ( k - v28 ) / 2 ;
 for ( m = x - v17 ;
 m <= x + v17 ;
 ++ m ) {
 a5 = z - v17 ;
 v24 = MCAbs004 ( m - x ) ;
 while ( a5 <= z + v17 ) {
 if ( v24 != v17 ) {
 goto LABEL_53 ;
 
}
 v20 = a5 - z ;
 if ( a5 - z < 0 ) {
 v20 = z - a5 ;
 
}
 if ( v20 != v24 || ( Random_genrand_int32 ( random ) & 1 ) != 0 && k != v28 ) {
 LABEL_53 : if ( ! MC_featureTiles. solid [ MCWorld_getTile ( level , m , k , a5 ) ] ) {
 Feature_placeBlock ( & self -> base , level , m , k , a5 , MC_featureTiles. leaves ) ;
 
}
 
}
 ++ a5 ;
 
}
 
}
 
}
 v21 = 0 ;
 do {
 v22 = MCWorld_getTile ( level , x , v21 + y , z ) ;
 if ( ! v22 || v22 == MC_featureTiles. leaves ) {
 Feature_placeBlock ( & self -> base , level , x , v21 + y , z , MC_featureTiles. treeTrunk , self -> meta ) ;
 
}
 ++ v21 ;
 
}
 while ( v21 < v25 ) ;
 return 1 ;

}

#endif

