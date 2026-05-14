#> sorcery:spells/niente/retribution/count
# 発動回数のカウント
# @within sorcery:main_player

# 固有IDをストレージにコピー
execute store result storage hitsuji:sorcery owner_id int 1 as @s run scoreboard players get @s H.Entity.ID

# カウント増加
scoreboard players add @s H.Counter 1


# カウントを2で割って余りを出す
scoreboard players operation @s H.Temporaly = @s H.Counter
scoreboard players operation @s H.Temporaly %= $H2 H.Const

# カウントが8以内かつ2の倍数のときに再発動
execute if score @s H.Counter matches ..8 if score @s H.Temporaly matches 0 run function sorcery:spells/niente/retribution/cast with storage hitsuji:sorcery

# カウントが9以上ならリセット
execute if score @s H.Counter matches 9.. run tag @s remove H.Using.Retribution
execute if score @s H.Counter matches 9.. run scoreboard players set @s H.Counter 0

# 計算に使ったスコアをリセット
scoreboard players set @s H.Temporaly 0