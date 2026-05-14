#> sorcery:spells/niente/judgement/cast
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 20
execute if score @s H.Charge matches 20..39 run scoreboard players add @s H.CoolTime 50
execute if score @s H.Charge matches 40 run scoreboard players add @s H.CoolTime 70
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# チャージ時間に応じ、魔法の数と配置を変更
# チャージ0
execute if score @s H.Charge matches ..19 anchored eyes positioned ^ ^-0.1 ^1.5 run function sorcery:spells/niente/judgement/summon {"path":"shot"}

# チャージ1
execute if score @s H.Charge matches 20..39 anchored eyes positioned ^ ^1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}
execute if score @s H.Charge matches 20..39 anchored eyes positioned ^2.5 ^-0.1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}
execute if score @s H.Charge matches 20..39 anchored eyes positioned ^-2.5 ^-0.1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}

# チャージ2
execute if score @s H.Charge matches 40 anchored eyes positioned ^ ^-1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot"}
execute if score @s H.Charge matches 40 anchored eyes positioned ^ ^2 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}
execute if score @s H.Charge matches 40 anchored eyes positioned ^3 ^-1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}
execute if score @s H.Charge matches 40 anchored eyes positioned ^-3 ^-1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot_mini"}
execute if score @s H.Charge matches 40 anchored eyes positioned ^2 ^1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot"}
execute if score @s H.Charge matches 40 anchored eyes positioned ^-2 ^1 ^-1 run function sorcery:spells/niente/judgement/summon {"path":"shot"}

# 魔法の詳細設定
scoreboard players set @e[tag=H.Launch] H.Speed 40
scoreboard players set @e[tag=H.Launch] H.Return.Count 40
scoreboard players set @e[tag=H.Launch] H.Death.Count 35
scoreboard players operation @e[tag=H.Launch] H.Entity.ID = @s H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 0.7 1 0.5

# 演出
# execute as @s at @s anchored eyes positioned ^ ^ ^1.5 run function sorcery:particles/judgement_shot

# 発射!
execute as @e[tag=H.Firstmove] at @s run function sorcery:spells/niente/judgement/move