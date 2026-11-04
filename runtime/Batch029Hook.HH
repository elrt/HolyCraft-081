// Batch029 touch-ray hook used by Batch029Game.HC (generated from Batch028Game.HC).
// g29_dirMode: 0 = view direction (mouse-look / crosshair), 1 = ray through the touch point, 2 = no touch -> no pick.
I32 g29_dirMode=0;
F32 g29_rayX=0,g29_rayY=0,g29_rayZ=1;
Bool g29_workbenchOpen=FALSE;Bool g29_stonecutterOpen=FALSE;
// Touch D-pad (TouchscreenInput::tick) results consumed by MC028_Tick in Batch029Game.HC.
Bool g29_touchOn=FALSE;
F32 g29_tStrafe=0,g29_tForward=0;
Bool g29_tJump=FALSE,g29_tFlyUp=FALSE,g29_tFlyDown=FALSE;
// Fog / section cull distance driven by options.renderDistance (Batch029Screens MC029_ApplyViewDistance).
F32 g29_fogFar=64;
I32 g29_meshR=3;
