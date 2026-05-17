#> sorcery:mains/detect_sorcery
# アイテムを発動
# @within sorcery:main_player

# 音停止
stopsound @s voice block.note_block.bell

# 一応固有IDをストレージにコピー
execute store result storage hitsuji:sorcery owner_id int 1 as @s run scoreboard players get @s H.Entity.ID

# アイテムの使用を検知、発動
execute as @s[predicate=sorcery:flamme,tag=H.Socery.Start] run function sorcery:spells/flamme/flamme/cast
execute as @s[predicate=sorcery:nucleus,tag=H.Socery.Start] run function sorcery:spells/flamme/nucleus/cast
execute as @s[predicate=sorcery:explosin,tag=H.Socery.Start] run function sorcery:spells/flamme/explosion/cast
execute as @s[predicate=sorcery:bolt,tag=H.Socery.Start] run function sorcery:spells/bolt/bolt/cast
execute as @s[predicate=sorcery:chain_bolt,tag=H.Socery.Start] run function sorcery:spells/bolt/chain_bolt/cast
execute as @s[predicate=sorcery:raum,tag=H.Socery.Start] run function sorcery:spells/raum/raum/cast
execute as @s[predicate=sorcery:weltraum,tag=H.Socery.Start] run function sorcery:spells/raum/weltraum/cast
execute as @s[predicate=sorcery:rail_cannon,tag=H.Socery.Start,nbt={Inventory:[{id:"minecraft:iron_nugget"}]}] run function sorcery:spells/bolt/rail_cannon/cast
execute as @s[predicate=sorcery:heal,tag=H.Socery.Start] run function sorcery:spells/heal/heal
execute as @s[predicate=sorcery:ricochet_orb,tag=H.Socery.Start] run function sorcery:spells/niente/ricochet_orb/cast
execute as @s[predicate=sorcery:chase_shot,tag=H.Socery.Start] run function sorcery:spells/niente/chase_shot/cast
execute as @s[predicate=sorcery:chase_barrage,tag=H.Socery.Start] run function sorcery:spells/niente/chase_barrage/cast
execute as @s[predicate=sorcery:judgement,tag=H.Socery.Start] run function sorcery:spells/niente/judgement/cast
execute as @s[predicate=sorcery:retribution,tag=H.Socery.Start] run function sorcery:spells/niente/retribution/cast with storage hitsuji:sorcery
execute as @s[predicate=sorcery:wind_cutter,tag=H.Socery.Start] run function sorcery:spells/wind/wind_cutter/cast
execute as @s[predicate=sorcery:wind_step,tag=H.Socery.Start] run function sorcery:spells/wind/wind_step/cast