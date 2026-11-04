// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
class RegionFile {U0 *file;MCString path;I32 locations[1024];MCVector sectors;};

U0 RegionFile_Init(RegionFile *s,U8 *folder);
U0 RegionFile_close(RegionFile *s);
U0 RegionFile_Destroy(RegionFile *s);
U0 RegionFile_mark(RegionFile *s,I32 index,U8 state);
Bool RegionFile_open(RegionFile *s);
Bool RegionFile_readChunk(RegionFile *s,I32 x,I32 z,MCVector *out);
Bool RegionFile_write(RegionFile *s,I32 sector,MCVector *data);
Bool RegionFile_writeChunk(RegionFile *s,I32 x,I32 z,MCVector *data);
