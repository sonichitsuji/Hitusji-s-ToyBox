#> sorcery:spells/flamme/explosion
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 50
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Explosion","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^-0.3 ^ ^0.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 10
scoreboard players set @n[tag=H.Launch] H.Return.Count 10
scoreboard players set @n[tag=H.Launch] H.Death.Count 30
scoreboard players set @n[tag=H.Launch] H.Blast.Range 5
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 1 1 1
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 2 1

# [ImportKey]: NobwRALgngDgpmAXGAxgSwE4oDYIDRgCuhaAJkmAGwoAsA7AEYAcDATALQCsppAhu-VIBmdkwCcKMexRDOdOq1Z0erGmAIA7XgFsEyQGGKAAgCM6sDF4YdAZyTgUAe0IaISIQAYCKOC7gY7YABuvNiEeuAAHkieYFDRAL7xBFakaIS2iMYE1hCWrogxcNjYaDDWesbuMRgOuRB6MWjWAKLFpeXNAI6EIdhQAMoW3uSIAGYh5YkAukA_3
# 円 1

# 発射!
execute as @e[tag=H.Magic,sort=nearest,limit=1] at @s run function sorcery:spells/flamme/move