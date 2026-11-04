// Implementation is inline in the original header; .cpp contains only its include.
F32 NormalDayCycleDimension_getTimeOfDay(I64 time,F32 partial){F32 v3=((time%19200)(F32)+partial)/19200.0-0.25,v4;if(v3<0)v3+=1;if(v3>1)v3-=1;v4=1.0-(cos((v3*3.1416)(F32))+1.0)*0.5;return v3+(v4-v3)/3.0;}
