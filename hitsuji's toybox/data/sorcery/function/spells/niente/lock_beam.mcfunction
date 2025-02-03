# #> sorcery:spells/niente/lock_beam
# ロックオン！
#

# タグ
tag @s add H.No_Lockon

# ロックオン判定
execute if entity @s[distance=..300] positioned ~-0.125 ~-0.125 ~-0.125 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] at @s run playsound minecraft:block.iron_door.open player @p ~ ~ ~ 1 2
execute if entity @s[distance=..300] positioned ~-0.125 ~-0.125 ~-0.125 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] store result storage hitsuji:sorcery owner_id int 1 run scoreboard players get @s H.Entity.ID
execute if entity @s[distance=..300] positioned ~-0.125 ~-0.125 ~-0.125 as @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] run function sorcery:spells/niente/lock_on with storage hitsuji:sorcery
execute if entity @s[distance=..300] positioned ~-0.125 ~-0.125 ~-0.125 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] run tag @s remove H.No_Lockon
execute if entity @s[distance=..300] positioned ~-0.125 ~-0.125 ~-0.125 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[type=!#h_core:no_damage,tag=!H.Magic,tag=!H.Target,tag=!H.No_Lockon,dx=0] run return fail

# タグ消し
tag @s remove H.No_Lockon

# 再帰
execute if entity @s[distance=..300] if block ~ ~ ~ #h_core:no_collision positioned ^ ^ ^0.5 run function sorcery:spells/niente/lock_beam