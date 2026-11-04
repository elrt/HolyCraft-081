// Batch 008: inline original constructor (original .cpp only includes the header).
U0 FlatBiome_Init(FlatBiome *self) { Biome_Init(&self->base);self->base.variant=MC_BIOME_FLAT; }
