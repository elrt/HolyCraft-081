// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MCTexture024 {MCString name;MCImage024 image;U32 id;Bool clamp;};
class Textures {MCTextureBackend024 *host;MCVector entries;U32 current;I32 changes;};

U0 Textures_Init(Textures *s,MCTextureBackend024 *host);
U0 Textures_bind(Textures *s,U32 id);
U32 Textures_loadTexture(Textures *s,U8 *name,Bool clamp);
U0 Textures_clear(Textures *s,Bool all);
U0 Textures_Destroy(Textures *s);
I32 Textures_smoothBlend(I32 a,I32 b);
I32 Textures_crispBlend(I32 a,I32 b);
