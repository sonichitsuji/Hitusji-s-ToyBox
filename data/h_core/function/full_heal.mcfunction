#> h_core:full_heal
# 全快
# @private

# 音
playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 1.2 1

# 効果
effect give @s regeneration 3 100 true
effect give @s saturation infinite 255 true