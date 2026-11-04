// Original implementation is inline in LevelConverters.hpp.
Bool LevelConverters_v1_ClothIdToClothData(U8 *tiles,U8 *data,U8 clothID){I32 i,v,old,colour;Bool changed=FALSE;for(i=0;i<0x8000;i++){v=tiles[i];if(v>=101 && v<=115){tiles[i]=clothID;colour=116-v;old=data[i>>1];if(i&1)data[i>>1]=(old&15)|(colour<<4);else data[i>>1]=(old&240)|colour;changed=TRUE;}}return changed;}
