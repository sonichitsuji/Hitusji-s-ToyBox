#> sorcery:magic_moves/ricochet/
# 反射の処理
#

# (0.0 0.0 0.0)を基準として利用し現在からX軸、Y軸、Z軸の方向に反射した時の向きを計算している
# それを利用し同時に壁の位置も判定することによって、反射する向きを決定しその向きで確定させる　ちゅずめさんのもののほぼパクリです　ありがとう
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 positioned 0.0 ~ ~ positioned ^ ^ ^-1 facing 0.0 0.0 0.0 positioned as @s positioned ^ ^ ^0.25 rotated as @s unless block ^ ^ ^0.25 #h_core:no_collision facing entity @s feet positioned ^ ^ ^0.5 rotated as @s if block ^ ^ ^-0.25 #h_core:no_collision facing entity @s feet facing ^ ^ ^-1 positioned as @s run function sorcery:magic_moves/ricochet/rotate
execute positioned ^ ^ ^0.25 rotated ~180 ~ unless block ^ ^ ^0.25 #h_core:no_collision at @s positioned ^ ^ ^-0.25 rotated ~180 ~ if block ^ ^ ^-0.25 #h_core:no_collision facing ^ ^ ^-1 run function sorcery:magic_moves/ricochet/rotate
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 positioned ~ ~ 0.0 positioned ^ ^ ^-1 facing 0.0 0.0 0.0 positioned as @s positioned ^ ^ ^0.25 rotated as @s unless block ^ ^ ^0.25 #h_core:no_collision facing entity @s feet positioned ^ ^ ^0.5 rotated as @s if block ^ ^ ^-0.25 #h_core:no_collision facing entity @s feet facing ^ ^ ^-1 positioned as @s run function sorcery:magic_moves/ricochet/rotate


execute if entity @s[tag=!H.Reflected] positioned ^ ^ ^0.5 unless block ~ ~ ~ #h_core:no_collision facing entity @s feet run function sorcery:magic_moves/ricochet/rotate