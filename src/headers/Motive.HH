// Batch 003. Source: minecraftpe/headers/Motive.hpp
#ifndef MCPE_HEADERS_MOTIVE_HPP
#define MCPE_HEADERS_MOTIVE_HPP
class Motive { MCString name; I32 w,h,uo,vo; Bool isUsed; };
extern Motive Motive_Kebab;
extern Motive Motive_Aztec;
extern Motive Motive_Alban;
extern Motive Motive_Aztec2;
extern Motive Motive_Bomb;
extern Motive Motive_Plant;
extern Motive Motive_Wasteland;
extern Motive Motive_Pool;
extern Motive Motive_Courbet;
extern Motive Motive_Sea;
extern Motive Motive_Sunset;
extern Motive Motive_Creebet;
extern Motive Motive_Wanderer;
extern Motive Motive_Graham;
extern Motive Motive_Match;
extern Motive Motive_Bust;
extern Motive Motive_Stage;
extern Motive Motive_Void;
extern Motive Motive_SkullAndRoses;
extern Motive Motive_Fighters;
extern Motive Motive_Pointer;
extern Motive Motive_Pigscene;
extern Motive Motive_BurningSkull;
extern Motive Motive_Skeleton;
extern Motive Motive_DonkeyKong;
extern Motive Motive_Earth;
extern Motive Motive_Wind;
extern Motive Motive_Fire;
extern Motive Motive_Water;
extern Motive *Motive_DefaultImage;
U0 Motive_Init(Motive *self,MCString *name,I32 w,I32 h,I32 uo,I32 vo,Bool used);
U0 Motive_Destroy(Motive *self) { MCString_Destroy(&self->name); }
U0 Motive_InitRegistry(); U0 Motive_DestroyRegistry();
U0 Motive_getAllMotivesAsList(MCPtrVector *out);
Motive *Motive_getMotiveByName(MCString *name);

#endif

