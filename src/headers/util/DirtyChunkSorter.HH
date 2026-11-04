// Batch 009: minecraftpe/headers/util/DirtyChunkSorter.hpp
// Chunk positions and visibility are projected from RenderChunk by the host.
class MCDirtyRenderChunk009 { I32 blockX,blockY,blockZ,field_48;Bool isInFrustumMaybe; };
class DirtyChunkSorter { MCPacketEntity009 *entity; };
Bool DirtyChunkSorter_less(DirtyChunkSorter *s,MCDirtyRenderChunk009 *a,MCDirtyRenderChunk009 *b);
