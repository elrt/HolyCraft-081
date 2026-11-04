class FlyingMob {MCFlyingHost015 *host;Bool onGround;F32 posX,posZ,prevX,prevZ,minY,motionX,motionY,motionZ,field168,field16C,field170;};
U0 FlyingMob_Init(FlyingMob *,MCFlyingHost015 *);U0 FlyingMob_causeFallDamage(FlyingMob *,F32);Bool FlyingMob_onLadder(FlyingMob *);U0 FlyingMob_travel(FlyingMob *,F32,F32);
