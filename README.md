# MCPE 0.8.1 → HolyC

A port of **Minecraft: Pocket Edition 0.8.1** (C++) to **HolyC**, compiled to a native
Linux x86_64 executable with [hcc](https://github.com/Jamesbarford/holyc-lang).
Not a TempleOS port: it runs on ordinary Linux.

**Platform: Linux x86_64 only** (tested). Other platforms are not supported.

**100% HolyC, no C code.** The HolyC program calls SDL2 (window, input, audio) and
OpenGL directly. Everything else is HolyC too: world generation, blocks, lighting,
physics, chunk rendering, GUI (touch + mouse), inventory, crafting, saving (NBT),
sound mixing, mobs.

> Status: work in progress. Playable creative/survival sandbox with the original GUI and
> sounds, plus passive mobs: pig, cow, sheep, chicken (AI goals, A* path finding,
> breeding, babies, feeding/tempting, shearing, milking, eggs, loot, natural spawning,
> saving). Simple blob shadows and particles (hearts, death poof, bubbles, splash).
> Functional blocks: chests (incl. large double chests, touch UI), furnace (smelting, fuel,
> lit/unlit, touch UI), wooden/iron doors, trapdoors, fence gates, bed (sets spawn point),
> cake, TNT (flint and steel, primed TNT, explosions with chain reactions and drops),
> farming (hoe → farmland, seeds, wheat growth, bone meal, hydration), sugar cane/cactus growth.
> Container contents are saved in `tiles032.dat` inside the world folder.
> Chests use the original ChestModel (animated lid, large double chests).
> Day/night cycle: sun, moon phases, stars, clouds, sunrise colours, sky darkening of the
> world light; sleeping in a bed at night skips to morning. Player model (HumanoidModel)
> with armor layers and held item: first-person hand (swing/equip animation) and
> third-person view (F5). Armor screen (equip/unequip, armor bar in the HUD, damage
> absorption and durability).
> Hostile mobs: zombie, skeleton (bow + arrows), spider (glowing eyes, neutral by day),
> creeper (fuse + explosion), zombie pigman (neutral); burning in daylight with the
> animated FireTexture flames, night/cave spawning, difficulty-dependent damage, loot.
> Signs (standing and wall signs, text editor screen, SignRenderer text), minecarts and
> rails (curves, slopes, powered rails, riding: RMB = get in, Shift/Space = get out,
> LMB = hit/break). Fences, cobblestone walls, glass panes and iron bars connect like PE.
> Chat commands: `/summon <mob|minecart>`, `/time day|night|noon|N`, `/help`.
> Signs and minecarts are saved in `world034.dat`.
> Not yet: multiplayer, redstone.

## No Mojang files here

This repository contains **no** Minecraft textures, sounds or text (the title-screen splashes are our own). You import them
locally from **your own** copy of the original APK (`PE-a0.8.1-armv7-gb.apk`):

```sh
python3 tools/import_assets.py /path/to/PE-a0.8.1-armv7-gb.apk
```

## Prebuilt binary

Releases contain `bin/mcpe-holyc` (Linux x86_64, glibc 2.34+: Ubuntu 22.04+, Debian 12+, Fedora 35+). You still need SDL2 + OpenGL
(`sudo apt install libsdl2-2.0-0 libgl1`), zlib, libpng16 and the assets imported from your own APK:

```sh
python3 tools/import_assets.py /path/to/PE-a0.8.1-armv7-gb.apk
./scripts/run.sh
```

## Build and run

Needs: hcc 0.0.17-beta, SDL2 + OpenGL dev packages, Python 3 (only for the asset import).

```sh
sudo apt install libsdl2-dev libgl-dev    # Fedora: SDL2-devel mesa-libGL-devel
export HCC_PREFIX=/usr/local              # where hcc and lib/libtos.a are installed
./scripts/build.sh
./scripts/run.sh                          # --help for options
./scripts/test.sh                         # headless self-test
```

Controls: touch mode by default (drag = look, tap = place/use/**attack mob**, hold = break/**use item on mob**).
Options → Controls → *Use touchscreen* off gives classic mouse (LMB break/attack, RMB place/use).
Keyboard: WASD, Space, Shift, E inventory, T chat, 1–9, Q drop, F fly, F2 screenshot, F5 third-person view, F6 save, Esc.
Spawn eggs are in the creative inventory. `MCPE_MOBDEMO=1 ./scripts/run.sh` puts one adult and one
baby of each animal in front of you in a new world. `MCPE_BLOCKDEMO=scene|chest|furnace|tnt` builds a test
scene with all functional blocks in front of you. Audio: `MCPE_AUDIO=none|wav:FILE|<SDL driver>`.

## Batch 035

Добиты одиночные механики 0.8.1:
- **Лук**: натяжение (удерживать ПКМ / палец), сила и крит как в PE, расход стрел и прочности, иконки натяжения, замедление при натяжении; стрелы бьют мобов и подбираются.
- **Снежки и яйца**: бросок, отбрасывание, из яйца цыплёнок (1/8, 1/32 — четыре).
- **Грибной суп** (+8 HP → миска), размеры стаков (лук/суп 1, снежки/яйца 16).
- **Картины**: 28 сюжетов, установка на стену, проверка опоры, снятие ударом, сохраняются.
- **Ядро реактора Нижнего мира**: проверка структуры, сообщения PE, купол, светящийся обсидиан, волны предметов и свинозомби, ночной режим, финальная оболочка (только выживание).
- **Урон от среды**: огонь/лава (горение, тушение водой), кактус, удушье в блоках — для игрока и мобов; оверлей огня от первого лица.
- **Мир**: падающий песок/гравий (сущности), таяние льда и снега, светящаяся редстоун-руда, распространение и опадание грибов, кактусы и тростник без опоры ломаются.
- **Анимированные вода и лава** (порт WaterTexture/LavaTexture, а также WaterSideTexture/LavaSideTexture для течения).
- **Текущие жидкости** как в PE: наклонная поверхность по уровням (getWaterHeight), направление течения (getFlow), боковая анимированная текстура; исправлено растекание лавы (радиус 3 в обычном мире, как в оригинале).
- **3D-дроп** (порт ItemRenderer): блоки лежат вращающимися кубиками (1–4 копии в зависимости от стака), предметы — плоские спрайты, повёрнутые к камере (так и в оригинальном 0.8.1).
- **Компас и часы** анимированы (кадр компаса по точке спавна и взгляду, часы по времени суток).
- **Камера** (id 456): ставится на штатив, по нажатию отсчёт с дымом и снимок мира с её точки — `screenshots/img_NNNN.ppm`.
- **Поза рук при натяжении лука** (UseAnim BOW), частицы дыма (фитиль TNT, камера).
- **Формат сохранения PE**: в каждый снапшот пишется `entities.dat` (ENT + NBT: мобы, дроп, стрелы, снежки/яйца, картины, падающие блоки, сундуки, печки, реактор) — вместе с `level.dat`/`chunks.dat` это полноценный мир PE 0.8.1. Если собственных файлов порта нет, `entities.dat` импортируется.

- **Мир прямо из MCPE**: папку мира 0.8.1 (`level.dat` + `chunks.dat` [+ `entities.dat`]) из `games/com.mojang/minecraftWorlds/` можно просто положить в `worlds/` — она появится в списке миров и откроется (сид, режим, игрок, инвентарь, мобы, дроп, картины, сундуки, печки). Исходные файлы PE не изменяются: сохранения пишутся снапшотами рядом. Обратно: `scripts/export_pe.sh МИР ПАПКА` выгружает последнее сохранение как обычный мир PE.
- **Компас и часы как в PE**: в руке и на хотбаре — анимация, у выпавшего предмета — кадр 0, в сетке экранов инвентаря — статичная иконка (getIcon(…, true)); хотбар анимирован и при открытом инвентаре.
- Исправлено по оригиналу: `Count` предмета в NBT читается как беззнаковый байт (ссылки хотбара из level.dat PE теперь восстанавливаются); пустые ссылки хотбара (-1) больше не считаются повреждением сохранения.

- **Плавное освещение (AO)**: порт `tesselateBlockInWorldWithAmbienceOcclusion` — мягкие тени в углах и у стен для обычных блоков, грядок, заборов, стен, калиток и ступенек (светящиеся блоки, как в оригинале, без AO).
- **Ступеньки** (все 10 видов): форма из 2–3 частей с внешними и внутренними углами (`StairTile::setStepShape/setInnerPieceShape`), такие же коллизии, установка по взгляду и перевёрнутые ступеньки (клик по верхней половине/потолку), на них можно заходить.
- **Шаг 0.5 блока** у игрока и всех мобов (`Mob::stepHeight`, раньше у игрока был 0 — нельзя было взойти на полублок/ступеньку).
- **Кактус** как в оригинале: боковые грани утоплены на 1/16, свои текстуры верх/бок/низ, коллизия 14/16.
- **Огонь** как в оригинале: наклонные языки пламени на земле и на горючих стенах/потолке (`tesselateFireInWorld`) и процедурная анимация `FireTexture`.
- Верхняя грань блока под слоем снега не рисуется (как `Tile::shouldRenderFace`).
- Текстуры по оригиналу: песчаник (верх/низ/варианты боков), кварцевый блок (обычный/резной/колонна) и кварцевые ступеньки, ступеньки из ели/берёзы/тропического дерева, камнерез.

**Совместимость миров с оригинальной 0.8.1 проверена** в обе стороны:
- мир, созданный оригиналом (23 моба, сундук с вещами, инвентарь) → открывается в порте: мобы, сундук, инвентарь, позиция совпадают; контрольная сумма блоков 17×17×128 вокруг спавна совпала побайтно;
- мир, изменённый и сохранённый портом → `scripts/export_pe.sh` → открывается оригиналом: те же мобы по типам, выпавшие предметы (`t64`), инвентарь, позиция, время; контрольная сумма блоков совпала; ступеньки рисуются оригиналом так же;
- копия рабочего мира `t33a` → открывается оригиналом (инвентарь 16 стеков, позиция, здоровье), блоки совпадают.

Собственные точные данные порта по-прежнему в `entities031.dat`/`tiles032.dat`/`world034.dat`/`world035.dat`.
Тестовые сцены: `MCPE_DEMO035=b|p|r|e|d|w|c|h|s` (s — ступеньки) (только на копии мира!).

## Layout

| Path | What |
|---|---|
| `mcpe.HC` | Ordered list of all modules (the whole program) |
| `src/` | 1:1 ports of the original `headers/` and `impl/` files |
| `runtime/` | Glue that makes the ported modules a running game (world, renderer, GUI, sound, mobs) |
| `runtime/Batch031Platform.HH` | SDL2/OpenGL/libc bindings written in HolyC (replaces the old C host) |
| `runtime/Batch031Mobs.HC` | Animals, AI, path finder, spawning, mob models, shadows, particles |
| `runtime/Batch032Blocks.HC` | Functional blocks: tile entities, doors, beds, TNT/explosions, farming, shapes |
| `runtime/Batch032Screens.HC` | Chest and furnace screens |
| `runtime/Batch033Env.HC` | Time of day, sky/fog colours, sun/moon/stars, clouds, armor logic, chest lids, sleeping |
| `runtime/Batch033Player.HC` | ChestModel, player model + armor + held item, camera (3rd person), hand, armor screen |
| `runtime/Batch034Monsters.HC` | Hostile mobs (AI, models, arrows, fire texture, flames) |
| `runtime/Batch034World.HC` | Fence/wall/pane connections, rails, minecarts, signs + editor, chat commands, world034.dat |
| `runtime/Batch035Mech.HC` | Bow, throwables, paintings, nether reactor, fire/cactus/suffocation, falling sand, melting, liquids, 3D drops, compass/clock, camera, world035.dat |
| `runtime/Batch035Nbt.HC` | PE-format `entities.dat` (NBT) save/import |
| `runtime/Batch035Ao.HC` | smooth lighting (ambient occlusion) |
| `runtime/Batch035Stairs.HC` | stairs shape/collision/placement, cactus, block probe |
| `app/main.HC` | Entry point; `app/test.HC` self-test |
| `tools/` | Asset + sound importer (from your own APK) |

## Legal

Unofficial fan project, not affiliated with or endorsed by Mojang or Microsoft.
"Minecraft" is a trademark of Mojang Synergies AB.
