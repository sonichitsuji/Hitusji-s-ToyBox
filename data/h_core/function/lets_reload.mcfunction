#> h_core:lets_reload
#
# リロード
# @within h_core:force_loader

# リロード
reload

# リロード完了のお知らせ
tellraw @a [{"text":"[Reload : "},{"text":"Compleat","color":"yellow"},{"text":"]"}]

playsound hituji:explode master @a ~ ~ ~ 1 1