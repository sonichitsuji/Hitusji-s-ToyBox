#> unique_data:init
# IDを設定し、ストレージに代入
# 

# 固有IDがあるか確認、無かったら設定
execute unless score @s unique_id = @s unique_id run function unique_data:set_id

# ストレージに代入
execute store result storage unique_data id int 1 run scoreboard players get @s unique_id