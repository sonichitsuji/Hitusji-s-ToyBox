#> sorcery:spells/niente/chase_shot
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 10
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Chase_shot","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^-0.3 ^ ^0.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 2
scoreboard players set @n[tag=H.Launch] H.Return.Count 2
scoreboard players set @n[tag=H.Launch] H.Death.Count 100
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @s H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound block.note_block.bell master @a ~ ~ ~ 0.2 1.4

# [ImportKey]: NobwRALgngDgpmAXGAxgSwE4oDYIDRgCuhaAJkmAGwoAsA7AEYAcDATALQCsppAhu-VIBmdkwCcKMexRDOdOq1Z0erGmAIA7XgFsEyQGGKAAgCM6sDF4YdAZyTgUAe0IaISIQAYCKOC7gY7YABuvNiEeuAAHkieYFDRAL7xBFakaIS2iMYE1hCWrogxcNjYaDDWesbuMRgOuRB6MWjWAKLFpeXNAI6EIdhQAMoW3uSIAGYh5YkAukA_3
# 円 1

# 発射!
execute store result storage hitsuji:sorcery owner_id int 1 run scoreboard players get @s H.Entity.ID
execute as @n[tag=H.Magic] at @s run function sorcery:spells/niente/move with storage hitsuji:sorcery