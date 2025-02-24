#> sorcery:spells/flamme/hit
# ヒットしたときの処理
# @within sorcery:magic_move

# まずパーティクルだよね
particle flame ~ ~ ~ 0.75 0.75 0.75 0.01 100 force
particle explosion ~ ~ ~ 0 0 0 0 1 force

# 音もいるよね
execute as @s at @s run playsound minecraft:item.firecharge.use master @a ~ ~ ~ 5 1.5 1
execute as @s at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 5 1.2 1

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# タグ付け
execute as @s positioned ~-1.5 ~-1.5 ~-1.5 as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=3,dy=3,dz=3] run tag @s add H.hit

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "7"
data modify storage hitsuji:sorcery Damage_type set value "in_fire"
data modify storage hitsuji:sorcery DeathMsg set value "焼かれた"

# 次に範囲内の奴にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# タグ消去
tag @e remove H.hit
tag @e remove H.That

# そして消滅
kill @s