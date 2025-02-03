#> sorcery:spells/fallend_collapse/float
#
# 敵の処理
# @within sorcery:fallend_collapse/main

# タグ付きの敵にエフェクトを発生
function sorcery:particles/fallend_c

# タグ付きの敵にAEC召喚
execute if entity @s[type=player] run summon area_effect_cloud ~ ~ ~ {Radius:1f,Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:levitation",amplifier:60,duration:4}]}}
execute if entity @s[type=!player] run data merge entity @s {Motion:[0.0,2.0,0.0]}

# スコア設定
scoreboard players set @s H.FallendC.Time 20
#particle entity_effect{color:[1f,0f,0f,0.3f]} ~ ~1 ~