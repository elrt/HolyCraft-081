// Batch035: remaining single-player mechanics of MCPE 0.8.1 on top of batch034:
// BowItem (charge/release, launch power, critical arrows, arrow pickup), Snowball/ThrownEgg (Throwable),
// Painting/HangingEntity/HangingEntityItem + PaintingRenderer, NetherReactor + NetherReactorTileEntity,
// burning/fire/cactus/suffocation damage (Entity::baseTick, Mob::baseTick, CactusTile::entityInside),
// IceTile/TopSnowTile/RedStoneOreTile/Mushroom/CactusTile/ReedTile tick + survival rules,
// BowlFoodItem (mushroom stew), ItemInHandRenderer::renderFire overlay.
#define MC35_MAXPAINT 256
#define MC35_MAXTHROW 64
#define MC35_MAXBIT 256
#define MC35_MAXREACT 8
#define MC35_PREC 20
#define MC35_RREC 28
class MC35Paint {I32 tx,ty,tz,dir,motive,survive;F32 x,y,z,yaw;AABB box;Bool removed;};
class MC35Throw {F32 x,y,z,px,py,pz,mx,my,mz;I32 item,air;Bool removed;};
class MC35Bit {F32 x,y,z,px,py,pz,mx,my,mz,u0,v0,u1,v1,size;I32 life,age;};
class MC35Reactor {I32 x,y,z,progress,level;Bool init,finished;};
MC35Paint g35_paint[MC35_MAXPAINT];I32 g35_paintN,g35_paintSel=-1;
MC35Throw g35_throw[MC35_MAXTHROW];I32 g35_throwN;
MC35Bit g35_bit[MC35_MAXBIT];I32 g35_bitN;
MC35Reactor g35_react[MC35_MAXREACT];I32 g35_reactN;
Bool g35_using,g35_nightMode,g35_texTried;I32 g35_useTicks,g35_demo,g35_shots,g35_mobHits,g35_pickups;U32 g35_artTex;
MCApp028 *g35_app;
Bool MC035_SaveNBT(MCApp028 *s,U8 *stage);
I32 MC35_ImportNBT(MCApp028 *s);
I32 MC035_UseOn(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face);
I32 MC035_UseHeld(MCApp028 *s,ItemInstance *held);
Bool MC035_TileUse(MCApp028 *s,I32 x,I32 y,I32 z);
U0 MC035_RandomTick(MCApp028 *s,I32 x,I32 y,I32 z);
U0 MC035_Neighbor(MCApp028 *s,I32 x,I32 y,I32 z,I32 id);
Bool MC035_Drops(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
U0 MC035_Input(MCApp028 *s);
U0 MC035_Tick(MCApp028 *s);
U0 MC035_Pick(MCApp028 *s);
U0 MC035_Render(MCApp028 *s,F32 pt);
U0 MC035_BowPose(F32 pt);
U0 MC035_CameraShot(MCApp028 *s);
U0 MC035_ItemAnim(MCApp028 *s);
U0 MC035_AnimMode(MCApp028 *s,I32 mode);
I32 MC035_GetAnimMode();
I32 MC035_CompassFrame(MCApp028 *s);
I32 MC035_ClockFrame(MCApp028 *s);
U0 MC035_TessLiquid(MCApp028 *s,MCRenderTile027 *v,I32 id,I32 meta,I32 x,I32 y,I32 z);
U0 MC035_Overlay(MCApp028 *s,F32 pt);
Bool MC035_Save(MCApp028 *s,U8 *stage);
Bool MC035_Start(MCApp028 *s,I32 active);
U0 MC035_Clear();
I32 MC035_BowFrame();
Bool MC035_ArrowMobs(MCApp028 *s,MC34Arrow *a,F32 sp,F32 t);
_extern glTexSubImage2D U0 G35_TexSubImage2D(U32,I32,I32,I32,I32,I32,U32,U32,U0*);
// FallingTile (HeavyTile::checkSlide -> entity)
#define MC35_MAXFALL 128
#define MC35_MAXCAM 8
class MC35Cam {F32 x,y,z,px,py,pz,yaw,pitch;I32 timer,hp;Bool armed,removed;};
MC35Cam g35_cam[MC35_MAXCAM];I32 g35_camN,g35_camSel=-1,g35_shotCam=-1,g35_photos;Bool g35_shooting;
U0 MC035_ShotView(MCApp028 *s,Vec3 *eye,Vec3 *target);
#define MC35_FREC 28
class MC35Fall {F32 x,y,z,py,my;I32 id,meta,time;Bool removed;};
MC35Fall g35_fall[MC35_MAXFALL];I32 g35_fallN,g35_landed;
Bool MC035_Fall(MCApp028 *s,I32 x,I32 y,I32 z,I32 id);
Bool MC35_FallFree(I32 id){return !id || id==51 || (id>=8 && id<=11);}
U0 MC035_TessCubeAO(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z);
F32 g35_clickY;
Bool MC35_IsStairs(I32 id);
U0 MC035_StairTess(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z);
I32 MC035_StairPlaced(MCApp028 *s,I32 face,F32 clickY);
Bool MC35_MultiHook(U0 *lvl,I32 id,I32 x,I32 y,I32 z,AABB *box,MCVector *out);
U0 MC35_StairDemo(MCApp028 *s,I32 t);
U0 MC035_Probe(MCApp028 *s);
U0 MC035_TessCactus(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z);
U0 MC035_TessFire(MCApp028 *s,I32 x,I32 y,I32 z);
U0 MC35_FireTexTick();
U0 MC35_FireTexUpload(MCApp028 *s);
