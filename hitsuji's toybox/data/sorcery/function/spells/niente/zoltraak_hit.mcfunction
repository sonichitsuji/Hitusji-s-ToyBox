#> sorcery:spells/niente/zoltraak_hit
# ヒットしたときの処理
# @within sorcery:magic_move

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# タグ付け
execute as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,distance=..3] run tag @s add H.hit

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "2000"
data modify storage hitsuji:sorcery Damage_type set value "mob_attack"
data modify storage hitsuji:sorcery DeathMsg set value "よって消滅した"

# 次に範囲内の奴にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# タグ消去
tag @e remove H.hit
tag @e remove H.That

# そして消滅
kill @s
