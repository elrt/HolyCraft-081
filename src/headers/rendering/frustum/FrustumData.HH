// Batch 003. Source: minecraftpe/headers/rendering/frustum/FrustumData.hpp
#ifndef MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUMDATA_HPP
#define MCPE_HEADERS_RENDERING_FRUSTUM_FRUSTUMDATA_HPP
class FrustumData { F32 planes[16][16]; F32 proj[16],modl[16],clip[16]; };
Bool FrustumData_cubeInFrustum(FrustumData *self,F32 minX,F32 minY,F32 minZ,F32 maxX,F32 maxY,F32 maxZ) {I32 v9 ;
 F32 v10 ;
 F32 v11 ;
 F32 v12 ;
 F32 v13 ;
 F32 v14 ;
 F32 v15 ;
 F32 v16 ;
 F32 v17 ;
 F32 v18 ;
 F32 v19 ;
 F32 v20 ;
 F32 v21 ;
 F32 v22 ;
 for ( v9 = 0 ;
 v9 != 5 ;
 ++ v9 ) {
 v10 = self -> planes [ v9 ] [ 0 ] ;
 v11 = self -> planes [ v9 ] [ 1 ] ;
 v12 = v10 * minX ;
 v13 = self -> planes [ v9 ] [ 2 ] ;
 v14 = self -> planes [ v9 ] [ 3 ] ;
 v15 = v13 * minZ ;
 v16 = ((v10 * minX))(F32) + ((v11 * minY))(F32) ;
 if ( ((((v16 + ((v13 * minZ))(F32)))(F32) + v14))(F32) <= 0.0 ) {
 v17 = v10 * maxX ;
 v18 = v17 + ((v11 * minY))(F32) ;
 if ( ((((v18 + v15))(F32) + v14))(F32) <= 0.0 ) {
 v19 = v11 * maxY ;
 v20 = v12 + v19 ;
 if ( ((((v20 + v15))(F32) + v14))(F32) <= 0.0 ) {
 v21 = v17 + v19 ;
 if ( ((((v21 + v15))(F32) + v14))(F32) <= 0.0 ) {
 v22 = v13 * maxZ ;
 if ( ((((v16 + v22))(F32) + v14))(F32) <= 0.0 && ((((v18 + v22))(F32) + v14))(F32) <= 0.0 && ((((v20 + v22))(F32) + v14))(F32) <= 0.0 && ((((v21 + v22))(F32) + v14))(F32) <= 0.0 ) {
 return 0 ;
 
}
 
}
 
}
 
}
 
}
 
}
 return 1 ;
}
#endif

