#> sorcery:spells/flamme/nucleus/move
# 移動
# @within sorcery:main_player
# @within sorcery:flamme/nucleus

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/nucleus",Col_Procces:"function sorcery:spells/flamme/nucleus/col",Hit_Link:"sorcery:spells/flamme/nucleus/hit",This_Link:"sorcery:spells/flamme/nucleus/move"}