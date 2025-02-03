#> sorcery:spells/wind/wind_step
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 30
tag @s add H.CoolTime

# 射出
tp @s
scoreboard players set $strength player_motion.api.launch 20000
function player_motion:api/launch_looking

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 安全着地
effect clear @s slow_falling
effect give @s slow_falling 3 1

# エフェクト
particle sweep_attack ~ ~ ~ 1 1 1 0.1 5 force
particle explosion_emitter ~ ~ ~ 0.05 0.05 0.05 1 1
execute rotated ~90 ~ run function sorcery:particles/wind_step

# 音
playsound minecraft:entity.breeze.shoot master @a ~ ~ ~ 0.7 1.1
playsound minecraft:entity.breeze.jump master @a ~ ~ ~ 0.5 1