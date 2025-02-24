#> sorcery:magic_craft/main
# 大釜クラフトのtick実行
# @within sorcery:main_player

execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:gunpowder"}},sort=nearest,limit=1] at @s run function sorcery:craft/flamme
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:phantom_membrane"}},sort=nearest,limit=1] at @s run function sorcery:craft/fallend_c
execute align xyz if entity @e[dx=0,type=item,nbt={Item:{id:"minecraft:gold_block"}},sort=nearest,limit=1] as @e[dx=0,type=item,nbt={Item:{id:"minecraft:lightning_rod"}},sort=nearest,limit=1] at @s run function sorcery:craft/rail_cannon
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:lightning_rod"}},sort=nearest,limit=1] at @s run function sorcery:craft/bolt
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:ender_eye"}},sort=nearest,limit=1] at @s run function sorcery:craft/weltraum
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:ender_pearl"}},sort=nearest,limit=1] at @s run function sorcery:craft/raum
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:blaze_powder"}},sort=nearest,limit=1] at @s run function sorcery:craft/nucleus
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:glistering_melon_slice"}},sort=nearest,limit=1] at @s run function sorcery:craft/heal
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:quartz"}},sort=nearest,limit=1] at @s run function sorcery:craft/zoltraak
execute align xyz as @e[dx=0,type=item,nbt={Item:{id:"minecraft:spider_eye"}},sort=nearest,limit=1] at @s run function sorcery:craft/chase_shot