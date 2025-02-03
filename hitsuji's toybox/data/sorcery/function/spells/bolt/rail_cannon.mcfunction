#> sorcery:spells/bolt/rail_cannon
# 魔法発動
# @within sorcery:main_player

# 弾丸消去
clear @s iron_nugget 1

# スコアセット
scoreboard players set @s H.CoolTime 10
tag @s add H.CoolTime
scoreboard players operation @s H.CoolTime += @s H.Charge

# クールタイム表示
title @s actionbar [{"text":"Cooldown..","color":"green"}]

# 魔法を召喚し、位置を設定
execute anchored eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["H.Magic","H.RailCannon","H.Life","H.Wait","H.Launch","H.Launch"],Small:1b,NoGravity:1b,Marker:1b,Invisible:1b}
execute at @s anchored eyes positioned ^-0.3 ^ ^0.5 run tp @n[tag=H.Launch] ~ ~ ~ ~ ~

# 魔法の詳細設定
scoreboard players set @n[tag=H.Launch] H.Speed 20
scoreboard players operation @n[tag=H.Launch] H.Speed += @s H.Charge
scoreboard players operation @n[tag=H.Launch] H.Return.Count = [tag=H.Launch] H.Speed
scoreboard players operation @n[tag=H.Launch] H.Death.Count = $H_500 H.n
scoreboard players operation @n[tag=H.Launch] H.Death.Count /= @n[tag=H.Launch] H.Speed
scoreboard players operation @n[tag=H.Launch] H.Entity.ID = @p H.Entity.ID
scoreboard players operation @n[tag=H.Launch] H.Charge = @s H.Charge

# 設定完了
tag @e remove H.Launch

# 音を鳴らす
playsound hitsuji:bolt player @a ~ ~ ~ 1 1 0.7
execute if score @s H.Charge matches 20.. run playsound hitsuji:explode player @a ~ ~ ~ 1 2 0.7

# 演出
execute as @s at @s anchored eyes positioned ^ ^ ^1.5 run function sorcery:particles/rail_cannon_shot_p
execute if score @s H.Charge matches 20.. as @s at @s anchored eyes positioned ^ ^ ^1.5 run function sorcery:particles/rail_cannon_shot_s

# 発射!
execute as @e[tag=H.Magic,sort=nearest,limit=1] at @s run function sorcery:spells/bolt/rail_move