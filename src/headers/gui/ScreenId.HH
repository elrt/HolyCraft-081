// Port batch 001. Upstream: minecraftpe/headers/gui/ScreenId.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_GUI_SCREENID_HPP
#define MCPE_HEADERS_GUI_SCREENID_HPP
// ScreenId: represented as I32, not a C++ enum type.
#define NONE_SCREEN 0
#define START_MENU_SCREEN 1
#define JOIN_GAME_SCREEN 2
#define PAUSE_SCREEN_0 3
#define PAUSE_SCREEN_1 4
#define SELECT_WORLD_SCREEN 5
#define INVENTORY_SCREEN 6
#define CHAT_SCREEN 7
#endif

