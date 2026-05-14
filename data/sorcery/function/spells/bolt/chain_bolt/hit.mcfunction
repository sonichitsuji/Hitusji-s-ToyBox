#> sorcery:spells/bolt/chain_bolt/hit
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
data modify storage hitsuji:sorcery Damage set value "7"
data modify storage hitsuji:sorcery Damage_type set value "mob_attack"
data modify storage hitsuji:sorcery DeathMsg set value "稲妻で撃ち抜かれた"

# 次にダメージ
execute as @n[tag=H.hit] at @s run function h_core:damage/ with storage hitsuji:sorcery


# 最も近い敵を向く
execute if score @s H.Counter matches ..4 facing entity @n[type=!#h_core:no_damage,tag=!H.hit,tag=!H.Magic,distance=..7] eyes as @s run tp @s ~ ~ ~ ~ ~

# 追尾カウント加算
scoreboard players add @s H.Counter 1

# カウントが5以上なら消滅
execute if score @s H.Counter matches 5.. run kill @s

# タグ消去
tag @e remove H.hit

