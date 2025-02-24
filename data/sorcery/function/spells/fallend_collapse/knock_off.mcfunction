#> sorcery:fallend_collapse/knock_off
#
# 敵を叩き落とす
# @within sorcery:spells/fallend_collapse/tick

# AEC召喚
execute if entity @s[type=player] run summon minecraft:area_effect_cloud ~ ~ ~ {Radius:1,Duration:6,Age:4,effects:[{id:"resistance",amplifier:255,duration:4}]}

# 爆☆発
particle explosion ~ ~1 ~ 0 0 0 0 1 normal @a
playsound entity.generic.explode player @a ~ ~1 ~ 1 1 1

# 叩き落とす!
execute if entity @s[type=player] run summon minecraft:creeper ~ ~2 ~ {ExplosionRadius:-1,Fuse:0}
execute if entity @s[type=!player] run data merge entity @s {Motion:[0.0,-10.0,0.0]}


# 水素の音~
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 1 1

# タグ消去
tag @s remove H.Float