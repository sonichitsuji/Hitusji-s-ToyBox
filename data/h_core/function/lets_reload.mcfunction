#> h_core:lets_reload
#
# リロード
# @within h_core:force_loader

# リロード
reload

# 音消し
stopsound @a neutral minecraft:entity.splash_potion.throw

# リロード完了のお知らせ
tellraw @a [{"text":"[Reload : "},{"text":"Complete","color":"yellow"},{"text":"]"}]

playsound hituji:explode master @a ~ ~ ~ 1 1