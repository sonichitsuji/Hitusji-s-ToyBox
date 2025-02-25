#> unique_data:set_id
# 固有IDの設定
# 

# 固有IDを設定
scoreboard players add @s unique_id 1

# タグ付け
tag @s add unique_id_holder

# 被ってたら終了して再帰
execute as @e[scores={unique_id=0..}] if score @s unique_id = @s unique_id run return run function unique_data:set_id

# タグ消し
tag @s remove unique_id_holder