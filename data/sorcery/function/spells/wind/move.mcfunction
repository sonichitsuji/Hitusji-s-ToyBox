#> sorcery:spells/flamme/move
# 移動
# @within sorcery:main_player
# @within sorcery:flamme/flamme

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/wind_cutter",Col_Procces:"kill @s",Hit_Link:"sorcery:spells/wind/hit",This_Link:"sorcery:spells/wind/move"}