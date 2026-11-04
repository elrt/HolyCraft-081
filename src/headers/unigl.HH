// GL math in HolyC. No native context is created by these functions.
class MCGlLookup027 {U0 *context;U0 *(*lookup)(U0*,U8*);U0 (*multMatrix)(U0*,F32*);U0 *deleteBuffers,*genBuffers,*bindBuffer,*bufferData;};
Bool initGlFuncs(MCGlLookup027 *host);Bool gluPerspective027(MCGlLookup027 *host,F32 fovy,F32 aspect,F32 nearZ,F32 farZ);I32 anGenBuffers(I32 count,U32 *out);
U0 MultiplyMatrices4by4OpenGL_FLOAT(F32*,F32*,F32*);U0 MultiplyMatrixByVector4by4OpenGL_FLOAT(F32*,F32*,F32*);I32 glhInvertMatrixf2(F32*,F32*);I32 glhUnProjectf(F32,F32,F32,F32*,F32*,I32*,F32*);
