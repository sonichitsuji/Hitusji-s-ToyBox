#> sorcery:spells/flamme/nucleus_hit
# ヒットしたときの処理
# @within sorcery:magic_move

# まずパーティクルだよね
particle flame ~ ~ ~ 0.75 0.75 0.75 0.01 10 force
particle explosion ~ ~ ~ 0 0 0 0 1 force
particle lava ~ ~ ~ 0.75 0.75 0.75 0.01 10 force

# 音もいるよね
execute as @s at @s run playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 1 1.5 1

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "20"
data modify storage hitsuji:sorcery Damage_type set value "lava"
data modify storage hitsuji:sorcery DeathMsg set value "焼き貫かれた"

# 次に範囲内の奴にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# タグ消去
tag @e remove H.hit
tag @e remove H.That