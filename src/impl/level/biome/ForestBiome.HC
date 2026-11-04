// Batch 008: inline original constructor/tree override (original .cpp only includes header).
U0 ForestBiome_Init(ForestBiome *self) { Biome_Init(&self->base);self->base.variant=MC_BIOME_FOREST; }
