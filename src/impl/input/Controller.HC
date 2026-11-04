// Batch 002. Source: minecraftpe/impl/input/Controller.cpp
F32 Controller_stickValuesX[2],Controller_stickValuesY[2]; Bool Controller_isTouchedValues[2];
F32 Controller_linearTransform(F32 value,F32 deadzone,F32 scale,Bool clamp) {
 if(value<0) deadzone=-deadzone; if(fabsf(deadzone)>=fabsf(value)) return 0;
 F32 out=(value-deadzone)*scale; if(clamp && fabsf(out)>1) { if(out>0) return 1; return -1; } return out;
}
Bool Controller_isValidStick(I32 stick) { return (stick-1)(U32)<=1; }
F32 Controller_getTransformedY(I32 stick,F32 deadzone,F32 scale,Bool clamp) { if(!Controller_isValidStick(stick)) return 0; return Controller_linearTransform(Controller_stickValuesY[stick-1],deadzone,scale,clamp); }
F32 Controller_getTransformedX(I32 stick,F32 deadzone,F32 scale,Bool clamp) { if(!Controller_isValidStick(stick)) return 0; return Controller_linearTransform(Controller_stickValuesX[stick-1],deadzone,scale,clamp); }
F32 Controller_getY(I32 stick) { if(Controller_isValidStick(stick)) return Controller_stickValuesY[stick-1]; return 0; }
F32 Controller_getX(I32 stick) { if(Controller_isValidStick(stick)) return Controller_stickValuesX[stick-1]; return 0; }
U0 Controller_feed(I32 stick,I32 touched,F32 x,F32 y) {
 if(!Controller_isValidStick(stick)) return; I32 v; F32 offset;
 if(x>=0) { v=1; offset=-0.64; } else { v=0; offset=0.64; }
 Controller_isTouchedValues[v]=touched!=0; Controller_stickValuesX[v]=Controller_linearTransform(x+offset,0,2.78,TRUE); Controller_stickValuesY[v]=y;
}
Bool Controller_isTouched(I32 stick) { if(Controller_isValidStick(stick)) return Controller_isTouchedValues[stick-1]; return FALSE; }

