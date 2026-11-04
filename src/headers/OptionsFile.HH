// Batch 003. Source: minecraftpe/headers/OptionsFile.hpp
#ifndef MCPE_HEADERS_OPTIONSFILE_HPP
#define MCPE_HEADERS_OPTIONSFILE_HPP
class OptionsFile { MCString filename; };
U0 OptionsFile_Init(OptionsFile *self) { MCString_Init(&self->filename); }
U0 OptionsFile_Destroy(OptionsFile *self) { MCString_Destroy(&self->filename); }
U0 OptionsFile_setSettingsFolderPath(OptionsFile *self,MCString *folder);
U0 OptionsFile_save(OptionsFile *self,MCVector *strings);
U0 OptionsFile_getOptionStrings(OptionsFile *self,MCVector *out);

#endif

