// Batch 003. Source: minecraftpe/headers/util/input/RakDataInput.hpp
#ifndef MCPE_HEADERS_UTIL_INPUT_RAKDATAINPUT_HPP
#define MCPE_HEADERS_UTIL_INPUT_RAKDATAINPUT_HPP
class RakDataInput : BytesDataInput { MCBitStream *stream; };
Bool RakDataInput_ReadBytes(IDataInput *base,U0 *bytes,I32 count) { RakDataInput *self=base;if(count<0 || (self->stream->bits-self->stream->readBit)/8<count){base->failed=TRUE;return FALSE;}return MCBitStream_ReadRaw(self->stream,bytes,count); }
I32 RakDataInput_BytesLeft(IDataInput *base) { RakDataInput *self=base;return (self->stream->bits-self->stream->readBit)/8; }
U0 RakDataInput_Init(RakDataInput *self,MCBitStream *stream) { BytesDataInput_Init(self,&RakDataInput_ReadBytes,&RakDataInput_BytesLeft);self->stream=stream; }

#endif

