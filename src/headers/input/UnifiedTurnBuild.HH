// Batch026 partial source API; not original C++ ABI.
class MCTurnAdapter026 {ITurnInput base;UnifiedTurnBuild *owner;};
class MCBuildAdapter026 {IBuildInput base;UnifiedTurnBuild *owner;};
class UnifiedTurnBuild {MCTurnAdapter026 turn;MCBuildAdapter026 build;IInputHolder *holder;Options *options;RectangleArea screen,movement,hotbar;MCVector points,events;Player *player;I32 mode,state;F32 lastX,lastY,distance,threshold,sensitivity;F64 now,started,pressedAt;Bool wasTouch,used,canUse,movingUse;U0 *context;Bool (*canUseMoving)(U0*,Player*);};
F32 UnifiedTurnBuild_smooth(F32 current,F32 target);
F32 UnifiedTurnBuild_getSpeedSquared(Entity *e);
Bool UnifiedTurnBuild_inside(UnifiedTurnBuild *s,I32 x,I32 y);
U0 UnifiedTurnBuild_onConfigChanged(UnifiedTurnBuild *s,I32 w,I32 h);
U0 UnifiedTurnBuild_getTurnDelta(UnifiedTurnBuild *s,Vec3 *out);
Bool UnifiedTurnBuild_tickBuild(UnifiedTurnBuild *s,Player *player,BuildActionIntention *intent);
U0 UnifiedTurnBuild_turnDispatch(ITurnInput *base,Vec3 *out);
Bool UnifiedTurnBuild_buildDispatch(IBuildInput *base,U0 *player,BuildActionIntention *intent);
U0 UnifiedTurnBuild_Init(UnifiedTurnBuild *s,IInputHolder *holder,Options *options,I32 w,I32 h,F64 now);
U0 UnifiedTurnBuild_feed(UnifiedTurnBuild *s,MCTouch026 *points,I32 n,MCTouchEvent026 *events,I32 count,F64 now);
U0 UnifiedTurnBuild_Destroy(UnifiedTurnBuild *s);
