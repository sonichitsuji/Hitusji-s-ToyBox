#> sorcery:spells/niente/zoltraak_move
# 移動
# @within sorcery:mains/move_ctrl
# @within sorcery:niente/zoltraak

# 演出
execute if entity @s[scores={H.Death.Count=5,H.Return.Count=40}] as @p at @p run playsound hitsuji:explode2 master @a ~ ~ ~ 0.3 1.3 0.1

# 再帰カウント
scoreboard players remove @s H.Return.Count 1

# パーティクル表示
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] at @s run function sorcery:particles/zoltraak

# 前に衝突判定のあるブロックがなかったら進む、あったら消滅
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] at @s positioned ^ ^ ^0.5 if block ~ ~ ~ #h_core:no_collision run tp @s ~ ~ ~
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] at @s positioned ^ ^ ^0.5 unless block ~ ~ ~ #h_core:no_collision at @s run kill @s

# プレイヤーがいたらタグ消さない
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] as @s positioned ~-1 ~-1 ~-1 unless entity @e[type=player,dx=1,dy=1,dz=1] run tag @s remove H.Wait

# ただしエンドラ、テメーはダメだ
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] as @s at @s as @e[type=ender_dragon,distance=..6] at @s run tag @s add H.hit

# 敵がいたらヒット判定を出す
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s positioned ~-1 ~-1 ~-1 as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=1,dy=1,dz=1] run tag @s add H.hit
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5},tag=!H.Wait] as @s at @s if entity @e[tag=H.hit,sort=nearest,limit=1] at @s run function sorcery:spells/niente/zoltraak_hit

# 再帰
execute if entity @s[scores={H.Return.Count=1..,H.Death.Count=..5}] at @s run function sorcery:spells/niente/zoltraak_move