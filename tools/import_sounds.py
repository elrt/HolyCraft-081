#!/usr/bin/env python3
"""Extract the original MCPE 0.8.1 sound effects from the user's own APK.

The Android build keeps every effect as a raw PCM blob inside lib/armeabi-v7a/libminecraftpe.so
(SoundDesc layout: int32 channels, int32 bytesPerSample, int32 sampleRate, int32 frames, then samples).
Offsets are the ones published in original/MCPE-0.8.1-master/tools/get_sound_data.py.
Every header is validated before anything is written.

usage: python3 tools/import_sounds.py [PE-a0.8.1.apk | libminecraftpe.so] [out_dir]
"""
import hashlib, json, os, struct, sys, zipfile

OFFSETS = [
 ("fuse",0x2E2650),("eat3",0x31F5AA),("eat2",0x325584),("eat1",0x32B55E),("creeperdeath",0x331538),
 ("creeper4",0x34B92E),("creeper3",0x356AF2),("creeper2",0x3609E6),("creeper1",0x36B136),("spiderdeath",0x37502A),
 ("spider4",0x3929F6),("spider3",0x39A340),("spider2",0x3A5926),("spider1",0x3B0F0C),("skeletonhurt4",0x3C018E),
 ("skeletonhurt3",0x3CBB80),("skeletonhurt2",0x3D6732),("skeletonhurt1",0x3E0DF8),("skeletondeath",0x3EB57E),
 ("skeleton3",0x3F80BC),("skeleton2",0x40434C),("skeleton1",0x4121A4),("fallsmall",0x41FFFC),("fallbig2",0x42B268),
 ("fallbig1",0x437968),("bowhit4",0x448BDC),("bowhit3",0x45E474),("bowhit2",0x47175E),("bowhit1",0x4819D4),
 ("bow",0x4916E8),("zpighurt2",0x49B3C4),("zpighurt1",0x4A7AFE),("zpigdeath",0x4B5454),("zpigangry4",0x4D97C6),
 ("zpigangry3",0x4FDB38),("zpigangry2",0x51D63E),("zpigangry1",0x528250),("zpig4",0x5422CE),("zpig3",0x554490),
 ("zpig2",0x55F9B0),("zpig1",0x583D22),("zombiehurt2",0x59EFBC),("zombiehurt1",0x5B4854),("zombiedeath",0x5C8B64),
 ("zombie3",0x5D8DDA),("zombie2",0x606A0C),("zombie1",0x6243D8),("cowhurt3",0x6448B4),("cowhurt2",0x64F762),
 ("cowhurt1",0x659330),("cow4",0x662EFE),("cow3",0x687842),("cow2",0x6B295A),("cow1",0x6D015A),
 ("chickenhurt2",0x6ED95A),("chickenhurt1",0x6F5A9E),("chicken3",0x701C7C),("chicken2",0x70C8D0),("pigdeath",0x71CB46),
 ("pig3",0x7280D8),("pig2",0x73021C),("pig1",0x73E446),("sheep3",0x745AC6),("sheep2",0x75B35E),("sheep1",0x76E0E6),
 ("ignite",0x78397E),("fire",0x78CC60),("burp",0x7B3FB0),("break",0x7BB1AC),("glass3",0x7C377C),("glass2",0x7D25CA),
 ("glass1",0x7E1418),("chestopen",0x7F0266),("chestclosed",0x7FAEBA),("door_close",0x805B0E),("door_open",0x80E1B4),
 ("hurt",0x818E08),("pop2",0x82DF80),("pop",0x8327F0),("splash",0x8363EC),("explode",0x841E70),("click",0x854000),
 ("wood4",0x8600C0),("wood3",0x86AD14),("wood2",0x875968),("wood1",0x8805BC),("stone4",0x88B210),("stone3",0x895E64),
 ("stone2",0x8A0AB8),("stone1",0x8AB70C),("sand4",0x8B6360),("sand3",0x8BCF1C),("sand2",0x8C3AD8),("sand1",0x8CA694),
 ("gravel4",0x8D1250),("gravel3",0x8DBEA4),("gravel2",0x8E6AF8),("gravel1",0x8F174C),("grass4",0x8FC3A0),
 ("grass3",0x906FF4),("grass2",0x911C48),("grass1",0x91C89C),("cloth4",0x9274F0),("cloth3",0x92BB1A),
 ("cloth2",0x930144),("cloth1",0x93476E),
]

def load(src):
    if src.endswith('.apk'):
        with zipfile.ZipFile(src) as z:
            return z.read('lib/armeabi-v7a/libminecraftpe.so'), src + '!lib/armeabi-v7a/libminecraftpe.so'
    with open(src, 'rb') as f:
        return f.read(), src

def main():
    here = os.path.dirname(os.path.abspath(__file__))
    src = sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, '../../apk029/lib/armeabi-v7a/libminecraftpe.so')
    out = sys.argv[2] if len(sys.argv) > 2 else os.path.join(here, '../assets/030/sound')
    blob, label = load(src)
    os.makedirs(out, exist_ok=True)
    files = {}
    for name, off in OFFSETS:
        v = off - 0x1000
        ch, bps, rate, frames = struct.unpack_from('<4i', blob, v)
        if ch not in (1, 2) or bps not in (1, 2) or not 8000 <= rate <= 48000 or not 0 < frames < 5000000:
            sys.exit('bad PCM header for %s at 0x%x: %r (wrong libminecraftpe.so build?)' % (name, v, (ch, bps, rate, frames)))
        data = blob[v:v + 16 + ch * bps * frames]
        with open(os.path.join(out, name + '.pcm'), 'wb') as f:
            f.write(data)
        files[name + '.pcm'] = {'offset': v, 'channels': ch, 'bytesPerSample': bps, 'sampleRate': rate,
                                'frames': frames, 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
    receipt = {'source': os.path.basename(label), 'source_sha256': hashlib.sha256(blob).hexdigest(),
               'layout': 'SoundDesc: int32 channels, bytesPerSample, sampleRate, frames; little-endian PCM',
               'offsets_from': 'original/MCPE-0.8.1-master/tools/get_sound_data.py', 'count': len(files), 'files': files}
    with open(os.path.join(out, 'receipt030.json'), 'w') as f:
        json.dump(receipt, f, indent=1, sort_keys=True)
    print('extracted %d sounds into %s' % (len(files), out))

if __name__ == '__main__':
    main()
