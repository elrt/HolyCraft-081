// Batch 004. Source: minecraftpe/headers/level/gen/feature/SpringFeature.hpp
#ifndef MCPE_HEADERS_LEVEL_GEN_FEATURE_SPRINGFEATURE_HPP
#define MCPE_HEADERS_LEVEL_GEN_FEATURE_SPRINGFEATURE_HPP
class SpringFeature { Feature base; I32 id ;
 };
Bool SpringFeature_place(SpringFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z);
Bool SpringFeature_dispatch(U0 *base,MCFeatureWorld *world,Random *random,I32 x,I32 y,I32 z) { SpringFeature *self=base; return SpringFeature_place(self,world,random,x,y,z); }
U0 SpringFeature_Init(SpringFeature *self,I32 id) { Feature_Init(&self->base,FALSE); self->base.context=self; self->base.place=&SpringFeature_dispatch; self->id=id; }
Bool SpringFeature_place(SpringFeature *self,MCFeatureWorld *level,Random *random,I32 x,I32 y,I32 z) { MCFeatureWorld_Require(level);
I32 v9 ;
 I32 v10 ;
 I32 v11 ;
 I32 v13 ;
 if ( MCWorld_getTile ( level , x , y + 1 , z ) != MC_featureTiles. rock || MCWorld_getTile ( level , x , y - 1 , z ) != MC_featureTiles. rock || MCWorld_getTile ( level , x , y , z ) && MCWorld_getTile ( level , x , y , z ) != MC_featureTiles. rock ) {
 return 0 ;
 
}
 v9 = MCWorld_getTile ( level , x - 1 , y , z ) == MC_featureTiles. rock ;
 if ( MCWorld_getTile ( level , x + 1 , y , z ) == MC_featureTiles. rock ) {
 ++ v9 ;
 
}
 v13 = z + 1 ;
 if ( MCWorld_getTile ( level , x , y , z - 1 ) == MC_featureTiles. rock ) {
 ++ v9 ;
 
}
 if ( MCWorld_getTile ( level , x , y , v13 ) == MC_featureTiles. rock ) {
 ++ v9 ;
 
}
 v10 = MCWorld_isEmptyTile ( level , x - 1 , y , z ) ;
 if ( MCWorld_isEmptyTile ( level , x + 1 , y , z ) ) {
 ++ v10 ;
 
}
 if ( MCWorld_isEmptyTile ( level , x , y , z - 1 ) ) {
 ++ v10 ;
 
}
 if ( MCWorld_isEmptyTile ( level , x , y , v13 ) ) {
 ++ v10 ;
 
}
 if ( v9 == 3 && v10 == 1 ) {
 MCWorld_setTile ( level , x , y , z , self -> id , 4 ) ;
 level -> instantTick = 1 ;
 v11 = self -> id ;
 MCWorld_tick ( level , v11 , x , y , z , random ) ;
 level -> instantTick = 0 ;
 
}
 return 1 ;

}

#endif

