#> sorcery:fallend_collapse/main
#
# 魔法発動
# @within sorcery:main_player

# スコアセット
scoreboard players set @s H.CoolTime 50
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 範囲内のエンティティを選択
execute as @e[distance=..20,type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic] run tag @s add H.Float

# 自分だけタグ消し
tag @s remove H.Float

# 水素の音~
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 1 1

# タグ付きの敵の処理
execute as @e[distance=..20,tag=H.Float] at @s run function sorcery:spells/fallend_collapse/float

