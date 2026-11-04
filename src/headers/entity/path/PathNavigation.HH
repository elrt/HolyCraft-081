// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class PathNavigation {MCBody023 *mob;PathFinder finder;Path *path;F32 range,speed;I32 ticks,lastTick;Vec3 lastPos;Bool avoidSun;U0 *ctx;U0 (*wanted)(U0*,F32,F32,F32,F32);};

U0 PathNavigation_Init(PathNavigation *s,MCBody023 *mob,MCWorld024 *world,F32 range);
U0 PathNavigation_stop(PathNavigation *s);
U0 PathNavigation_Destroy(PathNavigation *s);
Bool PathNavigation_canUpdatePath(PathNavigation *s);
I32 PathNavigation_getSurfaceY(PathNavigation *s);
Bool PathNavigation_moveToPath(PathNavigation *s,Path *p,F32 speed);
Bool PathNavigation_moveTo(PathNavigation *s,F32 x,F32 y,F32 z,F32 speed);
Bool PathNavigation_canWalkOn(PathNavigation *s,I32 x,I32 y,I32 z,I32 width,I32 height,I32 depth,Vec3 *from,F32 dx,F32 dz);
Bool PathNavigation_canMoveDirectly(PathNavigation *s,Vec3 *from,Vec3 *to,I32 width,I32 height,I32 depth);
U0 PathNavigation_tick(PathNavigation *s);
