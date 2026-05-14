#> 
# 
# 

# タグ消去
tag @s remove H.Click.Check

# 演出
execute if score @s H.Charge matches 0 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.7 1 1
execute if score @s H.Charge matches 19 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.7 1.1 1
execute if score @s H.Charge matches 39 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.7 1.2 1
execute if score @s H.Charge matches 39 run playsound entity.player.levelup master @a ~ ~ ~ 0.7 1.45 1

# スコアアップ
execute unless score @s H.Charge matches 40.. run scoreboard players add @s H.Charge 1