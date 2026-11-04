// Batch033: day/night cycle (NormalDayCycleDimension + LevelRenderer sky/sun/moon/stars/clouds), beds (sleeping),
// ChestRenderer/ChestModel, ItemInHandRenderer, third-person camera + PlayerRenderer/HumanoidModel, armor
// (ArmorItem / ArmorScreen / Gui armor bar / Mob::getDamageAfterArmorAbsorb).
#define G33S_ARMOR 15
#define G33S_BED 16
I32 g33_skyDarken=0;F32 g33_ramp[16];
F32 MC033_Tod(MCApp028 *s,F32 pt);
U0 MC033_Tick(MCApp028 *s);
U0 MC033_Swing();
U0 MC033_ItemUsed();
U0 MC033_Camera(MCApp028 *s,Vec3 *eye,Vec3 *target,F32 pt);
U0 MC033_ClearColor(MCApp028 *s,F32 pt);
U0 MC033_FogColor(MCApp028 *s,F32 pt,F32 *fog);
U0 MC033_Sky(MCApp028 *s,F32 pt);
U0 MC033_Clouds(MCApp028 *s,F32 pt);
U0 MC033_RenderTE(MCApp028 *s,F32 pt);
U0 MC033_RenderPlayer(MCApp028 *s,F32 pt);
U0 MC033_Hand(MCApp028 *s,F32 pt);
U0 MC033_Overlay(MCApp028 *s);
Bool MC033_ChestUse(MCApp028 *s,I32 x,I32 y,I32 z);
Bool MC033_BedUse(MCApp028 *s,I32 x,I32 y,I32 z,I32 m);
Bool MC033_Sleeping(MCApp028 *s);
U0 MC033_LeaveBed(MCApp028 *s);
Bool MC033_Hurt(Player *p,Entity *attacker,I32 damage,Bool hostile);
U0 MC033_ArmorHud(MCApp028 *s);
U0 MC033_ArmorInit(MCApp028 *s);
U0 MC033_ArmorOpen(MCApp028 *s);
U0 MC033_ArmorPress(MCApp028 *s);
U0 MC033_ArmorRelease(MCApp028 *s);
U0 MC033_ArmorMove();
U0 MC033_ArmorWheel(I32 a);
U0 MC033_ArmorRender(MCApp028 *s,F32 pt);
U0 MC033_BedInit(MCApp028 *s);
U0 MC033_BedPress(MCApp028 *s);
U0 MC033_BedRelease(MCApp028 *s);
U0 MC033_BedRender(MCApp028 *s);
