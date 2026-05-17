#> sorcery:spells/niente/chase_barrage/cast
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 40
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes positioned ^1 ^ ^-1 rotated ~-45 ~ run function sorcery:spells/niente/chase_barrage/summon
execute anchored eyes positioned ^-1 ^ ^-1 rotated ~45 ~ run function sorcery:spells/niente/chase_barrage/summon
execute anchored eyes positioned ^ ^1 ^-1 rotated ~ ~-45 run function sorcery:spells/niente/chase_barrage/summon
execute anchored eyes positioned ^0.7 ^0.7 ^-1 rotated ~-45 ~-45 run function sorcery:spells/niente/chase_barrage/summon
execute anchored eyes positioned ^-0.7 ^0.7 ^-1 rotated ~45 ~-45 run function sorcery:spells/niente/chase_barrage/summon

# 魔法の詳細設定
scoreboard players set @e[tag=H.Launch] H.Speed 2
scoreboard players set @e[tag=H.Launch] H.Return.Count 2
scoreboard players set @e[tag=H.Launch] H.Death.Count 100
scoreboard players operation @e[tag=H.Launch] H.Entity.ID = @s H.Entity.ID

# 追尾の強さ(初期)
execute store result storage hitsuji:sorcery temporaly double 0.02 run scoreboard players get @n[tag=H.Launch] H.Speed

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound block.note_block.bell master @a ~ ~ ~ 0.5 0.5
playsound block.note_block.bell master @a ~ ~ ~ 0.5 0.8
playsound block.note_block.bell master @a ~ ~ ~ 0.5 1.2

# [ImportKey]: NobwRALgngDgpmAXGAxgSwE4oDYIDRgCuhaAJkmAGwoAsA7AEYAcDATALQCsppAhu-VIBmdkwCcKMexRDOdOq1Z0erGmAIA7XgFsEyQGGKAAgCM6sDF4YdAZyTgUAe0IaISIQAYCKOC7gY7YABuvNiEeuAAHkieYFDRAL7xBFakaIS2iMYE1hCWrogxcNjYaDDWesbuMRgOuRB6MWjWAKLFpeXNAI6EIdhQAMoW3uSIAGYh5YkAukA_3
# 円 1

# 発射!
execute store result storage hitsuji:sorcery owner_id int 1 run scoreboard players get @s H.Entity.ID
execute as @n[tag=H.Firstmove] at @s run function sorcery:spells/niente/chase_shot/move with storage hitsuji:sorcery