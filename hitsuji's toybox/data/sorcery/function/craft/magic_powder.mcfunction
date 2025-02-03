#> sorcery:craft/magic_powder
# アイテム作成
# @private

# アイテムどーぞ
loot spawn ~ ~ ~ loot sorcery:item/magic_powder

# すぐ拾えるように
execute as @e[type=item,sort=nearest,limit=1] run data modify entity @s PickupDelay set value 0

# 進捗を消去
advancement revoke @s only sorcery:magic_powder

# クラフトした知恵の本を消す
clear @s knowledge_book 1