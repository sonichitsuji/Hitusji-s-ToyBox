#> sorcery:mains/detect_sorcery
# アイテムを発動
# @within sorcery:main_player

# 音停止
stopsound @s master block.note_block.bell

# アイテムの使用を検知、発動
execute as @s[predicate=sorcery:flamme,tag=H.Socery.Start] run function sorcery:spells/flamme/flamme
execute as @s[predicate=sorcery:nucleus,tag=H.Socery.Start] run function sorcery:spells/flamme/nucleus
execute as @s[predicate=sorcery:bolt,tag=H.Socery.Start] run function sorcery:spells/bolt/bolt
execute as @s[predicate=sorcery:raum,tag=H.Socery.Start] run function sorcery:spells/raum/raum
execute as @s[predicate=sorcery:weltraum,tag=H.Socery.Start] run function sorcery:spells/raum/weltraum
execute as @s[predicate=sorcery:rail_cannon,tag=H.Socery.Start,nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run function sorcery:spells/bolt/rail_cannon
execute as @s[predicate=sorcery:heal,tag=H.Socery.Start] run function sorcery:spells/heal/heal
execute as @s[predicate=sorcery:zoltraak,tag=H.Socery.Start] run function sorcery:spells/niente/zoltraak
execute as @s[predicate=sorcery:chase_shot,tag=H.Socery.Start] run function sorcery:spells/niente/chase_shot
execute as @s[predicate=sorcery:wind_cutter,tag=H.Socery.Start] run function sorcery:spells/wind/wind_cutter
execute as @s[predicate=sorcery:wind_step,tag=H.Socery.Start] run function sorcery:spells/wind/wind_step