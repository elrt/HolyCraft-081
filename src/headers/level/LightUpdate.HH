// Batch023: level/LightUpdate; explicit simulation ABI, see docs/BATCH023.md.
class LightUpdate {I32 layer,x1,y1,z1,x2,y2,z2;};
U0 LightUpdate_Init(LightUpdate*,I32,I32,I32,I32,I32,I32,I32);Bool LightUpdate_expandToContain(LightUpdate*,I32,I32,I32,I32,I32,I32);I32 LightUpdate_update(LightUpdate*,MCWorld023*);
