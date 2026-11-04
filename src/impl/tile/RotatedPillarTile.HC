// Batch 005. Source: minecraftpe/impl/tile/RotatedPillarTile.cpp
U0 RotatedPillarTile_Init(RotatedPillarTile *self,I32 id,Material *mat) { MCBlock_Init(self,id,NULL,mat); }
I32 RotatedPillarTile_getRenderShape(RotatedPillarTile *self) { return 31; }
TextureUVCoordinateSet * RotatedPillarTile_getDirTexture(RotatedPillarTile *self,I32 side,I32 data) { return &self->textureUV; }
TextureUVCoordinateSet * RotatedPillarTile__dir(RotatedPillarTile *self,I32 side,I32 data) { if(self->dirTexture)return self->dirTexture(self,side,data);return RotatedPillarTile_getDirTexture(self,side,data); }
TextureUVCoordinateSet * RotatedPillarTile_getTexture(RotatedPillarTile *self,I32 side,I32 data) { I32 orient=data&12,v;if(!orient) { if(side(U32)<=1)return RotatedPillarTile__dir(self,data&12,data);return RotatedPillarTile__dir(self,5,data); }if(orient==4)v=side-4;else { if(orient!=8)return RotatedPillarTile__dir(self,5,data);v=side-2; }if(v(U32)<=1)return RotatedPillarTile__dir(self,0,data);return RotatedPillarTile__dir(self,5,data); }
I32 RotatedPillarTile_getPlacementDataValue(RotatedPillarTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 side,F32 a,F32 b,F32 c,U0 *mob,I32 aux) { I32 v=0;if((side-2)(U32)<=3) { if(side<4)v=8;else v=4; }return (aux&3)|v; }
U0 RotatedPillarTile_Destroy(RotatedPillarTile *self) { MCBlock_Destroy(self); }

