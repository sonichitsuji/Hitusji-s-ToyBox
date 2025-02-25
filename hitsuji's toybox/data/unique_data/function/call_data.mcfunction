#> unique_data:call_data
# 固有ストレージを仮ストレージに代入
# @within unique_data:call

# ストレージが存在するなら呼び出し
$execute store success score $succes_counter succes_count run data modify storage unique_data my_data set from storage unique_data data_id:$(id)

# ストレージが存在しないならエラーを表示
execute if score $succes_counter succes_count matches 0 run tellraw @a {"color":"red","text":"[ERROR] 固有ストレージが存在しないよ"}