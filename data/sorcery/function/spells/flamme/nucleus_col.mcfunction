#> sorcery:spells/flamme/nucleus_col
# ヒットしたときの処理
# @within sorcery:magic_move

# まずパーティクルだよね
particle flame ~ ~ ~ 0.75 0.75 0.75 0.01 10 force
particle explosion ~ ~ ~ 0.5 0.5 0.5 0 5 force
particle lava ~ ~ ~ 0.75 0.75 0.75 0.01 10 force

# 音もいるよね
execute as @s at @s run playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 1 1.5 1

# タグ消去
tag @e remove H.hit
tag @e remove H.That

# 否！死！
kill @s