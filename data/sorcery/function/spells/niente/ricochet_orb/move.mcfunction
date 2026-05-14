#> sorcery:spells/niente/ricochet_orb/move
# 
# 

# 再帰カウント
scoreboard players remove @s H.Return.Count 1

# パーティクル表示
execute if entity @s[scores={H.Return.Count=1..}] at @s run function sorcery:particles/ricochet_orb

# 前に衝突判定のあるブロックがなかったら進む、あったら消滅
execute if entity @s[scores={H.Return.Count=1..}] at @s positioned ^ ^ ^0.5 if block ~ ~ ~ #h_core:no_collision run tp @s ~ ~ ~

#跳弾する
function sorcery:magic_moves/ricochet/

# プレイヤーがいたらタグ消さない
execute if entity @s[scores={H.Return.Count=1..}] as @s positioned ~-0.5 ~-0.5 ~-0.5 unless entity @e[type=player,dx=0,dy=0,dz=0] run tag @s remove H.Wait

# エンドラ用の衝突判定
execute if entity @s[scores={H.Return.Count=1..}] as @s at @s as @e[type=ender_dragon,distance=..6] at @s run tag @s add H.hit

# 敵がいたら衝突判定を出す
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=0,dy=0,dz=0] run tag @s add H.hit
execute if entity @s[scores={H.Return.Count=1..},tag=!H.Wait] as @s at @s if entity @e[tag=H.hit,sort=nearest,limit=1] at @s run function sorcery:spells/niente/ricochet_orb/hit

# 再帰
execute if entity @s[scores={H.Return.Count=1..}] at @s run function sorcery:spells/niente/ricochet_orb/move