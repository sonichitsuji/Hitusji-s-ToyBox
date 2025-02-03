#> sorcery:spells/raum/raum
# 魔法発動
# @within sorcery:main_player

# スコアセット
scoreboard players set @s H.CoolTime 60
tag @s add H.CoolTime

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.Raum","H.Life","H.Wait","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^ ^-0.1 ^2.1 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~
scoreboard players set @n[tag=H.Launch] H.Death.Count 1

# パーティクル表示
execute as @n[tag=H.Launch] at @s run particle dust{color:[0.3,1.0,1.0],scale:1.7} ~ ~ ~ 1 1 1 0 30 force

# タグ付け
tag @s add H.Nodamage

# 音を鳴らす
playsound minecraft:item.armor.equip_elytra player @a ~ ~ ~ 2 1.5 1
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.3 1.5 1

# 敵を跳ばす
execute as @n[tag=H.Launch] at @s run execute positioned ~-1 ~-1 ~-1 as @e[tag=!H.Nodamage,type=!#h_core:no_damage,tag=!H.Bullet,tag=!H.Magic,dx=2,dy=2,dz=2] run tag @s add H.hit
execute as @n[tag=H.Launch] at @s run execute as @s at @s if entity @e[tag=H.hit,sort=nearest,limit=1] at @s run function sorcery:spells/raum/hit

# タグ消し
tag @s remove H.Nodamage
tag @s remove H.Launch