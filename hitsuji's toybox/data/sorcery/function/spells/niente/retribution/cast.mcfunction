#> sorcery:spells/niente/retribution/cast
# 魔法発動
# @within sorcery:mains/detect_sorcery

# スコアセット
scoreboard players set @s H.CoolTime 60
tag @s add H.CoolTime

# 回数加算
execute unless entity @s[tag=H.Using.Retribution] run tag @s add H.Using.Retribution
# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 基準のアマスタ召喚
$execute as @n[tag=H.Target,tag=H.Target.ID.$(owner_id)] at @s anchored eyes positioned ^ ^ ^ run summon minecraft:armor_stand ^ ^ ^ {Tags:["H.Temporaly"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}

# アマスタの視点を前回と被らないように計算し、決定(対象の上方向のみ)
scoreboard players add $H.Yaw H.Angle.Yaw 138
scoreboard players operation $H.Yaw H.Angle.Yaw %= $H360 H.Const
scoreboard players add $H.Pitch H.Angle.Pitch 55
scoreboard players operation $H.Pitch H.Angle.Pitch %= $H90 H.Const
scoreboard players operation $H.Pitch H.Angle.Pitch *= $H-1 H.Const
execute as @e[type=armor_stand,tag=H.Temporaly] store result entity @s Rotation[0] float 1 run scoreboard players get $H.Yaw H.Angle.Yaw
execute as @e[type=armor_stand,tag=H.Temporaly] store result entity @s Rotation[1] float 1 run scoreboard players get $H.Pitch H.Angle.Pitch
scoreboard players operation $H.Pitch H.Angle.Pitch *= $H-1 H.Const

# アマスタの視線の先に魔法を召喚し、位置を設定　魔法自体はジャッジメントと共通
execute as @e[type=armor_stand,tag=H.Temporaly] at @s run summon minecraft:armor_stand ^ ^ ^10 {Tags:["H.Magic","H.judgement","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute as @e[type=armor_stand,tag=H.Temporaly] at @s positioned ^ ^ ^10 run function sorcery:particles/judgement_shot
execute as @n[tag=H.Launch] at @s run rotate @s facing entity @n[type=armor_stand,tag=H.Temporaly] feet
kill @e[type=armor_stand,tag=H.Temporaly]

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 40
scoreboard players set @n[tag=H.Launch] H.Return.Count 40
scoreboard players set @n[tag=H.Launch] H.Death.Count 35
scoreboard players set @n[tag=H.Launch] H.Blast.Range 5
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 0.7 1 0.5

# 発射!
execute as @n[tag=H.Magic] at @s run function sorcery:spells/niente/judgement/move