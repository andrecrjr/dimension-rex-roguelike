pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include ../dimensionrex/init/menu.lua
#include ../dimensionrex/init/characters.lua
#include ../dimensionrex/init/phase.lua
#include ../dimensionrex/init/init.lua
#include ../dimensionrex/update/update.lua
#include ../dimensionrex/utils.lua
#include ../dimensionrex/draw/main.lua
__gfx__
00000000004444000044440000444400004444000044440000444400004444000000000000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444444444444444444440000000000000000000000000000000000000000000000000000000000000000
000000000ffffff00ffffff00ffffff000fffff000fffff000fffff0044444400000000000000000000000000000000000000000000000000000000000000000
000000000f5ff5f00f5ff5f00f5ff5f000fff5f000fff5f000fff5f0044444400000000000000000000000000000000000000000000000000000000000000000
000000004ffffff44ffffff44ffffff404fffff004fffff004fffff0444444440000000000000000000000000000000000000000000000000000000000000000
00000000442222444422224444222244042222400422224004222240444444440000000000000000000000000000000000000000000000000000000000000000
00000000044004400000044004400000004004000000040000400000044004400000000000000000000000000000000000000000000000000000000000000000
0b5bb5b0bbbb5000bbbb500000b5bb00bbbb50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b8558b0b8bbb000b8bbb0000bb55bb0b8bb50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb55bb0bbbbb000bbbbb0000bbb5bb0bbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00000bbb50000bbb5000b55b00000bb5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb000bbbbbb50bbbbbb50bb5bbb00bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbbbb000bbbb5000bbbb500b55b00000bbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00005000550005050500bb5b000050050b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05000050055005500055550005005050055055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555dd555055500000555000055555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555dd555000dd55500055555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55855855005555000055550055555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550085555550855555505555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55588555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555855555558555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555055505550555055055555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05000050044000440044044005000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333333333bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333333333bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333333333bbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
333333333b333b33444444b400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333b3b3333344444300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333b33333344443300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333344443300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333444444300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccccccccccccccccdccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccdccccccccccccccccccccdccdc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccdccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccccdccccdc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cdcccdcccccccccccccccccccccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccccccdccdc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccccdcccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccccccccccd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa9a99a000556000ddddccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999a99900555660ddcccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a99a9a905555560dcddddcc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999999905555566dcddddcc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99a9a9a955555555dcddddcd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a999999955555555ccddddcd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a99999a05555500ccccccdd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999a99900555500ccddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550599dd9950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550499999940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d00000499999940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d00000499999940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000020202020000000000000000000000000001000000000000000000000000000000000000000000000000000000000000
__sfx__
001500002b0502b0502b05027060270502d1702b150291502a1702c1602d1502f15030150321503515038150331502e1502a060210501e0502a070191502a070171502a070171502907018150190302403013130
000e100621150211502d95026150211500000013950000000e950000000515018930179500e950041500e95000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000b2500e2501125015270192701725015270122500f2500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
