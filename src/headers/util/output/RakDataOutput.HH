// Batch 003. Source: minecraftpe/headers/util/output/RakDataOutput.hpp
#ifndef MCPE_HEADERS_UTIL_OUTPUT_RAKDATAOUTPUT_HPP
#define MCPE_HEADERS_UTIL_OUTPUT_RAKDATAOUTPUT_HPP
class RakDataOutput : BytesDataOutput { MCBitStream *stream; };
U0 RakDataOutput_WriteBytes(IDataOutput *base,U0 *bytes,I32 count) { RakDataOutput *self=base;if(count<0)exit(89);MCBitStream_WriteRaw(self->stream,bytes,count); }
U0 RakDataOutput_Init(RakDataOutput *self,MCBitStream *stream) { BytesDataOutput_Init(self,&RakDataOutput_WriteBytes);self->stream=stream; }

#endif

