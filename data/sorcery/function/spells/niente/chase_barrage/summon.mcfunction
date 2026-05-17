#> sorcery:spells/niente/chase_barrage/summon
# ジャッジメントの複数同時召喚処理
# @within sorcery:spells/niente/chase_barrage/cast
#@input $(pos)

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Chase_shot","H.Life","H.Wait","H.Launch","H.Firstmove","H.Yet"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute anchored eyes run tp @n[tag=H.Yet] ~ ~ ~ ~ ~

#位置設定が終わったのでタグ消し
tag @n[tag=H.Yet] remove H.Yet

# 演出
execute as @s run function sorcery:particles/chase_barrage