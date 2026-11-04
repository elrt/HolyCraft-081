// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class MobRenderer {MCG020 *graphics;U0 *model,*armorModel;};

U0 MobRenderer_Init(MobRenderer *s,MCG020 *g,U0 *model);
F32 MobRenderer_lerpRotation(F32 previous,F32 current,F32 partial);
U0 MobRenderer_setupPosition(MobRenderer *s,F32 x,F32 y,F32 z);
U0 MobRenderer_setupRotations(MobRenderer *s,F32 bodyYaw,I32 deathTime,F32 partial,F32 flip);
F32 MobRenderer_getBob(I32 ticks,F32 partial);
U0 MobRenderer_setArmor(MobRenderer *s,U0 *model);
