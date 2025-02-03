#> sorcery:main_player
# tick実行処理
# @handles
# @within h_core:all_on

# ターゲットにパーティクル
execute as @e[tag=H.Target] at @s anchored eyes run particle electric_spark ~ ~2 ~ 0.0 0.0 0.0 0.05 1

# 魔法
execute as @e[tag=H.Magic] run scoreboard players operation @s H.Return.Count = @s H.Speed

# 魔法の移動
function sorcery:mains/move_ctrl