#> unique_data:init
# IDを設定し、ストレージに代入
# 

# 固有IDがあるか確認、無かったら設定
execute unless score @s unique_id = @s unique_id run function unique_data:set_id