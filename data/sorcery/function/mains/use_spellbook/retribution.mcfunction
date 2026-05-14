#> sorcery:mains/use_spellbook/retribution
# レトリビューションの魔導書を使用した時の処理
# 

# 本をジャッジメントに交換
execute unless predicate sorcery:retribution run item replace entity @s weapon.mainhand with stick[custom_data={HData:{Magic:"retribution",ItemType:"spellbook",Charge:false}}]
execute unless predicate sorcery:retribution run loot replace entity @s weapon.mainhand loot sorcery:item/judgement
execute if predicate sorcery:retribution run item replace entity @s weapon.offhand with stick[custom_data={HData:{Magic:"retribution",ItemType:"spellbook",Charge:false}}]
execute if predicate sorcery:retribution run loot replace entity @s weapon.offhand loot sorcery:item/judgement

# もう一度
advancement revoke @s only sorcery:use_retribution