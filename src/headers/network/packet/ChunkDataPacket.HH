#ifndef MC021_NETWORK_PACKET_CHUNKDATAPACKET
#define MC021_NETWORK_PACKET_CHUNKDATAPACKET
class MCChunkView021 {U8 *updateMap,*tiles,*meta;I64 updateBytes,tileBytes,metaBytes;};
class ChunkDataPacket: Packet {I32 xPos,zPos;MCBitStream stream;MCChunkView021 chunk;};
U0 ChunkDataPacket_Destroy(Packet *base);
U0 ChunkDataPacket_write(Packet *base,MCBitStream *stream);
U0 ChunkDataPacket_read(Packet *base,MCBitStream *stream);
U0 ChunkDataPacket_Init(ChunkDataPacket *s);
U0 ChunkDataPacket_InitChunk(ChunkDataPacket *s,I32 x,I32 z,MCChunkView021 *chunk);

U0 ChunkDataPacket_Destroy(Packet *base) {ChunkDataPacket *s=base;MCBitStream_Destroy(&s->stream);}
U0 ChunkDataPacket_write(Packet *base,MCBitStream *stream) {ChunkDataPacket *s=base;if(!s->chunk.updateMap || !s->chunk.tiles || !s->chunk.meta || s->chunk.updateBytes<256 || s->chunk.tileBytes<32768 || s->chunk.metaBytes<16384){stream->failed=TRUE;return;}MCBitStream_WriteU8(stream,PID_CHUNK_DATA_PACKET);MCBitStream_WriteI32(stream,s->xPos);MCBitStream_WriteI32(stream,s->zPos);MCBitStream_Destroy(&s->stream);I32 v,i;for(v=0;v<256;v++){U8 mask=s->chunk.updateMap[v];MCBitStream_WriteU8(&s->stream,mask);if(mask)for(i=0;i<8;i++)if((mask>>i)&1){I32 index=(((v&15)<<11)|((v>>4)<<7))+16*i;MCBitStream_WriteRaw(&s->stream,s->chunk.tiles+index,16);MCBitStream_WriteRaw(&s->stream,s->chunk.meta+(index>>1),8);}}MC021_TransferBits(stream,&s->stream);}
U0 ChunkDataPacket_read(Packet *base,MCBitStream *stream) {ChunkDataPacket *s=base;MCBitStream_ReadI32(stream,&s->xPos);MCBitStream_ReadI32(stream,&s->zPos);MCBitStream_Destroy(&s->stream);if(!stream->failed)MC021_TransferBits(&s->stream,stream);}
U0 ChunkDataPacket_Init(ChunkDataPacket *s) {memset(s,0,sizeof(ChunkDataPacket));Packet_Init(s);s->packetId=PID_CHUNK_DATA_PACKET;s->writeFn=&ChunkDataPacket_write;s->readFn=&ChunkDataPacket_read;s->destroyFn=&ChunkDataPacket_Destroy;MCBitStream_Init(&s->stream);}
U0 ChunkDataPacket_InitChunk(ChunkDataPacket *s,I32 x,I32 z,MCChunkView021 *chunk) {ChunkDataPacket_Init(s);s->xPos=x;s->zPos=z;s->chunk=*chunk;}

#endif
