#> sorcery:spells/raum/hit
# ヒットしたときの処理
# @within sorcery:spells/raum/move

# 音、いるよね
execute as @s at @s run playsound minecraft:entity.player.teleport master @a ~ ~ ~ 1 1 1

# 次に範囲内の奴を飛ばす
execute as @e[tag=H.hit] at @s run tp ~ ~10000 ~

# タグ消し
tag @e remove H.hit