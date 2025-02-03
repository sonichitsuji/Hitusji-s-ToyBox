#> sorcery:spells/flamme/move
# 移動
# @within sorcery:main_player
# @within sorcery:flamme/flamme

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/flamme",Col_Procces:"function sorcery:spells/flamme/hit",Hit_Link:"sorcery:spells/flamme/hit",This_Link:"sorcery:spells/flamme/move"}