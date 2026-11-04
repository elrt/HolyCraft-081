// Batch 002. Source: minecraftpe/impl/util/input/IDataInput.cpp
Bool IDataInput_hasBytesLeft(IDataInput *self,I32 count) { return IDataInput_numBytesLeft(self)>=count; }
