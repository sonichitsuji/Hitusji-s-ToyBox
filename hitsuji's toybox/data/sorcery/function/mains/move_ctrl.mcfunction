#> sorcery:mains/move_ctrl
# 魔法の移動を実行
# @within sorcery:main_player

# 魔法を動かす
execute as @e[tag=H.Flamme] at @s run function sorcery:spells/flamme/flamme/move
execute as @e[tag=H.Nucleus] at @s run function sorcery:spells/flamme/nucleus/move
execute as @e[tag=H.Explosion] at @s run function sorcery:spells/flamme/explosion/move
execute as @e[tag=H.Bolt] at @s run function sorcery:spells/bolt/bolt/move
execute as @e[tag=H.Chain_Bolt] at @s run function sorcery:spells/bolt/chain_bolt/move
execute as @e[tag=H.Rail_Cannon] at @s run function sorcery:spells/bolt/rail_cannon/move
execute as @e[tag=H.Ricochet_orb] at @s run function sorcery:spells/niente/ricochet_orb/move
execute as @e[tag=H.Chase_shot] at @s run function sorcery:spells/niente/chase_shot/move with storage hitsuji:sorcery
execute as @e[tag=H.judgement] at @s run function sorcery:spells/niente/judgement/move
execute as @e[tag=H.Wind_C] at @s run function sorcery:spells/wind/wind_cutter/move
execute as @e[tag=H.weltraum] at @s run function sorcery:spells/raum/weltraum/move