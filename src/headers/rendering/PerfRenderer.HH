// Batch023: rendering/PerfRenderer; explicit simulation ABI, see docs/BATCH023.md.
class PerfRenderer {F32 elapsed[512],partial[512];I32 index;F64 lastRenderedAt;MCString section;};
U0 PerfRenderer_Init(PerfRenderer*);U0 PerfRenderer_Destroy(PerfRenderer*);U0 PerfRenderer_debugFpsMeterKeyPress(PerfRenderer*,I32,MCString*,I32);Bool PerfRenderer_record(PerfRenderer*,F32,F64,Bool);U0 PerfRenderer_toPercentString(F32,MCString*);
