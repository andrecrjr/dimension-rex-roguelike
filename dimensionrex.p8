pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include ../dimensionrex/init/menu.lua
#include ../dimensionrex/init/characters.lua
#include ../dimensionrex/init/phase.lua
#include ../dimensionrex/init/init.lua
#include ../dimensionrex/init/inventory.lua
#include ../dimensionrex/update/update.lua
#include ../dimensionrex/utils.lua
#include ../dimensionrex/draw/main.lua
__gfx__
00000000004444000044440000444400004444000044440000444400004444000000000d00000000000000000000000000000000000000000000000000000000
0000000044444444444444444444444444444444444444444444444444444444000000d000000000000000000000000000000000000000000000000000000000
00000000444444444444444444444444444444444444444444444444444444440044440000000000000000000000000000000000000000000000000000000000
00000000011111100111111001111110001111100011111000111110011111100444444000000000000000000000000000000000000000000000000000000000
000000000f5ff5f00f5ff5f00f5ff5f000fff5f000fff5f000fff5f00111111000f5f50000000000000000000000000000000000000000000000000000000000
000000004ffffff44ffffff44ffffff404fffff004fffff004fffff0411111140000000000000000000000000000000000000000000000000000000000000000
00000000448888444488884444888844048888400488884004888840444444440000000000000000000000000000000000000000000000000000000000000000
00000000044004400000044004400000004004000000040000400000044004400000000000000000000000000000000000000000000000000000000000000000
0bbbbbb0bbbbb000bbbbb00000b3bb00bbbb50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b8558b0b8bbb000b8bbb0000bb33bb0b8bb50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb55bb0bbbbb000bbbbb0000bbb3bb0bbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00000bbbb0000bbbb000b33b00000bb5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb000bbbbbb50bbbbbb50bb3bbb00bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbbbb000bbbb5000bbbb500b33b00000bbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00005000550005050500bb3b000050050b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
333333333333333333333333bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333333333333e3333bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
333333333333333333e3e333bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
333333333b333b33333e3333bbbbbbb4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333b3b3333333333344444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333b33333333333300444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333300444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333304444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0ccc0cc0cc0c00cc0ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccdcccccccdccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccdccccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cdcccccccccccdcccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccdccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccdccccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0cc0cc0cc0c0ccc0ccc0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa9a99a000556000dddd22200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999a99900555660dd92222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a99a9a905555560d99ddd2200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999999905555566d2dddd2200055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99a9a9a955555555d2dddd2d00055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a99999995555555522ddd99d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a99999a05555500222229dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999a9990055550022ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555558880088800000000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9954880088400000000880888080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9958488884800000900888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550599dd9958848848800000000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550499999948844448800000000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d00000499999940884488000000000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d00000499999940088880000000000880008880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444440008800000000000880088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
44444444444444444444444444444444444444442222222224444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444442444444424444444444444444444444444444444444444444444444444444444444444444444444444444444
44444ee4ee44ee44eee4eee444444444444444442444444424444444444424242224444444444444244424242444444422444444444444444444444444444444
44444eeeee444e44e4e4e4e444444444444444442444444424444444444424242444444444444444244424242444444442444444444444444444444444444444
44444eeeee444e44e4e4e4e444444444444444442444444424444444444442442224444444444444244424242444444442444444444444444444444444444444
444444eee4444e44e4e4e4e444444444444444442444444424444444444424244424444444444444244422242444444442444444444444444444444444444444
4444444e4444eee4eee4eee444444444444444442444444424444444444424242224444444444444222442442224444422244444444444444444444444444444
44444444444444444444444444444444444444442444444424444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444442222222224444444444444444444444444444444444444444444444444444444444444444444444444444444
333333333333333333333333333333334883388433333333cccccccc3333333333333333333333333333333333333333ccccccdc333333333333333333333333
333333333333333333333333333333338488884833333333cccccccc333333b3333333b3333333b33333333333333333ccccdccc333333b3333333b3333333b3
333333333333333333333333333333338848848833333333cccccccc3b333b333b333b333b333b333333333333333333cccccccc3b333b333b333b333b333b33
333333333333333333333333333333338844448833333333cccccccc33b3b33333b3b33333b3b3333333333333333333cdcccdcc33b3b33333b3b33333b3b333
333333333333333333333333333333333884488333333333cccccccc333b3333333b3333333b33333333333333333333cccccccc333b3333333b3333333b3333
333333333333333333333333333333333388883333333333cccccccc3333333333333333333333333333333333333333cccccccc333333333333333333333333
333333333333333333333333333333333338833333333333cccccccc3333333333333333333333333333333333333333cccccccc333333333333333333333333
333333333333333333333333333333333344443333333333bbbbbbbb3333333333333333333333333333333333333333cccccccccccccccccccccccc33333333
333333333333333333333333333333334444444433333333bbbbbbbb3333333333333333333333333333333333333333ccccccdccccccccccccccccc33333333
333333b3333333b3333333333333333344444444333333b3bbbbbbbb333333b333333333333333333333333333333333ccccdccccccccccccccccccc33333333
3b333b333b333b333333333333333333311111133b333b33bbbbbbb43b333b3333333333333333333333333333333333cccccccccccccccccccccccc33333333
33b3b33333b3b33333333333333333333f5ff5f333b3b3334444444333b3b33333333333333333333333333333333333cdcccdcccccccccccccccccc33333333
333b3333333b333333333333333333334ffffff4333b333333444433333b333333333333333333333333333333333333cccccccccccccccccccccccc33333333
333333333333333333333333333333334488884433333333334444333333333333333333333333333333333333333333cccccccccccccccccccccccc33333333
333333333333333333333333333333333443344333333333344444433333333333333333333333333333333333333333cccccccccccccccccccccccc33333333
33333333333333333333333333333333cccccccc33333333333333333333333333333333ccccccccbbbbbbbb3333333333333333cccccccc33333333bbbbbbbb
33333333333333333333333333333333ccccccdc33333333333333333333333333333333ccccccdcbbbbbbbb3333333333333333cccccccc33333333bbbbbbbb
333333b333333333333333b3333333b3ccccdccc333333b3333333b33333333333333333ccccdcccbbbbbbbb333333b3333333b3cccccccc33333333bbbbbbbb
3b333b33333333333b333b333b333b33cccccccc3b333b333b333b333333333333333333ccccccccbbbbbbb43b333b333b333b33cccccccc33333333bbbbbbb4
33b3b3333333333333b3b33333b3b333cdcccdcc33b3b33333b3b3333333333333333333cdcccdcc4444444333b3b33333b3b333cccccccc3333333344444443
333b333333333333333b3333333b3333cccccccc333b3333333b33333333333333333333cccccccc33444433333b3333333b3333cccccccc3333333333444433
33333333333333333333333333333333cccccccc33333333333333333333333333333333cccccccc334444333333333333333333cccccccc3333333333444433
33333333333333333333333333333333cccccccc33333333333333333333333333333333cccccccc344444433333333333333333cccccccc3333333334444443
3333333333333333333333333333333333333333cccccccc33333333333333333333333333333333cccccccc3333333333333333333333333333333333333333
3333333333333333333333333333333333333333ccccccdc33333333333333333333333333333333ccccccdc3333333333333333333333333333333333333333
333333b3333333b333333333333333b3333333b3ccccdccc333333b33333333333333333333333b3ccccdccc3333333333333333333333b333333333333333b3
3b333b333b333b33333333333b333b333b333b33cccccccc3b333b3333333333333333333b333b33cccccccc33333333333333333b333b33333333333b333b33
33b3b33333b3b3333333333333b3b33333b3b333cdcccdcc33b3b333333333333333333333b3b333cdcccdcc333333333333333333b3b3333333333333b3b333
333b3333333b333333333333333b3333333b3333cccccccc333b33333333333333333333333b3333cccccccc3333333333333333333b333333333333333b3333
3333333333333333333333333333333333333333cccccccc33333333333333333333333333333333cccccccc3333333333333333333333333333333333333333
3333333333333333333333333333333333333333cccccccc33333333333333333333333333333333cccccccc3333333333333333333333333333333333333333
3333333333333333cccccccc33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333ccccccdc33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333b333333333ccccdccc333333b333333333333333b33333333333333333333333b3333333b333333333333333b333333333333333b333333333333333b3
3b333b3333333333cccccccc3b333b33333333333b333b3333333333333333333b333b333b333b33333333333b333b33333333333b333b33333333333b333b33
33b3b33333333333cdcccdcc33b3b3333333333333b3b333333333333333333333b3b33333b3b3333333333333b3b3333333333333b3b3333333333333b3b333
333b333333333333cccccccc333b333333333333333b33333333333333333333333b3333333b333333333333333b333333333333333b333333333333333b3333
3333333333333333cccccccc33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333cccccccc33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333cccccccc333333333333333333333333333333333333333333333333bbbbbbbbcccccccc33333333
333333333333333333333333333333333333333333333333cccccccc333333333333333333333333333333333333333333333333bbbbbbbbccccccdc33333333
3333333333333333333333b3333333b3333333b3333333b3cccccccc333333b3333333b3333333b333333333333333b333333333bbbbbbbbccccdccc333333b3
35555553333333333b333b333b333b333b333b333b333b33cccccccc3b333b333b333b333b333b33333333333b333b3333333333bbbbbbb4cccccccc3b333b33
355555533333333333b3b33333b3b33333b3b33333b3b333cccccccc33b3b33333b3b33333b3b3333333333333b3b3333333333344444443cdcccdcc33b3b333
35d3333333333333333b3333333b3333333b3333333b3333cccccccc333b3333333b3333333b333333333333333b33333333333333444433cccccccc333b3333
35d333333333333333333333333333333333333333333333cccccccc33333333333333333333333333333333333333333333333333444433cccccccc33333333
333333333333333333333333333333333333333333333333cccccccc33333333333333333333333333333333333333333333333334444443cccccccc33333333
3333333333333333bbbbbbbbbbbbbbbbccccccccccccccccbbbbbbbb3333333333333333ccccccccbbbbbbbb33333333333333333333333333333333cccccccc
3333333333333333bbbbbbbbbbbbbbbbccccccccccccccdcbbbbbbbb3333333333333333ccccccdcbbbbbbbb33333333333333333333333333333333ccccccdc
333333b3333333b3bbbbbbbbbbbbbbbbccccccccccccdcccbbbbbbbb33333333333333b3ccccdcccbbbbbbbb333333b333333333333333b333333333ccccdccc
3b333b333b333b33bbbbbbb4bbbbbbb4ccccccccccccccccbbbbbbb4333333333b333b33ccccccccbbbbbbb43b333b33333333333b333b3333333333cccccccc
33b3b33333b3b3334444444344444443cccccccccdcccdcc444444433333333333b3b333cdcccdcc4444444333b3b3333333333333b3b33333333333cdcccdcc
333b3333333b33333344443333444433cccccccccccccccc3344443333333333333b3333cccccccc33444433333b333333333333333b333333333333cccccccc
33333333333333333344443333444433cccccccccccccccc334444333333333333333333cccccccc3344443333333333333333333333333333333333cccccccc
33333333333333333444444334444443cccccccccccccccc344444433333333333333333cccccccc3444444333333333333333333333333333333333cccccccc
3ddddccc88833888bbbbbbbb3333333333333333bbbbbbbb3333333333333333333333333333333333333333bbbbbbbbcccccccc3333333333333333bbbbbbbb
ddcccccc48833884bbbbbbbb3333333333333333bbbbbbbb3333333333333333333333333333333333333333bbbbbbbbccccccdc3333333333333333bbbbbbbb
dcddddcc84888848bbbbbbbb3333333333333333bbbbbbbb3333333333333333333333b333333333333333b3bbbbbbbbccccdccc33333333333333b3bbbbbbbb
dcddddcc88488488bbbbbbb43333333333333333bbbbbbb433333333333333333b333b33333333333b333b33bbbbbbb4cccccccc333333333b333b33bbbbbbb4
dcddddcd8844448844444443333333333333333344444443333333333333333333b3b3333333333333b3b33344444443cdcccdcc3333333333b3b33344444443
ccddddcd38844883334444333333333333333333334444333333333333333333333b333333333333333b333333444433cccccccc33333333333b333333444433
ccccccdd3388883333444433333333333333333333444433333333333333333333333333333333333333333333444433cccccccc333333333333333333444433
ccddddd33338833334444443333333333333333334444443333333333333333333333333333333333333333334444443cccccccc333333333333333334444443
33333333bbbbbbbb33355633bbbbbbbbbbbbbbbb888338883333333333333333cb5bb5bcbbbbbbbb3333333333333333333333333b5bb5b33333333333333333
33333333bbbbbbbb33555663bbbbbbbbbbbbbbbb488338843333333333333333cb8558bcbbbbbbbb3333333333333333333333333b8558b33333333333333333
333333b3bbbbbbbb35555563bbbbbbbbbbbbbbbb8488884833333333333333b3cbb55bbcbbbbbbbb3333333333333333333333333bb55bb3333333b333333333
3b333b33bbbbbbb435555566bbbbbbb4bbbbbbb488488488333333333b333b33ccbbbbccbbbbbbb433333333333333333333333333bbbb333b333b3333333333
33b3b33344444443555555554444444344444443884444883333333333b3b333ccbbbbcc4444444333333333333333333333333333bbbb3333b3b33333333333
333b3333334444335555555533444433334444333884488333333333333b3333ccbbbbbb3344443333333333333333333333333333bbbbbb333b333333333333
3333333333444433355555333344443333444433338888333333333333333333ccbbbbcc3344443333333333333333333333333333bbbb333333333333333333
3333333334444443335555333444444334444443333883333333333333333333c5cccc5c34444443333333333333333333333333353333533333333333333333
3333333333333333bbbbbbbb33333333333333333333333333333333333333333333333333333333cccccccc333333333b5bb5b33333333333333333cccccccc
3333333333333333bbbbbbbb33333333333333333333333333333333333333333333333333333333ccccccdc333333333b8558b33333333333333333cccccccc
3333333333333333bbbbbbbb33333333333333b333333333333333b333333333333333b333333333ccccdccc333333b33bb55bb333333333333333b3cccccccc
3333333333333333bbbbbbb4333333333b333b33333333333b333b33333333333b333b3333333333cccccccc3b333b333bbbbb33333333333b333b33cccccccc
3333333333333333444444433333333333b3b3333333333333b3b3333333333333b3b33333333333cdcccdcc33b3b33333bbbb333333333333b3b333cccccccc
33333333333333333344443333333333333b333333333333333b333333333333333b333333333333cccccccc333b333333bbbbbb33333333333b3333cccccccc
33333333333333333344443333333333333333333333333333333333333333333333333333333333cccccccc3333333333bbbb333333333333333333cccccccc
33333333333333333444444333333333333333333333333333333333333333333333333333333333cccccccc33333333353333533333333333333333cccccccc
333333333333333333333333cccccccc333333333333333333333333ccccccccbbbbbbbb33333333bbbbbbbb3333333333333333333333333333333333333333
333333333333333333333333cccccccc333333333333333333333333ccccccdcbbbbbbbb33333333bbbbbbbb3333333333333333333333333333333333333333
33333333333333b3333333b3cccccccc333333b3333333b333333333ccccdcccbbbbbbbb33333333bbbbbbbb3333333333333333333333b333333333333333b3
333333333b333b333b333b33cccccccc3b333b333b333b3333333333ccccccccbbbbbbb433333333bbbbbbb433333333333333333b333b33333333333b333b33
3333333333b3b33333b3b333cccccccc33b3b33333b3b33333333333cdcccdcc444444433333333344444443333333333333333333b3b3333333333333b3b333
33333333333b3333333b3333cccccccc333b3333333b333333333333cccccccc3344443333333333334444333333333333333333333b333333333333333b3333
333333333333333333333333cccccccc333333333333333333333333cccccccc3344443333333333334444333333333333333333333333333333333333333333
333333333333333333333333cccccccc333333333333333333333333cccccccc3444444333333333344444433333333333333333333333333333333333333333
33333333cccccccc33333333bbbbbbbb33333333cccccccccccccccc33333333bbbbbbbb3333333333333333ccccccccbbbbbbbb333333333333333333333333
33333333cccccccc33333333bbbbbbbb33333333ccccccdcccccccdc33333333bbbbbbbb3333333333333333ccccccccbbbbbbbb333333333333333333333333
333333b3cccccccc33333333bbbbbbbb333333b3ccccdcccccccdccc33333333bbbbbbbb333333b3333333b3ccccccccbbbbbbbb3333333333333333333333b3
3b333b33cccccccc33333333bbbbbbb43b333b33cccccccccccccccc33333333bbbbbbb43b333b333b333b33ccccccccbbbbbbb433333333333333333b333b33
33b3b333cccccccc333333334444444333b3b333cdcccdcccdcccdcc333333334444444333b3b33333b3b333cccccccc44444443333333333333333333b3b333
333b3333cccccccc3333333333444433333b3333cccccccccccccccc3333333333444433333b3333333b3333cccccccc334444333333333333333333333b3333
33333333cccccccc333333333344443333333333cccccccccccccccc33333333334444333333333333333333cccccccc33444433333333333333333333333333
33333333cccccccc333333333444444333333333cccccccccccccccc33333333344444433333333333333333cccccccc34444443333333333333333333333333
33333333333333333333333333333333333333333333333333333333cccccccccccccccc333333333333333333333333bbbbbbbb333333333333333333333333
33333333333333333333333333333333333333333333333333333333ccccccdcccccccdc333333333333333333333333bbbbbbbb333333333333333333333333
33333333333333b33333333333333333333333b3333333b3333333b3ccccdcccccccdccc33333333333333b333333333bbbbbbbb333333b333333333333333b3
333333333b333b3333333333333333333b333b333b333b333b333b33cccccccccccccccc333333333b333b3333333333bbbbbbb43b333b33333333333b333b33
3333333333b3b333333333333333333333b3b33333b3b33333b3b333cdcccdcccdcccdcc3333333333b3b333333333334444444333b3b3333333333333b3b333
33333333333b33333333333333333333333b3333333b3333333b3333cccccccccccccccc33333333333b33333333333333444433333b333333333333333b3333
33333333333333333333333333333333333333333333333333333333cccccccccccccccc33333333333333333333333333444433333333333333333333333333
33333333333333333333333333333333333333333333333333333333cccccccccccccccc33333333333333333333333334444443333333333333333333333333
33333333ccccccccbbbbbbbb333333333333333333333333cccccccc33333333333333333333333333333333cccccccc333333333333333333333333cccccccc
33333333ccccccccbbbbbbbb333333333333333333333333ccccccdc33333333333333333333333333333333cccccccc333333333333333333333333cccccccc
333333b3ccccccccbbbbbbbb3333333333333333333333b3ccccdccc33333333333333b33333333333333333cccccccc333333b333333333333333b3cccccccc
3b333b33ccccccccbbbbbbb433333333333333333b333b33cccccccc333333333b333b333333333333333333cccccccc3b333b33333333333b333b33cccccccc
33b3b333cccccccc44444443333333333333333333b3b333cdcccdcc3333333333b3b3333333333333333333cccccccc33b3b3333333333333b3b333cccccccc
333b3333cccccccc334444333333333333333333333b3333cccccccc33333333333b33333333333333333333cccccccc333b333333333333333b3333cccccccc
33333333cccccccc33444433333333333333333333333333cccccccc33333333333333333333333333333333cccccccc333333333333333333333333cccccccc
33333333cccccccc34444443333333333333333333333333cccccccc33333333333333333333333333333333cccccccc333333333333333333333333cccccccc
33333333bbbbbbbb3333333333333333333333333333333333333333333333333333333333333333cccccccc33333333bbbbbbbb33333333bbbbbbbbbbbbbbbb
33333333bbbbbbbb3333333333333333333333333333333333333333333333333333333333333333ccccccdc33333333bbbbbbbb33333333bbbbbbbbbbbbbbbb
33333333bbbbbbbb33333333333333b3333333b3333333b333333333333333b33333333333333333ccccdccc333333b3bbbbbbbb333333b3bbbbbbbbbbbbbbbb
33333333bbbbbbb4333333333b333b333b333b333b333b33333333333b333b333333333333333333cccccccc3b333b33bbbbbbb43b333b33bbbbbbb4bbbbbbb4
33333333444444433333333333b3b33333b3b33333b3b3333333333333b3b3333333333333333333cdcccdcc33b3b3334444444333b3b3334444444344444443
333333333344443333333333333b3333333b3333333b333333333333333b33333333333333333333cccccccc333b333333444433333b33333344443333444433
33333333334444333333333333333333333333333333333333333333333333333333333333333333cccccccc3333333333444433333333333344443333444433
33333333344444433333333333333333333333333333333333333333333333333333333333333333cccccccc3333333334444443333333333444444334444443

__gff__
0000000000000000000000000000000008080808080000000000000000000000080808080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080800001000000000000000000000000020202000000000000000000000000000201040000000000000000000000000004040400000000000000000000000000
__sfx__
001500002b0502b0502b05027060270502d1702b150291502a1702c1602d1502f15030150321503515038150331502e1502a060210501e0502a070191502a070171502a070171502907018150190302403013130
000e100621150211502d95026150211500000013950000000e950000000515018930179500e950041500e95000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000b2500e2501125015270192701725015270122500f2500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
