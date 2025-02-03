#> sorcery:spells/heal/heal
# heal発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 30
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 回復
summon area_effect_cloud ~ ~ ~ {Particle:{type:"dust",color:[0.000,0.000,0.000],scale:1},Radius:1f,Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:regeneration",amplifier:5,duration:6,show_particles:0b,show_icon:0b}]}}

# 音を鳴らす
playsound hitsuji:heal master @a ~ ~ ~ 1 1

# 演出
particle dust{color:[0.9,1.0,0.5],scale:1.0} ~ ~1 ~ 0.5 1.0 0.5 0.01 30 force
particle totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.01 5 force