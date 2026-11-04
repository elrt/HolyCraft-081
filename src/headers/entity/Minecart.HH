// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Minecart {Entity entity;F32 damage;I32 hurtTime,hurtDir,displayPacked,displayId,displayOffset;Bool customDisplay;MCString customName;};

U0 Minecart_Init(Minecart *s,Level *level,F32 x,F32 y,F32 z);
U0 Minecart_Destroy(Minecart *s);
U0 Minecart_applyNaturalSlowdown(Minecart *s);
U0 Minecart_comeOffTrack(Minecart *s,F32 maxSpeed);
U0 Minecart_animateHurt(Minecart *s);
Bool Minecart_hurt(Minecart *s,Entity *attacker,I32 amount,Bool creative);
U0 Minecart_setDisplay(Minecart *s,I32 id,I32 data,I32 offset);
I32 Minecart_getDisplayData(Minecart *s);
I32 Minecart_getDisplayOffset(Minecart *s);
U0 Minecart_addSaveData(Minecart *s,CompoundTag *t);
U0 Minecart_readAdditionalSaveData(Minecart *s,CompoundTag *t);
