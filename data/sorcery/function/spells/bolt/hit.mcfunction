#> sorcery:spells/bolt/hit
# ヒットした時の処理
# @within sorcery:magic_move

# まずパーティクルだよね
particle dust{color:[0.0,0.8,1.0],scale:1.5} ~ ~ ~ 0.5 0.5 0.5 0.01 10 force
particle dust{color:[1.0,0.9,0.0],scale:1.0} ~ ~ ~ 0.5 0.5 0.5 0.01 7 force

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "4"
data modify storage hitsuji:sorcery Damage_type set value "lightning_bolt"
data modify storage hitsuji:sorcery DeathMsg set value "稲妻で撃たれた"

# 次に範囲内の奴にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# タグ消去
tag @e remove H.hit

# そして消滅
kill @s