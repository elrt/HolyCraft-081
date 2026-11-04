// Batch 008: inline original constructor (original .cpp only includes header).
U0 SwampBiome_Init(SwampBiome *self) { Biome_Init(&self->base);self->base.variant=MC_BIOME_SWAMP; }
