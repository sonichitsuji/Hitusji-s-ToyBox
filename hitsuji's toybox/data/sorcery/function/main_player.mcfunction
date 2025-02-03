#> sorcery:main_player
# playerのtick実行処理
# @handles
# @within h_core:all_on

    ## クールタイム
execute if entity @s[tag=H.CoolTime] run title @s actionbar [{"text":"Cooldown...","color":"red"}]
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run title @s actionbar [{"text":"It's available!","color":"green"}]
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run playsound block.note_block.bell master @s ~ ~ ~ 0.1 1
execute if entity @s[scores={H.CoolTime=0},tag=H.CoolTime] run tag @s remove H.CoolTime

# チャージ
execute if entity @s[tag=H.Click.Right] unless entity @s[tag=H.Click.Check] run title @s actionbar [{"text":""}]
execute if entity @s[tag=H.Click.Right] if entity @s[tag=H.Click.Check] run title @s actionbar [{"text":"Charging...","color":"green"}]

    ## 右クリック検知
# チャージありなしで分岐
execute if predicate sorcery:charge if entity @s[tag=H.Click.Right,tag=!H.Click.Check] run function sorcery:mains/end_right_click
execute unless predicate sorcery:charge if entity @s[tag=H.Click.Right] run function sorcery:mains/end_right_click
# チャージ終了
execute if entity @s[tag=H.Click.Check] run function sorcery:mains/after_right_click

# シフトした時の処理
execute if entity @s[predicate=sorcery:chase_shot,predicate=h_core:sneak,predicate=sorcery:has_wand] anchored eyes run function sorcery:spells/niente/lock_beam

# スコアリセット
scoreboard players set @s H.Coas.Used 0
scoreboard players set @s H.Bow.Used 0

# もう一回!
advancement revoke @s only sorcery:player_tick