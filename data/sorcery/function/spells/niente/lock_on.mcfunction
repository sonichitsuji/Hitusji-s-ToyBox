#> sorcery:spells/niente/lock_on
# ロック！
#

# 全員からタグ消去
$execute as @e[tag=H.Target.ID.$(owner_id)] run tag @s remove H.Target
$execute as @e[tag=H.Target.ID.$(owner_id)] run tag @s remove H.Target.ID.$(owner_id)

# タグ付与
$tag @s add H.Target.ID.$(owner_id)
tag @s add H.Target
