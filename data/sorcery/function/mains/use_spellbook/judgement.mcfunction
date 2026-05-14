#> sorcery:mains/use_spellbook/judgement
# レトリビューションの魔導書を使用した時の処理
# 

# 本をレトリビューションに交換
execute unless predicate sorcery:judgement run item replace entity @s weapon.mainhand with stick[custom_data={HData:{Magic:"judgement",ItemType:"spellbook",Charge:true}}]
execute unless predicate sorcery:judgement run loot replace entity @s weapon.mainhand loot sorcery:item/retribution
execute if predicate sorcery:judgement run item replace entity @s weapon.offhand with stick[custom_data={HData:{Magic:"judgement",ItemType:"spellbook",Charge:true}}]
execute if predicate sorcery:judgement run loot replace entity @s weapon.offhand loot sorcery:item/retribution

# もう一度
advancement revoke @s only sorcery:use_judgement