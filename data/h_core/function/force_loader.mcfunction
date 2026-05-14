#> h_core:force_loader
#
# Reloaderの処理(雑)
# @within h_core:basic_control

# ポーションをキル
kill @e[type=lingering_potion,sort=nearest,limit=1]

# 音
playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2 1
stopsound @a neutral minecraft:entity.splash_potion.throw

# 再びアイテムゲット
loot replace entity @s weapon.mainhand loot h_core:reloader

# 2tick後にリロード
schedule function h_core:lets_reload 2t