#> sorcery:spells/flamme/explosion_hit
# ヒットしたときの処理
# @within sorcery:magic_move

# 音もいるよね
execute as @s at @s run playsound minecraft:item.firecharge.use master @a ~ ~ ~ 5 1.5 1

# 自分にタグ付け
tag @s add H.This

# 主にもタグ付け
execute as @a if score @s H.Entity.ID = @n[tag=H.This] H.Entity.ID run tag @s add H.That

# タグ付け
execute as @s positioned ~-1.5 ~-1.5 ~-1.5 as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=3,dy=3,dz=3] run tag @s add H.hit

# ダメージの関数に渡す引数
data modify storage hitsuji:sorcery Damage set value "20"
data modify storage hitsuji:sorcery Damage_type set value "explosion"
data modify storage hitsuji:sorcery DeathMsg set value "弾け飛んだ"

# 次に範囲内の奴にダメージ
execute as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,tag=!H.That,distance=..5] at @s run function h_core:damage/ with storage hitsuji:sorcery

# 爆発！
summon tnt ~ ~ ~ {explosion_power:7b}

# タグ消去
tag @e remove H.hit
tag @e remove H.That

# そして消滅
kill @s