#> sorcery:spells/bolt/move
# 移動
# @within sorcery:spells/bolt/bolt
# @within sorcery:main_player

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/bolt",Col_Procces:"kill @s",Hit_Link:"sorcery:spells/bolt/hit",This_Link:"sorcery:spells/bolt/move"}