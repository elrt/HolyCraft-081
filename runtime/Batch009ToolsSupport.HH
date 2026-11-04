#ifndef MCPE_BATCH009_TOOLS_SUPPORT
#define MCPE_BATCH009_TOOLS_SUPPORT
class MCToolTier009 { I32 level,durability;F32 efficiencyMultiplier;I32 damageAgainstEntity; };
class MCToolTile009 { I32 id;Material *material; };
class MCToolTiles009 {
 MCToolTile009 *wood,*bookshelf,*treeTrunk,*chest,*woodSlab,*woodSlabHalf;
 MCToolTile009 *stoneBrick,*stoneSlab,*stoneSlabHalf,*rock,*sandStone,*mossStone,*ironOre,*ironBlock,*coalOre,*goldBlock,*goldOre,*emeraldOre,*emeraldBlock,*ice,*lapisOre,*lapisBlock,*redStoneOre,*redStoneOre_lit,*obsidian,*glowingObsidian;
 MCToolTile009 *grass,*dirt,*sand,*gravel,*topSnow,*snow,*clay,*farmland,*web,*leaves,*cloth;
 Material *woodMaterial,*stoneMaterial,*metalMaterial;
};
#endif
