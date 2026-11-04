// Batch 005. Source: minecraftpe/impl/rendering/PolygonQuad.cpp
U0 PolygonQuad_Init(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4) { memset(self,0,sizeof(PolygonQuad));self->verticies[0]=*v1;self->verticies[1]=*v2;self->verticies[2]=*v3;self->verticies[3]=*v4; }
U0 PolygonQuad_InitUV(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4,F32 a,F32 b,F32 c,F32 d) { PolygonQuad_Init(self,v1,v2,v3,v4);VertexPT_InitUV(&self->verticies[0],v1,c,b);VertexPT_InitUV(&self->verticies[1],v2,a,b);VertexPT_InitUV(&self->verticies[2],v3,a,d);VertexPT_InitUV(&self->verticies[3],v4,c,d); }
U0 PolygonQuad_InitPixels(PolygonQuad *self,VertexPT *v1,VertexPT *v2,VertexPT *v3,VertexPT *v4,I32 a,I32 b,I32 c,I32 d,I32 tw,I32 th) { F32 width=tw,height=th,af=a/width,bf=b/height,cf=c/width,df=d/height;PolygonQuad_InitUV(self,v1,v2,v3,v4,af,bf,cf,df); }
U0 PolygonQuad_mirror(PolygonQuad *self) { I32 i;VertexPT temp;for(i=0;i<2;i++) { temp=self->verticies[i];self->verticies[i]=self->verticies[3-i];self->verticies[3-i]=temp; } }
U0 PolygonQuad_flipNormal(PolygonQuad *self) { self->flipnormal=TRUE; }
U0 PolygonQuad_render(PolygonQuad *self,MCVertexSink *sink,F32 a3,I32 a4) { if(!sink || !sink->normal || !sink->vertexUV)MCModelMissing();F32 diffX01 = self -> verticies [ 0 ] . vec. x - self -> verticies [ 1 ] . vec. x ;
 F32 diffY01 = self -> verticies [ 0 ] . vec. y - self -> verticies [ 1 ] . vec. y ;
 F32 diffZ01 = self -> verticies [ 0 ] . vec. z - self -> verticies [ 1 ] . vec. z ;
 F32 diffX03 = self -> verticies [ 0 ] . vec. x - self -> verticies [ 3 ] . vec. x ;
 F32 diffY03 = self -> verticies [ 0 ] . vec. y - self -> verticies [ 3 ] . vec. y ;
 F32 diffZ03 = self -> verticies [ 0 ] . vec. z - self -> verticies [ 3 ] . vec. z ;
 if ( diffX01 == 0 ) diffX01 = 0 ;
 if ( diffY01 == 0 ) diffY01 = 0 ;
 if ( diffZ01 == 0 ) diffZ01 = 0 ;
 if ( diffX03 == 0 ) diffX03 = 0 ;
 if ( diffY03 == 0 ) diffY03 = 0 ;
 if ( diffZ03 == 0 ) diffZ03 = 0 ;
 F32 v15 = ( diffY01 * diffZ03 ) - ( diffZ01 * diffY03 ) ;
 F32 v16 = ( diffZ01 * diffX03 ) - ( diffX01 * diffZ03 ) ;
 F32 v18 = ( diffX01 * diffY03 ) - ( diffY01 * diffX03 ) ;
 if ( v15 == 0 ) v15 = 0 ;
 if ( v16 == 0 ) v16 = 0 ;
 if ( v18 == 0 ) v18 = 0 ;
 F32 v19 = sqrt ( v16 * v16 + v15 * v15 + v18 * v18 ) ;
 F32 xCoord , yCoord , zCoord ;
 if ( v19 >= 0.0001 ) {
 xCoord = v15 / v19 ;
 yCoord = v16 / v19 ;
 zCoord = v18 / v19 ;
 if ( xCoord == 0 ) xCoord = 0 ;
 if ( yCoord == 0 ) yCoord = 0 ;
 if ( zCoord == 0 ) zCoord = 0 ;
 
}
 else {
 xCoord = Vec3_ZERO. x ;
 yCoord = Vec3_ZERO. y ;
 zCoord = Vec3_ZERO. z ;
 
}
 sink -> normal ( sink -> context , xCoord , yCoord , zCoord ) ;
 for ( I32 v23 = 0 ;
 v23 != 4 ;
 ++ v23 ) {
 VertexPT * v = & self -> verticies [ v23 ] ;
 sink -> vertexUV ( sink -> context , a3 * v -> vec. x , a3 * v -> vec. y , a3 * v -> vec. z , v -> u , v -> v ) ;
 
}
}

