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
0bbbbbb0bbbbb000bbbb5000bbbbb00000b3bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b8558b0b8bbb000b8bb5000b8bbb0000bb33bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb55bb0bbbbb000bbbbb000bbbbb0000bbb3bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00000bbbb0000bb500000bbbb000b33b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb000bbbbbb50bbbbbb00bbbbbb50bb3bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbbbb000bbbb5000bbbbb000bbbb500b33b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00bbbb00000505050050050b0050005500bb3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05000050005555000550550005500550050050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ffff0000f2200000222200000000000000000e062ee26007222270000000000000000000000000000000000000000000000000000000000000000000000000
00bffb0000bff00050ffff0500000000000022e06787787607666670000000000000000000000000000000000000000000000000000000000000000000000000
05ffff5050fff55005ffff500000000000006e706777777607666670000000000000000000000000000000000000000000000000000000000000000000000000
055555500555555005555550000000000006678006766760007777000000000000000000000000000000000000000000000000000000000000000000080e0e08
055555505005555005555550000000000e7777770077770000777700000000000000000000000000000000000000000000000000000000000000000000e0e0e0
05555550000555500555555000000000e677777677777777777267770000000000000000000000000000000000000000000000000000000000000000080e0e08
00555500000555500055550000000000677007707700007777062077000000000000000000000000000000000000000000000000000000000000000000000000
00500500005500500050050000000000077007707700007777026077000000000000000000000000000000000000000000000000000000000000000000000000
08888880088888800888888008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88655688088888880888888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88655688056888880568888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88866888056888880568888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888068888880688888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666600008888000088880000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666600006666000066660000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666600006666000000000000666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000333000000003000000888800000000000000000000000eeeee00000000000000000000000000000000000000000000000000000000000000000000000000
000033330000033000008ff8888800000000ff111ff000000e000ee0000000000000000000000000000000000000000000000000000000000000000000000000
000333333303333000008ff888880000000fffffffff00000ee00ee0000000000000000000000000000000000000000000000000000000000000000000000000
003333333333300008ff8888888ff000000f88fff88f000000eeee00000000000000000000000000000000000000000000000000000000000000000000000000
033333333333303308ff8888888ff880000fffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33883388333333338888888888888880000fffffffff000000000222222200000000000000000000000000000000000000000000000000000000000000000000
33883388333333308888888888888880000ff888888f000000000222222222000000000000000000000000000000000000000000000000000000000000000000
333333333333300088888888888888885555ff8888f55555000222ffffff22200000000000000000000000000000000000000000000000000000000000000000
0300333330333000888ff555f555f8885555558885555555000222f55f55f2200000000000000000000000000000000000000000000000000000000000000000
0003333003333000888ff555f555ff880555555885555550a0a22ff55f55f2200000000000000000000000000000000000000000000000000000000000000000
0003330333033000000fffffffff0f8800055558855550000a0008fffffff8000000000000000000000000000000000000000000000000000000000000000000
000000033300330000000fffffff00000005555555555000a0a00888666688000000000000000000000000000000000000000000000000000000000000000000
0000000330003300000f000000000f00000555555555500005008888868888000000000000000000000000000000000000000000000000000000000000000000
0000033330003300000fff00000fff00005550000055500000508888868888000000000000000000000000000000000000000000000000000000000000000000
000033333003333000000fffffff0000005500000005550000050888888800000000000000000000000000000000000000000000000000000000000000000000
00003333300333300000000000000000005500000005550000000088008800000000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffc000000000000000000000f0b0
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f12fc0000000000e00000000f0b08
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f1b28f000000000e0e000000f0b080
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f1b28980000000000e000000f0b080c
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f1b282c20000000000000000f0b080c0
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001b28000c00000000000000000b080c00
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b28000020000000000000000b080c000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002800000c0000000000000000080c0000
00000000000000000008800008888880000000000000000000000000000000000000000000000000000000000011110000066000003663000300000000000000
00000000000000000088880088888888000000000000000000000000000000000000000000000000000000000118811003366330066666600030033300000000
00000000000990000888888088888888000000000000000000000000000000000000000000000000000000000188881006666660065555603336161600000000
00000000009999000888888088888888000000000000000000000000000000000000000000000000000000000118811044466444066666600666166600000000
00000000009dd9000066660088888888000000000000000000000000000000000000000000000000000000000111111044444444444444440666166600000000
00000000000dd0000066660000666600000000000000000000000000000000000000000000000000000000000111111044444444444444446006161600000000
00000000000000000006600000666600000000000000000000000000000000000000000000000000000000000111111044444444044444400060066600000000
00000000000000000000000000666600000000000000000000000000000000000000000000000000000000000011110004444440004444000600000000000000
000000000000000000b000b0bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000b0b00bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000b000bbbbbbb4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000b000b00000000004bbbbbb4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000b0b0000000000044444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000b00000000000000444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000004444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0ccc0cc0cc0c00cc0ccc0808088808080888022222222a222222a000000000000000000000000000000000000000000000000000000000000000000000000
ccccccdcccccccdccccccccc88888777888888889222e22e2a222222000000000000000000000000000000000000000000000000000000000000000000000000
ccccdccccccccccccccccccc888877578888888822722227222a2222000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccccccccccccccc7888777888888888222222222222222a000000000000000000000000000000000000000000000000000000000000000000000000
cdcccccccccccdcccccccccc8788888888888888e222222222222222000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccdccccccccccccc8878888888888888222227e22a222222000000000000000000000000000000000000000000000000000000000000000000000000
ccccdccccccccccccccccccc888868888888888822222222a2222222000000000000000000000000000000000000000000000000000000000000000000000000
c0c0cc0cc0cc0c0ccc0ccc0c8080880880808808222222222222aa22000000000000000000000000000000000000000000000000000000000000000000000000
00000000000556000dddd22200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000555660ddc2222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005555560dccddd2200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000005555566d2dddd2200055000000590000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000055555555d2dddd2d00055000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000005555555522dddccd00000000000590000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000555550022222cdd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000055550022ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000599dd9958880088800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550599dd9958888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555550499999948888888e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d0000049999994088888e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05d000004999999400888e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000000000000008080808080000000000000000000000080808000808080000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000010100000000000000010101000000000001000000000000000000000000020202020202020000000000000000000001040000000000000000000000000004040400000000000000000000000000
__sfx__
001500002b0502b0502b05027060270502d1702b150291502a1702c1602d1502f15030150321503515038150331502e1502a060210501e0502a070191502a070171502a070171502907018150190302403013130
000e100621150211502d95026150211500000013950000000e950000000515018930179500e950041500e95000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00000b2500e2501125015270192701725015270122500f2500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
