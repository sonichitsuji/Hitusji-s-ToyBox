#> h_core:basic_control
#
# 全体制御
# @handles
# @within h_core:all_on

# アイテムの使用を検知して作動
execute as @a[scores={H.Potion.Used=1..}] at @s if entity @e[nbt={Item:{components:{"minecraft:custom_data":{HData:{ItemType:"reloader"}}}}}] run function h_core:force_loader

# スコアリセット
scoreboard players set @a H.Potion.Used 0
scoreboard players set @a H.Death 0
scoreboard players set @a H.Drop 0

# 毎ティック増減するスコア
scoreboard players remove @e[tag=H.Life] H.Death.Count 1
scoreboard players remove @a[scores={H.CoolTime=1..}] H.CoolTime 1

# 寿命がきたよ
kill @e[tag=H.Life,scores={H.Death.Count=0}]