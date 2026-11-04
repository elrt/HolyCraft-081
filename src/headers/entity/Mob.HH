// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Mob {Entity entity;F32 speed,walkingModifier,jumpMovementFactor,horizontalDrag;I32 hurtTime,invulnerableTime,invulnerabilityDuration,lastDamage,previousHealth,deathTime,baseType,growingAge;Bool onLadder,jumping;};

U0 Mob_Init(Mob *s,Level *level,I32 type);
F32 Mob_groundFriction(Mob *s);
U0 Mob_travel(Mob *s,F32 strafe,F32 forward);
U0 Mob_jumpFromGround(Mob *s);
U0 Mob_knockback(Mob *s,F32 dx,F32 dz);
Bool Mob_hurt(Mob *s,Entity *attacker,I32 damage);
U0 Mob_tickTimers(Mob *s);
U0 Mob_addSaveData(Mob *s,CompoundTag *t);
Bool Mob_load(Mob *s,CompoundTag *t);
