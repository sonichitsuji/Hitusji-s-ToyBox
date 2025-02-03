#> sorcery:mains/move_ctrl
# 魔法の移動を実行
# @within sorcery:main_player

# 魔法を動かす
execute as @e[tag=H.Flamme] at @s run function sorcery:spells/flamme/move
execute as @e[tag=H.Bolt] at @s run function sorcery:spells/bolt/move
execute as @e[tag=H.weltraum] at @s run function sorcery:spells/raum/move
execute as @e[tag=H.Nucleus] at @s run function sorcery:spells/flamme/nucleus_move
execute as @e[tag=H.RailCannon] at @s run function sorcery:spells/bolt/rail_move
execute as @e[tag=H.Zoltraak] at @s run function sorcery:spells/niente/zoltraak_move
execute as @e[tag=H.Chase_shot] at @s run function sorcery:spells/niente/move with storage hitsuji:sorcery
execute as @e[tag=H.Wind_C] at @s run function sorcery:spells/wind/move