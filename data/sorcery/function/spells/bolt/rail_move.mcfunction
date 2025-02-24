#> sorcery:spells/bolt/rail_move
# 移動
# @within sorcery:spells/bolt/rail_cannon
# @within sorcery:main_player

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/rail_cannon",Col_Procces:"kill @s",Hit_Link:"sorcery:spells/bolt/rail_hit",This_Link:"sorcery:spells/bolt/rail_move"}