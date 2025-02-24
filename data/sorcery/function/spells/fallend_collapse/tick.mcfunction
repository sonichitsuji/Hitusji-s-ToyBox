#> sorcery:fallend_collapse/tick
#
# 魔法のtick実行処理
# @within sorcery:main_player

# スコア増減
scoreboard players remove @e[tag=H.Float] H.FallendC.Time 1

# スコアが0になったら実行
execute as @e[tag=H.Float,scores={H.FallendC.Time=..0}] at @s run function sorcery:spells/fallend_collapse/knock_off