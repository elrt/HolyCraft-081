#ifndef MCPE_BATCH003_SUPPORT
#define MCPE_BATCH003_SUPPORT
extern "c" U0 *memset(U0 *ptr,I32 value,U64 size);
class MCGLApi {
U0 (*Enable)(U32 cap);
U0 (*Disable)(U32 cap);
U0 (*EnableClientState)(U32 cap);
U0 (*DisableClientState)(U32 cap);
U0 (*BlendFunc)(U32 sf,U32 df);
U0 (*GenBuffers)(I32 n,U32 *ids);
U0 (*DeleteBuffers)(I32 n,U32 *ids);
U0 (*BindBuffer)(U32 target,U32 id);
U0 (*BufferData)(U32 target,I64 size,U0 *data,U32 usage);
U32 (*GetError)();
U0 (*VertexPointer)(I32 n,U32 type,I32 stride,U0 *ptr);
U0 (*TexCoordPointer)(I32 n,U32 type,I32 stride,U0 *ptr);
U0 (*ColorPointer)(I32 n,U32 type,I32 stride,U0 *ptr);
U0 (*NormalPointer)(U32 type,I32 stride,U0 *ptr);
U0 (*DrawElements)(U32 mode,I32 count,U32 type,U0 *ptr);
U0 (*DrawArrays)(U32 mode,I32 start,I32 count);
U0 (*GetFloatv)(U32 name,F32 *values);
};
MCGLApi MC_gl;
U0 glEnable(U32 cap) { if(!MC_gl.Enable) { printf("Missing GL backend: Enable\n"); exit(81); } MC_gl.Enable(cap); }
U0 glDisable(U32 cap) { if(!MC_gl.Disable) { printf("Missing GL backend: Disable\n"); exit(81); } MC_gl.Disable(cap); }
U0 glEnableClientState(U32 cap) { if(!MC_gl.EnableClientState) { printf("Missing GL backend: EnableClientState\n"); exit(81); } MC_gl.EnableClientState(cap); }
U0 glDisableClientState(U32 cap) { if(!MC_gl.DisableClientState) { printf("Missing GL backend: DisableClientState\n"); exit(81); } MC_gl.DisableClientState(cap); }
U0 glBlendFunc(U32 sf,U32 df) { if(!MC_gl.BlendFunc) { printf("Missing GL backend: BlendFunc\n"); exit(81); } MC_gl.BlendFunc(sf,df); }
U0 glGenBuffers(I32 n,U32 *ids) { if(!MC_gl.GenBuffers) { printf("Missing GL backend: GenBuffers\n"); exit(81); } MC_gl.GenBuffers(n,ids); }
U0 glDeleteBuffers(I32 n,U32 *ids) { if(!MC_gl.DeleteBuffers) { printf("Missing GL backend: DeleteBuffers\n"); exit(81); } MC_gl.DeleteBuffers(n,ids); }
U0 glBindBuffer(U32 target,U32 id) { if(!MC_gl.BindBuffer) { printf("Missing GL backend: BindBuffer\n"); exit(81); } MC_gl.BindBuffer(target,id); }
U0 glBufferData(U32 target,I64 size,U0 *data,U32 usage) { if(!MC_gl.BufferData) { printf("Missing GL backend: BufferData\n"); exit(81); } MC_gl.BufferData(target,size,data,usage); }
U32 glGetError() { if(!MC_gl.GetError) { printf("Missing GL backend: GetError\n"); exit(81); } return MC_gl.GetError(); }
U0 glVertexPointer(I32 n,U32 type,I32 stride,U0 *ptr) { if(!MC_gl.VertexPointer) { printf("Missing GL backend: VertexPointer\n"); exit(81); } MC_gl.VertexPointer(n,type,stride,ptr); }
U0 glTexCoordPointer(I32 n,U32 type,I32 stride,U0 *ptr) { if(!MC_gl.TexCoordPointer) { printf("Missing GL backend: TexCoordPointer\n"); exit(81); } MC_gl.TexCoordPointer(n,type,stride,ptr); }
U0 glColorPointer(I32 n,U32 type,I32 stride,U0 *ptr) { if(!MC_gl.ColorPointer) { printf("Missing GL backend: ColorPointer\n"); exit(81); } MC_gl.ColorPointer(n,type,stride,ptr); }
U0 glNormalPointer(U32 type,I32 stride,U0 *ptr) { if(!MC_gl.NormalPointer) { printf("Missing GL backend: NormalPointer\n"); exit(81); } MC_gl.NormalPointer(type,stride,ptr); }
U0 glDrawElements(U32 mode,I32 count,U32 type,U0 *ptr) { if(!MC_gl.DrawElements) { printf("Missing GL backend: DrawElements\n"); exit(81); } MC_gl.DrawElements(mode,count,type,ptr); }
U0 glDrawArrays(U32 mode,I32 start,I32 count) { if(!MC_gl.DrawArrays) { printf("Missing GL backend: DrawArrays\n"); exit(81); } MC_gl.DrawArrays(mode,start,count); }
U0 glGetFloatv(U32 name,F32 *values) { if(!MC_gl.GetFloatv) { printf("Missing GL backend: GetFloatv\n"); exit(81); } MC_gl.GetFloatv(name,values); }
#define GL_ARRAY_BUFFER 34962
#define GL_ELEMENT_ARRAY_BUFFER 34963
#define GL_STATIC_DRAW 35044
#define GL_UNSIGNED_SHORT 5123
#define GL_UNSIGNED_BYTE 5121
#define GL_FLOAT 5126
#define GL_BYTE 5120
class MCVertexSink { U0 *context; U0 (*normal)(U0 *context,F32 x,F32 y,F32 z); U0 (*vertexUV)(U0 *context,F32 x,F32 y,F32 z,F32 u,F32 v); };
class MCTextureBinder { U0 *context; U0 (*bind)(U0 *context,U8 *name); };
class MCTextureTiles { TextureUVCoordinateSet fire,lava,water,waterSide; };
MCTextureTiles MC_textureTiles;
U0 MCStringVector_Init(MCVector *vec) { MCVector_Init(vec,sizeof(MCString)); }
U0 MCStringVector_Destroy(MCVector *vec) { I64 i; for(i=0;i<vec->size;i++) MCString_Destroy(MCVector_At(vec,i)); MCVector_Destroy(vec); }
U0 MCStringVector_Push(MCVector *vec,MCString *value) { MCString copy; MCString_CopyInit(&copy,value); MCVector_Push(vec,&copy); }
U0 MCStringVector_Copy(MCVector *out,MCVector *value) { I64 i; MCStringVector_Init(out); for(i=0;i<value->size;i++) MCStringVector_Push(out,MCVector_At(value,i)); }
U0 MCStringVector_Move(MCVector *out,MCVector *value) { *out=*value; MCStringVector_Init(value); }
#endif
