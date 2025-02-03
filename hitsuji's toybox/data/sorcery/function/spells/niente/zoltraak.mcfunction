#> sorcery:spells/flamme/nucleus
# 人を殺す魔法だよ
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 20
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Zoltraak","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^ ^-0.1 ^1.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 40
scoreboard players set @n[tag=H.Launch] H.Return.Count 40
scoreboard players set @n[tag=H.Launch] H.Death.Count 30
scoreboard players set @n[tag=H.Launch] H.Blast.Range 5
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 0.7 1 0.5

# 演出
execute as @s at @s anchored eyes positioned ^ ^ ^1.5 run function sorcery:particles/zoltraak_shot

# 発射!
execute as @e[tag=H.Magic,sort=nearest,limit=1] at @s run function sorcery:spells/niente/zoltraak_move