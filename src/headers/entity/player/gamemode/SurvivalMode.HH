// Batch023: entity/player/gamemode/SurvivalMode; explicit simulation ABI, see docs/BATCH023.md.
class SurvivalMode: GameMode {I32 currentX,currentY,currentZ;};
U0 SurvivalMode_Init(SurvivalMode*,MCWorld023*,MCPlayer023*);U0 SurvivalMode_startDestroyBlock(SurvivalMode*,I32,I32,I32,I32);Bool SurvivalMode_destroyBlock(SurvivalMode*,I32,I32,I32,I32);U0 SurvivalMode_continueDestroyBlock(SurvivalMode*,I32,I32,I32,I32);U0 SurvivalMode_stopDestroyBlock(SurvivalMode*);U0 SurvivalMode_initAbilities(Abilities*);
