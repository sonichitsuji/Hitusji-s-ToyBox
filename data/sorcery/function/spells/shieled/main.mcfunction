#> sorcery:spells/shieled/main
# 防御
# 

# スコアセット
scoreboard players set @s H.CoolTime 30
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 防御
effect give @s resistance 3 5 true
effect give @s slowness 3 255 true
effect give @s jump_boost 3 238 true