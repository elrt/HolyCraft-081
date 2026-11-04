// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class MCTouchRect025 {F32 x,y,xx,yy;};
class MCTouchPoint025 {I32 id;F32 x,y;Bool pressed,released;};
class TouchscreenInput {IMoveInput base;Options *options;MCTouchRect025 movement,zones[8];MCVector points;Bool buttons[8],previousJump,stick,previousStickJump,jumpOrigin,flightMode;MCUI025 *ui;};

U0 MC025_TouchRect(MCTouchRect025 *r,F32 x,F32 y,F32 xx,F32 yy);
Bool MC025_Inside(MCTouchRect025 *r,F32 x,F32 y);
U0 TouchscreenInput_onConfigChanged(TouchscreenInput *s,I32 width,I32 height,F32 pixelsPerMm,F32 guiScale);
I32 TouchscreenInput_zone(TouchscreenInput *s,F32 x,F32 y);
U0 TouchscreenInput_tickBase(IMoveInput *base,U0 *player);
U0 TouchscreenInput_releaseBase(IMoveInput *base);
U0 TouchscreenInput_Init(TouchscreenInput *s,Options *options,MCUI025 *ui,I32 width,I32 height,F32 pixelsPerMm,F32 guiScale);
U0 TouchscreenInput_feed(TouchscreenInput *s,MCTouchPoint025 *points,I32 n);
Bool TouchscreenInput_isButtonDown(TouchscreenInput *s,I32 id);
U0 TouchscreenInput_Destroy(TouchscreenInput *s);
