#> sorcery:main_player
# playerのtick実行処理
# @handles
# @within h_core:all_on

    ## クールタイム
execute if entity @s[tag=H.CoolTime] run title @s actionbar [{"text":"Cooldown...","color":"red"}]
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run title @s actionbar [{"text":"It's available!","color":"green"}]
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run playsound block.note_block.bell voice @s ~ ~ ~ 0.5 1
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run tag @s remove H.CoolTime

# チャージ
execute if entity @s[tag=H.Click.Right] unless entity @s[tag=H.Click.Check] run title @s actionbar [{"text":""}]
execute if entity @s[tag=H.Click.Right] if entity @s[tag=H.Click.Check] run title @s actionbar [{"text":"Charging...","color":"green"}]
execute if entity @s[tag=H.Click.Right] if entity @s[tag=H.Click.Check] if score @s H.Charge matches 39.. run title @s actionbar [{"text":"Full charge!","color":"green"}]

    ## 右クリック検知
# チャージありなしで分岐
execute if predicate sorcery:charge if entity @s[tag=H.Click.Right,tag=!H.Click.Check] run function sorcery:mains/end_right_click
execute unless predicate sorcery:charge if entity @s[tag=H.Click.Right] run function sorcery:mains/end_right_click
# チャージ処理
execute if entity @s[tag=H.Click.Check] run function sorcery:mains/after_right_click

# シフトした時の処理
execute if entity @s[predicate=sorcery:chase_shot,predicate=h_core:sneak,predicate=sorcery:has_wand] anchored eyes run function sorcery:spells/lock/beam
execute if entity @s[predicate=sorcery:chase_barrage,predicate=h_core:sneak,predicate=sorcery:has_wand] anchored eyes run function sorcery:spells/lock/beam
execute if entity @s[predicate=sorcery:retribution,predicate=h_core:sneak,predicate=sorcery:has_wand] anchored eyes run function sorcery:spells/lock/beam

# 特殊処理
execute if entity @s[tag=H.Using.Retribution] run function sorcery:spells/niente/retribution/count

# スコアリセット
scoreboard players set @s H.Coas.Used 0
scoreboard players set @s H.Bow.Used 0

# もう一回!
advancement revoke @s only sorcery:player_tick