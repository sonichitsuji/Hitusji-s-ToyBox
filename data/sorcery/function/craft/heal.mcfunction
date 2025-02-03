#> sorcery:craft/heal
# アイテム作成
# @within sorcery:magic_craft/main

# アイテムどーぞ
loot spawn ~ ~ ~ loot sorcery:item/heal

# 効果音
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.8

# 演出
particle witch ~ ~ ~ 0 0 0 1 30 force

# アイテムを消す
execute align xyz as @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:glowstone_dust",count:1,components:{"minecraft:custom_data":{HData:{ItemName:"magic_powder"}}}}}] run kill @s
execute align xyz as @e[type=item,nbt={Item:{id:"minecraft:book"}},sort=nearest,limit=1] run kill @s
kill @s