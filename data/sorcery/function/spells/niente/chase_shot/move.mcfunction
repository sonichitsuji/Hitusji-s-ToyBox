#> sorcery:spells/niente/chase_shot/move
# チェイスショットの移動の処理
#@input storage hitsuji:sorcery

# ストレージセット
execute as @s store result storage hitsuji:sorcery owner_id int 1 run scoreboard players get @s H.Entity.ID

# H.Speedをdoubleでstorageに入れて0.02倍
execute store result storage hitsuji:sorcery temporaly double 0.02 run scoreboard players get @s H.Speed

# 再帰カウント
scoreboard players remove @s H.Return.Count 1

# パーティクル表示
execute if score @s H.Return.Count matches 1.. at @s run function sorcery:particles/chase_shot

# 前進
execute if score @s H.Return.Count matches 1.. positioned ^ ^ ^0.1 run tp ^ ^ ^

# 追尾
$execute if score @s H.Return.Count matches 1.. at @s anchored feet positioned ^ ^ ^2 facing entity @n[tag=H.Target,tag=H.Target.ID.$(owner_id)] eyes positioned ^ ^ ^$(temporaly) facing entity @s feet run rotate @s facing ^ ^ ^-1

# 前に衝突判定のあるブロックがなかったら進む、あったら消滅
execute if score @s H.Return.Count matches 1.. at @s positioned ^ ^ ^0.2 if block ~ ~ ~ #h_core:no_collision run tp @s ~ ~ ~
execute if score @s H.Return.Count matches 1.. at @s positioned ^ ^ ^0.5 unless block ~ ~ ~ #h_core:no_collision at @s run kill @s

# プレイヤーがいたらタグ消さない
execute if score @s H.Return.Count matches 1.. as @s positioned ~-0.5 ~-0.5 ~-0.5 unless entity @e[type=player,dx=0,dy=0,dz=0] run tag @s remove H.Wait

# ただしエンドラ、テメーはダメだ
execute if score @s H.Return.Count matches 1.. as @s at @s as @e[type=ender_dragon,distance=..6] at @s run tag @s add H.hit

# 敵がいたらヒット判定を出す
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#h_core:no_damage,tag=!H.Magic,dx=0,dy=0,dz=0] run tag @s add H.hit
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s at @s if entity @e[tag=H.hit,sort=nearest,limit=1] at @s run function sorcery:spells/niente/chase_shot/hit

# 弾加速
execute if score @s H.Return.Count matches ..0 unless score @s H.Speed matches 100.. run scoreboard players add @s H.Succes.Count 1
execute if score @s H.Return.Count matches ..0 if score @s H.Succes.Count matches 10 if score @s H.Death.Count matches ..85 run scoreboard players add @s H.Speed 2
execute if score @s H.Return.Count matches ..0 if score @s H.Succes.Count matches 10 run scoreboard players set @s H.Succes.Count 0

# 再帰
execute if score @s H.Return.Count matches 1.. at @s run function sorcery:spells/niente/chase_shot/move with storage hitsuji:sorcery