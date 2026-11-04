#ifndef MCPE_BATCH006_MODEL_MESH
#define MCPE_BATCH006_MODEL_MESH
// A single, non-reentrant geometry builder. All meshes share this stable format.
class MC006Vertex { F32 x,y,z; I8 nx,ny,nz,pad; F32 u,v; };
class MC006Builder { MCVector vertices; MeshBufferVertexFormat format; I8 nx,ny,nz; Bool active,initialized; };
MC006Builder MC006;
U0 MC006Fail(U8 *reason) { printf("MC006 model mesh: %s\n",reason);exit(89); }
U0 MC006Init() {
 if(MC006.initialized)MC006Fail("already initialized");
 memset(&MC006,0,sizeof(MC006));MCVector_Init(&MC006.vertices,sizeof(MC006Vertex));
 MeshBufferVertexFormat_Init(&MC006.format);
 MeshBufferVertexFormat_enableField(&MC006.format,0);
 MeshBufferVertexFormat_enableField(&MC006.format,3);
 MeshBufferVertexFormat_enableField(&MC006.format,1);
 if(sizeof(MC006Vertex)!=24 || MC006.format.stride!=24)MC006Fail("unexpected vertex ABI");
 MC006.initialized=TRUE;
}
U0 MC006Destroy() {
 if(!MC006.initialized || MC006.active)MC006Fail("invalid destroy");
 // Caller must first destroy every mesh referring to MC006.format, while GL is alive.
 MCVector_Destroy(&MC006.vertices);MC006.initialized=FALSE;
}
I8 MC006NormalComponent(F32 n) { if(n>1.0)n=1.0;if(n< -1.0)n= -1.0;return (n*127.0)(I8); }
U0 MC006Normal(U0 *ctx,F32 x,F32 y,F32 z) {
 if(!MC006.active || ctx!=&MC006)MC006Fail("normal outside begin/end");
 MC006.nx=MC006NormalComponent(x);MC006.ny=MC006NormalComponent(y);MC006.nz=MC006NormalComponent(z);
}
U0 MC006VertexUV(U0 *ctx,F32 x,F32 y,F32 z,F32 u,F32 v) {
 if(!MC006.active || ctx!=&MC006)MC006Fail("vertex outside begin/end");
 if(MC006.vertices.size>=65536)MC006Fail("16-bit vertex limit exceeded");
 MC006Vertex vert;vert.x=x;vert.y=y;vert.z=z;vert.nx=MC006.nx;vert.ny=MC006.ny;vert.nz=MC006.nz;vert.pad=0;vert.u=u;vert.v=v;
 MCVector_Push(&MC006.vertices,&vert);
}
U0 MC006Begin(I32 expected) {
 if(!MC006.initialized || MC006.active)MC006Fail("invalid begin");
 if(expected<0 || expected>65536)MC006Fail("invalid expected vertex count");
 MC006.vertices.size=0;MC006.nx=0;MC006.ny=0;MC006.nz=0;MC006.active=TRUE;
}
U0 MC006End(MeshBuffer *out) {
 if(!MC006.active || !out)MC006Fail("invalid end");
 MC006.active=FALSE;
 I64 n=MC006.vertices.size;
 if(!n)return;
 if(n%4)MC006Fail("incomplete quad");
 I64 count=n/4*6;U16 *indices=MC_Alloc(count*sizeof(U16));I64 q,j;
 for(q=0;q<n/4;q++) { j=q*6;indices[j]=q*4;indices[j+1]=q*4+1;indices[j+2]=q*4+2;indices[j+3]=q*4+3;indices[j+4]=q*4;indices[j+5]=q*4+2; }
 if(!MeshBuffer_load(out,&MC006.format,MC006.vertices.data,n,indices,count,2,4)) { free(indices);MC006Fail("mesh upload failed"); }
 free(indices);
}
// Installs only the geometry callbacks, not matrix, GL, texture, or platform callbacks.
U0 MC006InstallGeometry() {
 if(!MC006.initialized)MC006Fail("not initialized");
 MC_modelGraphics.begin=&MC006Begin;MC_modelGraphics.end=&MC006End;
 MC_modelGraphics.vertices.context=&MC006;MC_modelGraphics.vertices.normal=&MC006Normal;MC_modelGraphics.vertices.vertexUV=&MC006VertexUV;
}
U0 MC006UninstallGeometry() {
 if(MC006.active)MC006Fail("uninstall during begin/end");
 MC_modelGraphics.begin=NULL;MC_modelGraphics.end=NULL;MC_modelGraphics.vertices.context=NULL;MC_modelGraphics.vertices.normal=NULL;MC_modelGraphics.vertices.vertexUV=NULL;
}
#endif
