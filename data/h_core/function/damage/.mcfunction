#> h_core:damage/
# ダメージの処理
# @input (Damage,Damage_type,DeathMsg)

# ダメージあたえないとだよね
$damage @s $(Damage) $(Damage_type) by @n[tag=H.That,type=player]

# 死んでたら死亡ログ
$execute as @a if entity @s[scores={H.Death=1..}] as @s run function h_core:death_msg {DeathMsg:"$(DeathMsg)"}