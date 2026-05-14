#> sorcery:spells/raum/weltraum/cast
# 魔法発動
# @within sorcery:main_player

# スコアセット
scoreboard players set @s H.CoolTime 100
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.weltraum","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^-0.3 ^ ^0.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 5
scoreboard players set @n[tag=H.Launch] H.Return.Count 5
scoreboard players set @n[tag=H.Launch] H.Death.Count 60
scoreboard players set @n[tag=H.Launch] H.Blast.Range 5
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:item.armor.equip_elytra player @a ~ ~ ~ 2 1.5 1
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.3 2 1

# 発射! （独自処理）
execute as @n[tag=H.Magic] at @s run function sorcery:spells/raum/weltraum/move