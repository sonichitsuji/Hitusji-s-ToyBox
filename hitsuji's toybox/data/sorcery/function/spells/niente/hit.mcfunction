#> sorcery:spells/flamme/hit
# ヒットしたときの処理
# @within sorcery:magic_move

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "2"
data modify storage hitsuji:sorcery Damage_type set value "h_core:weak"
data modify storage hitsuji:sorcery DeathMsg set value "撃ち抜かれた"

# 次に範囲内の奴にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery

# タグ消去
tag @e remove H.hit
tag @e remove H.That

# そして消滅
kill @s
