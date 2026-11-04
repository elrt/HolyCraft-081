#!/usr/bin/env python3
"""Import the original MCPE 0.8.1 assets from YOUR OWN APK (PE-a0.8.1-armv7-gb.apk).
Nothing from Mojang is stored in this repository. The APK is only read, never executed.
usage: python3 tools/import_assets.py path/to/PE-a0.8.1.apk"""
import hashlib, os, subprocess, sys, zipfile
FILES = {
    'assets/035/art/kz.png': ('assets/images/art/kz.png', '389e63843693a087f394e12e1cbb49bef59f2020b2fc065353df02a1ba197cc1'),
    'assets/035/compass.png': ('assets/images/compass.png', '6238ede831e8189d3cb2403e4b22f7efa7a3177e5865b4693156c75fc35dcb01'),
    'assets/035/watch-atlas.png': ('assets/images/watch-atlas.png', 'abc93b1f894c793e46d9aea0d480b0d995b6f1f4ac54cdc35f16154231afcd50'),
    'assets/035/camera.png': ('assets/images/item/camera.png', '0bb33e7114b5d0f471b56dcefc91f67c36faa4b1453c4e290af845c306712e64'),
    'assets/029/background.png': ('assets/images/gui/background.png', '2e137c14a8f109d2d037a053876d97db585f34000030430222d725bf587c061c'),
    'assets/029/default8.png': ('assets/images/font/default8.png', '13c40fe8a0e96952474fbf2b262c1514977230fb490ec9262e13ab77664327ff'),
    'assets/029/en_US.lang': ('assets/lang/en_US.lang', 'b5a3da17605713d247450912d7bdbe595a6ccc992e72f18d977ee8d51d9ddcf5'),
    'assets/029/gui.png': ('assets/images/gui/gui.png', 'de2370fc5d3d86b958bbbd80ad1465817b9ded67367c7cac2fca94d430896607'),
    'assets/029/gui2.png': ('assets/images/gui/gui2.png', '3e1f305d44fbfbda6d7204743b766bbd2f73e69cc13e245f3f30f4bf9d6e72a7'),
    'assets/029/icons.png': ('assets/images/gui/icons.png', 'e5181aa36fd6605dedc51b5e7126d941eea92840e2780c2f460ab9475953f9bd'),
    'assets/029/itemframe.png': ('assets/images/gui/itemframe.png', 'c781e7e89104a9b6bfaf72415e758b968002dbdadc560e2163b8f1bed8119adc'),
    'assets/029/panorama_0.png': ('assets/images/gui/background/panorama_0.png', '1db3619501e3a5412cddc69b3c53be360179fa32acb4e53a8fd5b8d6d047c4c7'),
    'assets/029/panorama_1.png': ('assets/images/gui/background/panorama_1.png', 'aac0f86479aeba35b5c56cab75b62faf20ac88f7727c098315924fe12de43939'),
    'assets/029/panorama_2.png': ('assets/images/gui/background/panorama_2.png', '16363a60c5c4ad7046f1a4821d0cc620644aa2f81673b77a79f5a61edb87d942'),
    'assets/029/panorama_3.png': ('assets/images/gui/background/panorama_3.png', 'e17e6dae20d33f662e1e32a766ebd98232787976f993af51e7196a0dbf536031'),
    'assets/029/panorama_4.png': ('assets/images/gui/background/panorama_4.png', '19750c730e2ff314ff2a957426fabcbc6a450efd16528454d141d33e3694729e'),
    'assets/029/panorama_5.png': ('assets/images/gui/background/panorama_5.png', '1b3d801ee20747e70e0e8fca07012b37100fa0ffa2f6a78f9c0976a51a48c08e'),
    'assets/029/spritesheet.png': ('assets/images/gui/spritesheet.png', 'cf35ff716830167407e02335da70ff4e246dd328e3c5e6b33a2c5f81622c72f4'),
    'assets/029/title.png': ('assets/images/gui/title.png', '8b7a47726439f668d29bf1e3ab8029e1636995695d2e6dbeff5a619e0a20b049'),
    'assets/029/touchgui.png': ('assets/images/gui/touchgui.png', 'b069ab6e6614f4184b2b119ec701b4dd3290899d42ad32caacd3744d850ef097'),
    'assets/029/touchgui2.png': ('assets/images/gui/touchgui2.png', '559f16f89d67e3230e8e77a8407bc658355f7e14d3da95118a14723d748f2d90'),
    'assets/font.png': ('assets/images/font/default8.png', '13c40fe8a0e96952474fbf2b262c1514977230fb490ec9262e13ab77664327ff'),
    'assets/gui.png': ('assets/images/gui/gui.png', 'de2370fc5d3d86b958bbbd80ad1465817b9ded67367c7cac2fca94d430896607'),
    'assets/icons.png': ('assets/images/gui/icons.png', 'e5181aa36fd6605dedc51b5e7126d941eea92840e2780c2f460ab9475953f9bd'),
    'assets/items.meta': ('assets/images/items.meta', 'cb91d275347e4ffef0527c27380a722353ee6f99094f0c1d24bd5df252e73915'),
    'assets/items.png': ('assets/images/items-opaque.png', 'e473204cc35b3a9d08dec3830c39afe28ede6fa23a7270dc3d88e8843fb5722e'),
    'assets/terrain.meta': ('assets/images/terrain.meta', '041f7be3ec59f96a98aa09e80fe05f030b1e1a3e1c1b4be304ecef648ab8176d'),
    'assets/terrain.tga': ('assets/images/terrain-atlas.tga', '6fabc120ba470ae55a537d7d581ee3cb9e51b39bd34a50f6ccf92c69a2482a1d'),
    'assets/title.png': ('assets/images/gui/title.png', '8b7a47726439f668d29bf1e3ab8029e1636995695d2e6dbeff5a619e0a20b049'),
    'assets/031/mob/chicken.png': ('assets/images/mob/chicken.png', 'f274296053d7993975270300388cd184635010a7082cf56c537e903274b12216'),
    'assets/031/mob/cow.png': ('assets/images/mob/cow.png', '54b46abc75fbf64603198c3cda87acc34b00e05ca62def4ed9f9fb08cd743a05'),
    'assets/031/mob/pig.png': ('assets/images/mob/pig.png', '0770b7a10a829e5fe101e236b25014e4c9633838f0067d8b0cf413b605428385'),
    'assets/031/mob/sheep_0.png': ('assets/images/mob/sheep_0.png', '373b7ee042f8e0a027cca3e33a9268be18b466f47aa1765208e40043b6cb89f9'),
    'assets/031/mob/sheep_1.png': ('assets/images/mob/sheep_1.png', '7ae4d533aee5aaf452fbc8a37433759d6989bab6e50c7f171045684554b666c1'),
    'assets/031/mob/sheep_2.png': ('assets/images/mob/sheep_2.png', '44026a4022df1c74bf3e285c2206bad6aad6405f931d05e9d5396a05ef316af7'),
    'assets/031/mob/sheep_3.png': ('assets/images/mob/sheep_3.png', '052c73dd19a6682f9de5ae6ce4b64bc3055fc7ac72771cd727ee03b93b38e8ff'),
    'assets/031/mob/sheep_4.png': ('assets/images/mob/sheep_4.png', '1163a0d71a69604fadd6823ade9bee54b3479f8040c2b1c980668c9cbf0b69b4'),
    'assets/031/mob/sheep_5.png': ('assets/images/mob/sheep_5.png', '4356b9cf902471ffac359ba82cba9029bc633160eca744f31ae9e979748e22b1'),
    'assets/031/mob/sheep_6.png': ('assets/images/mob/sheep_6.png', '56e2701d59e0fb0595ad27040aea5305e5458e8f398bd771a5f436f9a78598fe'),
    'assets/031/mob/sheep_7.png': ('assets/images/mob/sheep_7.png', 'c96095dabba56e83b0119ac0844db825c9edbe55437c9cd4a083ceb5ee39feec'),
    'assets/031/mob/sheep_8.png': ('assets/images/mob/sheep_8.png', '44025056123a43fe8c8e399eaea94c82ca7410ddf56cf495e9ef068c78140a0d'),
    'assets/031/mob/sheep_9.png': ('assets/images/mob/sheep_9.png', '493fb664be2870a068526e9af1c9ca43823b638971c116373a07b7ee122f78ae'),
    'assets/031/mob/sheep_10.png': ('assets/images/mob/sheep_10.png', '3cd413c14ad657ba4653475c878bcca9636d87af1861c09b535301adb12a7094'),
    'assets/031/mob/sheep_11.png': ('assets/images/mob/sheep_11.png', '45a24b788200f861204a47ab6b258f24eafe2a69e48e8030c83c1698cca0ea81'),
    'assets/031/mob/sheep_12.png': ('assets/images/mob/sheep_12.png', 'd2145fca4736b21146ab41b9e2f88ca95acf9ec7b563cf7ab6328da1cb077e49'),
    'assets/031/mob/sheep_13.png': ('assets/images/mob/sheep_13.png', '5103bb4ae483306a76472878a70121fc524c3ed592fceade9b2d5d29c288d598'),
    'assets/031/mob/sheep_14.png': ('assets/images/mob/sheep_14.png', '20479fbe25fda8a47754bfb825bd7b4afa0ac890a7f5f5e2cee9e06158feb877'),
    'assets/031/mob/sheep_15.png': ('assets/images/mob/sheep_15.png', '796e3180cebb0445a7bca192d738131db03540eae4837d80a7223bf2619bab46'),
    'assets/031/particles.png': ('assets/images/particles.png', '99212086c27ac1acfb86e054c1f7cf38e3b79dc6814289a1937c277849dcc3e9'),
    'assets/033/armor/chain_1.png': ('assets/images/armor/chain_1.png', 'a34b6529f3dcd5c086a425e50c89aaf3014a8163d004223c9e56e7cee46c6d0f'),
    'assets/033/armor/chain_2.png': ('assets/images/armor/chain_2.png', '22238e87ae6f748a037c4ad8c3b57c95db1916115b282097b2cf7dc58b580dc1'),
    'assets/033/armor/cloth_1.png': ('assets/images/armor/cloth_1.png', 'afe3e3ff65e8a9f44941d7decb376bcae7e3ce3e99a82abfe4b875bfeec65f46'),
    'assets/033/armor/cloth_2.png': ('assets/images/armor/cloth_2.png', 'bc6d29cefe2af8a1c8d1467400cbac3102dc810ba6e0dc8d64e0e343cb992cae'),
    'assets/033/armor/diamond_1.png': ('assets/images/armor/diamond_1.png', 'a573b0707b579138fc90bb0d8c1f42f9165b8bb51347b2a57d5ec301f14f8cc1'),
    'assets/033/armor/diamond_2.png': ('assets/images/armor/diamond_2.png', '844ce7b7b4d60ad0b04c7fdc84278bac6b54deee9d4c2214941b421980e3734f'),
    'assets/033/armor/gold_1.png': ('assets/images/armor/gold_1.png', '05c640ff76871b1979a3343493696d7726564aadaeceb14fde6833574743cf1a'),
    'assets/033/armor/gold_2.png': ('assets/images/armor/gold_2.png', 'e3cfa5eb73bb914890147970355672da8578787e85c3135b37f20fc7e4f243d6'),
    'assets/033/armor/iron_1.png': ('assets/images/armor/iron_1.png', 'e8f20fe11af76eb4cc699cd690c7db7f14421415515c32f0768b14cdb6b9b45d'),
    'assets/033/armor/iron_2.png': ('assets/images/armor/iron_2.png', '36f4c95a1ef7e3837aad069bd000e54914923789c53d31af43d9e85bd5ec3850'),
    'assets/033/chest/double_normal.png': ('assets/images/item/chest/double_normal.png', 'cb0f75fd93157a2da6ac4217b53ba8c51a9ecf43b07008b2ff8827a173dde3b4'),
    'assets/033/chest/normal.png': ('assets/images/item/chest/normal.png', '3c6be69bf69a2f923d17c4e9e1089b2ee1d64c728bac017f1432118ac4b1cd7d'),
    'assets/033/environment/clouds.png': ('assets/images/environment/clouds.png', '152fb46bde445fd88bf1c6fd46cd2aaafe24ee7f046001238e4c6a42c590700e'),
    'assets/033/environment/moon_phases.png': ('assets/images/environment/moon_phases.png', 'a6b22cc9fabbb51964fde3605016be83f97735fa9bdb422b2575976651387a00'),
    'assets/033/environment/sun.png': ('assets/images/environment/sun.png', 'fc65677840263cab551e3c9ccd511b2572b63d6f3c73e341873a62f1397b1604'),
    'assets/033/mob/char.png': ('assets/images/mob/char.png', '744b04cbe8a67aad562f6efb188b1c79f7ba617ada2c5e0ca3a7f8138310ef4c'),
    'assets/034/entity/minecart.png': ('assets/images/entity/minecart.png', '71391503126a2f694caa317fec20e96bb9eeae17032fdb1795a579ea2d5e0fba'),
    'assets/034/item/arrows.png': ('assets/images/item/arrows.png', '78a4362910ca9838f52d77f994a79ec4a4d574a75d78128e2bbc9b6f7c209c3d'),
    'assets/034/item/sign.png': ('assets/images/item/sign.png', 'ccd4fa265f84ec55cb1f328b55b1a5b1e41e3dc8586cbae391e073a3a603c510'),
    'assets/034/mob/creeper.png': ('assets/images/mob/creeper.png', 'c27e7c20555f1bf5ef1cd848a4291f90465000708185e6743e72b8adffed2a4b'),
    'assets/034/mob/pigzombie.png': ('assets/images/mob/pigzombie.png', '7828213afe1c9c109f36ffc284d0326d117b9cc677840567f38f8ae60eb051c5'),
    'assets/034/mob/skeleton.png': ('assets/images/mob/skeleton.png', '3eb64018f7fa55b332548147d9966580ae87352418bf07dfa190ffa39be79b1b'),
    'assets/034/mob/spider.png': ('assets/images/mob/spider.png', '0754bf71e157e8ed447c475663f866cd6b35813e9e5ea138dafbfdb02675bd81'),
    'assets/034/mob/spider_eyes.png': ('assets/images/mob/spider_eyes.png', 'fb16879b0f5fde12ad850a2258f06ae1f02b27e94b080bef913ee646a0fd8213'),
    'assets/034/mob/zombie.png': ('assets/images/mob/zombie.png', '55894ddffae211860f47d9147c9c1b31f890ddf8736b4c91d9521e1e3f8bddac'),
}
def main():
    if len(sys.argv) != 2: sys.exit(__doc__)
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    bad = 0
    with zipfile.ZipFile(sys.argv[1]) as z:
        for dst, (entry, sha) in FILES.items():
            data = z.read(entry)
            if hashlib.sha256(data).hexdigest() != sha:
                bad += 1; print('warning: different version of', entry)
            path = os.path.join(root, dst); os.makedirs(os.path.dirname(path), exist_ok=True)
            open(path, 'wb').write(data)
    print(f'{len(FILES)} files copied' + (f', {bad} differ from 0.8.1 armv7' if bad else ''))
    subprocess.check_call([sys.executable, os.path.join(root, 'tools', 'import_sounds.py'), sys.argv[1], os.path.join(root, 'assets', '030', 'sound')])
if __name__ == '__main__': main()
