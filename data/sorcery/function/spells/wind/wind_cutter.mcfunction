#> sorcery:spells/wind/wind_cutter
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 25
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Wind_C","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^-0.3 ^ ^0.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 8
scoreboard players set @n[tag=H.Launch] H.Return.Count 8
scoreboard players set @n[tag=H.Launch] H.Death.Count 10
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:entity.breeze.shoot master @a ~ ~ ~ 0.3 1.2
playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 1 1

# 発射!
execute as @e[tag=H.Magic,sort=nearest,limit=1] at @s run function sorcery:spells/wind/move