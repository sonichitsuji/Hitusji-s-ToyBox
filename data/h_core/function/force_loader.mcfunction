#> h_core:force_loader
#
# Reloaderの処理(雑)
# @within h_core:basic_control

# ポーションをキル
kill @e[type=potion,sort=nearest,limit=1]

# 音
playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2 1

# 再びアイテムゲット
loot replace entity @s weapon.mainhand loot h_core:reloader

# 2tick後にリロード
schedule function h_core:lets_reload 2t