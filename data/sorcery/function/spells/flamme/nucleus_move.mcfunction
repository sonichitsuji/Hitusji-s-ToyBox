#> sorcery:spells/flamme/nucleus_move
# 移動
# @within sorcery:main_player
# @within sorcery:flamme/nucleus

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/nucleus",Col_Procces:"fill ~-0.5 ~-0.5 ~-0.5 ~0.5 ~0.5 ~0.5 air",Hit_Link:"sorcery:spells/flamme/nucleus_hit",This_Link:"sorcery:spells/flamme/nucleus_move"}