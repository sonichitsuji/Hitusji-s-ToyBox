#> sorcery:spells/flamme/explosion_move
# 移動
# @within sorcery:main_player
# @within sorcery:flamme/explosion

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/explosion",Col_Procces:"function sorcery:spells/flamme/explosion_hit",Hit_Link:"sorcery:spells/flamme/explosion_hit",This_Link:"sorcery:spells/flamme/explosion_move"}