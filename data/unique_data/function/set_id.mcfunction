#> unique_data:set_id
# 固有IDの設定
# 

# 固有IDを設定
scoreboard players add @s unique_id 1

# タグ付け
tag @s add unique_id_holder

# 被ってたら終了して再帰
execute as @e[scores={unique_id=0..},tag=!unique_id_holder] if score @s unique_id = @n[tag=unique_id_holder] unique_id run return run function unique_data:set_id

# IDをストレージに代入
execute store result storage unique_data id int 1 run scoreboard players get @s unique_id

# 同じIDを持っていたエンティティのデータがあるため、ストレージの中身を消す
function unique_data:remove with storage unique_data

# タグ消し
tag @s remove unique_id_holder