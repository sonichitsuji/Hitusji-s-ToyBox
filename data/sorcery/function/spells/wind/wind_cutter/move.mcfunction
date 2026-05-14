#> sorcery:spells/wind/wind_cutter/move
# 移動
# @within sorcery:main_player
# @within sorcery:wind/wind_cutter

# 移動のapiを起動
function sorcery:magic_move {Particle_Link:"function sorcery:particles/wind_cutter",Col_Procces:"kill @s",Hit_Link:"sorcery:spells/wind/wind_cutter/hit",This_Link:"sorcery:spells/wind/wind_cutter/move"}