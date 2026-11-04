#ifndef MCPE_BATCH005_MODEL_SUPPORT
#define MCPE_BATCH005_MODEL_SUPPORT
class MCModelGraphics { U0 (*PushMatrix)();U0 (*PopMatrix)();U0 (*Translatef)(F32 x,F32 y,F32 z);U0 (*Scalef)(F32 x,F32 y,F32 z);U0 (*Rotatef)(F32 angle,F32 x,F32 y,F32 z);U0 (*LightModelf)(U32 name,F32 value);U0 (*begin)(I32 vertices);U0 (*end)(MeshBuffer *out);MCVertexSink vertices; };
MCModelGraphics MC_modelGraphics;
class MCModelPlatform { U0 (*add)(U0 *model,F32 priority);U0 (*remove)(U0 *model); };
MCModelPlatform MC_modelPlatform;
U0 MCModelMissing() { printf("Missing model graphics/platform backend\n");exit(86); }
U0 glPushMatrix() { if(!MC_modelGraphics.PushMatrix)MCModelMissing();MC_modelGraphics.PushMatrix(); }
U0 glPopMatrix() { if(!MC_modelGraphics.PopMatrix)MCModelMissing();MC_modelGraphics.PopMatrix(); }
U0 glTranslatef(F32 x,F32 y,F32 z) { if(!MC_modelGraphics.Translatef)MCModelMissing();MC_modelGraphics.Translatef(x,y,z); }
U0 glScalef(F32 x,F32 y,F32 z) { if(!MC_modelGraphics.Scalef)MCModelMissing();MC_modelGraphics.Scalef(x,y,z); }
U0 glRotatef(F32 angle,F32 x,F32 y,F32 z) { if(!MC_modelGraphics.Rotatef)MCModelMissing();MC_modelGraphics.Rotatef(angle,x,y,z); }
U0 glLightModelf(U32 name,F32 value) { if(!MC_modelGraphics.LightModelf)MCModelMissing();MC_modelGraphics.LightModelf(name,value); }
#define GL_CULL_FACE 0x0B44
#define GL_ALPHA_TEST 0x0BC0
#define GL_LIGHT_MODEL_TWO_SIDE 0x0B52
#define GL_POLYGON_OFFSET_FILL 0x8037
class MCModelEntity { Bool isMob; I32 useItemDuration,useAnimation; F32 headEatPosition,headEatAngle; };
#endif
