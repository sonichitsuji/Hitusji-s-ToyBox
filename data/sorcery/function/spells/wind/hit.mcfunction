#> sorcery:spells/bolt/hit
# ヒットした時の処理
# @within sorcery:magic_move

# まずパーティクルだよね
particle dust{color:[0.5,1.0,0.5],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.01 10 force

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "3"
data modify storage hitsuji:sorcery Damage_type set value "wind_charge"
data modify storage hitsuji:sorcery DeathMsg set value "吹き飛ばされた"

# ダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# 吹っ飛ばす
tp ^ ^ ^-1
scoreboard players set $x player_motion.api.launch 0
scoreboard players set $y player_motion.api.launch 20000
scoreboard players set $z player_motion.api.launch 0
data merge entity @n[tag=H.hit] {Motion:[0.0,0.7,0.0]}
execute as @n[tag=H.hit] at @s run function player_motion:api/launch_xyz

# タグ消去
tag @e remove H.hit

# そして消滅
kill @s