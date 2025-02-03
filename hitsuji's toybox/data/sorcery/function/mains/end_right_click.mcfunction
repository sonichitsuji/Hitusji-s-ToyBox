#> 
# 
# 

# タグ消し
tag @s remove H.Click.Right
tag @s remove H.Click.Check

# タグ付け
execute if entity @s[tag=!H.CoolTime] run tag @s add H.Socery.Start

# 魔法発動
execute as @s at @s run function sorcery:mains/detect_sorcery

# スコア0
scoreboard players set @s H.Charge 0 

# タグ消し
tag @s remove H.Socery.Start