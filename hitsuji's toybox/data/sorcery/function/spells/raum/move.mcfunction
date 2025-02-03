#> sorcery:spells/raum/move
# ラウムの再帰移動の処理
# @input $(Particle_Link) $(Col_Procces) $(Hit_Link) $(This_Link) $(Box) $(d)
# @api

# 再帰カウント
scoreboard players remove @s H.Return.Count 1

# パーティクル表示
execute if entity @s[scores={H.Return.Count=1..}] at @s run particle dust{color:[0.3,1.0,1.0],scale:1.7} ~ ~ ~ 1 1 1 0 25 force

# 前に進む
execute if entity @s[scores={H.Return.Count=1..}] at @s positioned ^ ^ ^0.5 run tp @s ~ ~ ~

# ブロックを転送
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air

# プレイヤーがいたらタグ消さない
execute if entity @s[scores={H.Return.Count=1..}] as @s positioned ~-1 ~-1 ~-1 unless entity @e[type=player,dx=2,dy=2,dz=2] run tag @s remove H.Wait

# 敵がいたらヒット判定を出す
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s positioned ~-1 ~-1 ~-1 as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=2,dy=2,dz=2] run tag @s add H.hit
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s at @s if entity @e[tag=H.hit,sort=nearest,limit=1] at @s run function sorcery:spells/raum/hit

# ただしエンドラ、テメーはダメだ
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s at @s if entity @e[type=ender_dragon,distance=..6] at @s run function sorcery:spells/raum/hit

# 再帰
execute if entity @s[scores={H.Return.Count=1..}] at @s run function sorcery:spells/raum/move