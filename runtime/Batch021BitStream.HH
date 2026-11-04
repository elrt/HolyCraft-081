#ifndef MCPE_BATCH021_BITSTREAM
#define MCPE_BATCH021_BITSTREAM
// RakNet::BitStream::Write(BitStream&) transfers unread bits and advances source.
U0 MC021_TransferBits(MCBitStream *dst,MCBitStream *src) {Bool bit;while(src->readBit<src->bits){MCBitStream_ReadBool(src,&bit);MCBitStream_WriteBool(dst,bit);}}
#endif
