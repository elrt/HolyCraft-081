// Batch034: hostile mobs (Monster/Zombie/Skeleton/Spider/Creeper/PigZombie + Arrow), signs (SignTile/SignItem/
// SignTileEntity/SignRenderer/TextEditScreen), rails + minecart (BaseRailTile rail logic, RailRenderer, Minecart,
// MinecartRenderer/MinecartModel, riding) and connected fences / cobblestone walls / panes (tesselateFenceInWorld,
// tesselateWallInWorld, tesselateThinFenceInWorld) on top of batch033.
#define G34S_SIGN 17
#define MC34_MAXSIGN 256
#define MC34_MAXCART 64
#define MC34_MAXARROW 128
class MC34Sign {I32 x,y,z;U8 text[64];};
class MC34Cart {F32 x,y,z,px,py,pz,mx,my,mz,yaw,pyaw,pitch,ppitch,damage;I32 hurtTime,hurtDir,id;Bool reverse,removed,onGround,hcol;};
class MC34Arrow {F32 x,y,z,px,py,pz,mx,my,mz,yaw,pyaw,pitch,ppitch;I32 life,shake,gx,gy,gz,gt,gd;Bool inGround,removed,fromPlayer,crit;};
MC34Sign *g34_sign[MC34_MAXSIGN];I32 g34_signN;MC34Sign *g34_edit;I32 g34_editLine;
MC34Cart g34_cart[MC34_MAXCART];I32 g34_cartN,g34_cartSel=-1,g34_ride=-1,g34_cartIds;
MC34Arrow g34_arrow[MC34_MAXARROW];I32 g34_arrowN;
F32 g34_rideFw,g34_rideSt;I32 g34_demo;MCApp028 *g34_app;
U0 MC034_Tick(MCApp028 *s);
U0 MC034_Render(MCApp028 *s,F32 pt);
U0 MC034_Clear();
Bool MC034_Start(MCApp028 *s,I32 active);
Bool MC034_Save(MCApp028 *s,U8 *stage);
U0 MC034_RideInput(MCApp028 *s);
U0 MC034_PickCart(MCApp028 *s);
U0 MC034_CartInput(MCApp028 *s);
U0 MC034_Camera(MCApp028 *s,Vec3 *eye,Vec3 *target,F32 pt);
Bool MC034_Command(MCApp028 *s,U8 *text);
I32 MC034_UseOn(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face);
Bool MC034_Tess(MCApp028 *s,MCRenderTile027 *v,I32 id,I32 meta,I32 x,I32 y,I32 z);
I32 MC034_Shape(MCApp028 *s,I32 id,I32 x,I32 y,I32 z,Bool collision,F32 *b);
U0 MC034_WillDestroy(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
Bool MC034_Drops(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta);
U0 MC034_SignInit(MCApp028 *s);
U0 MC034_SignPress(MCApp028 *s);
U0 MC034_SignRelease(MCApp028 *s);
U0 MC034_SignRender(MCApp028 *s);
U0 MC034_SignKey(MCApp028 *s,I32 k);
U0 MC034_SignChars();
U0 MC034_SignClose(MCApp028 *s);
