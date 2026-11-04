// Batch 003. Source: minecraftpe/headers/Timer.hpp
#ifndef MCPE_HEADERS_TIMER_HPP
#define MCPE_HEADERS_TIMER_HPP
I32 MC_TimerTimeMs() { return (MC_GetTimeS()*1000)(I32); }
class Timer { F32 ticksPerSecond; I32 ticks; F32 field_8,timeScale,passedTime,lastTime; I32 lastMs,lastMsSysTime; F32 adjustTime; };
U0 Timer_advanceTime(Timer *self) {I32 nowMs = MC_TimerTimeMs ( ) ;
 I32 passedMs = nowMs - self -> lastMs ;
 if ( passedMs <= 1000 ) {
 if ( passedMs >= 0 ) goto LABEL_7 ;
 
}
 else {
 I32 v4 = nowMs - self -> lastMsSysTime ;
 if ( ! v4 ) {
 v4 = 1 ;
 passedMs = 1 ;
 
}
 self -> adjustTime += ( ( ( (passedMs)(F32) / (v4)(F32) ) - self -> adjustTime ) * 0.2 ) ;
 
}
 self -> lastMs = nowMs ;
 self -> lastMsSysTime = nowMs ;
 LABEL_7 : F32 adjustTime = self -> adjustTime ;
 F32 v6 = (nowMs)(F32) / 1000 ;
 F32 v7 = v6 - self -> lastTime ;
 self -> lastTime = v6 ;
 F32 passedSeconds = v7 * adjustTime ;
 if ( passedSeconds < 0 ) passedSeconds = 0 ;
 else if ( passedSeconds > 1 ) passedSeconds = 1 ;
 F32 v9 = self -> passedTime + ( ((passedSeconds * self -> timeScale))(F32) * self -> ticksPerSecond ) ;
 I32 v10 = (v9)(I32) ;
 self -> ticks = (v9)(I32) ;
 F32 v11 = v9 - ((v9)(I32))(F32) ;
 self -> passedTime = v11 ;
 self -> field_8 = v11 ;
 if ( v10 > 10 ) self -> ticks = 10 ;
}

#endif

