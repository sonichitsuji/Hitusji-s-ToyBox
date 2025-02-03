#> h_core:death_msg
# 死亡ログ
# @input $(DeathMsg)
# @context 〇〇は〇〇に〇〇された

# バニラの死亡ログを消す
gamerule showDeathMessages false

# メッセージ
$tellraw @a [{"selector":"@s"},{"text":"は"},{"selector":"@n[tag=H.That,type=player]"},{"text":"に"},{"text":"$(DeathMsg)"}]

# 死亡ログをの設定をリセット
gamerule showDeathMessages true