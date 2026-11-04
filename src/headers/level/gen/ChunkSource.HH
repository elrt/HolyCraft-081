// Abstract callbacks corresponding to ChunkSource's virtual interface.
class MCChunkSource012 {U0 *host;Bool (*hasChunk)(U0 *,I32,I32);U0 *(*getChunk)(U0 *,I32,I32);U0 *(*create)(U0 *,I32,I32);U0 (*postProcess)(U0 *,U0 *,I32,I32);Bool (*tick)(U0 *);Bool (*shouldSave)(U0 *);U0 (*saveAll)(U0 *,Bool);U0 (*getMobsAt)(U0 *,U0 *,I32,I32,I32,MCVector *);U8 *(*gatherStats)(U0 *);};
