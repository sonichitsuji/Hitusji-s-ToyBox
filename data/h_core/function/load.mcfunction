# スコアボード追加

## 汎用
scoreboard objectives add H.CoolTime dummy "クールタイム"
scoreboard objectives add H.tick dummy "毎ティック増えるよ"
scoreboard objectives add H.Death.Count dummy "死ぬまでのカウントだよ"
scoreboard objectives add H.Death deathCount "死んだんじゃないのー？^^" 
scoreboard objectives add H.Reload.Time dummy "何秒でリロードできる？"
scoreboard objectives add H.Succes.Count dummy "何回成功した？"
scoreboard objectives add H.Pos.x dummy "位置の処理に使うx座標"
scoreboard objectives add H.Pos.y dummy "位置の処理に使うy座標"
scoreboard objectives add H.Pos.z dummy "位置の処理に使うz座標"
scoreboard objectives add H.Temporaly dummy "計算用の一時的な数値"
scoreboard objectives add H.Angle.Yaw dummy "角度の計算に使うYaw方向"
execute store result score $H.Yaw H.Angle.Yaw run random value 0..359
scoreboard objectives add H.Angle.Pitch dummy "角度の計算に使うPitch方向"
execute store result score $H.Pitch H.Angle.Pitch run random value 0..90
scoreboard objectives add H.Counter dummy "使用回数などをカウント"

## 数値
scoreboard objectives add H.Const dummy "固定の数値だよ"
scoreboard players set $H360 H.Const 360
scoreboard players set $H90 H.Const 90
scoreboard players set $H20 H.Const 20
scoreboard players set $H2 H.Const 2
scoreboard players set $H-1 H.Const -1

## アイテムのなんかいろいろ検知
scoreboard objectives add H.Drop minecraft.custom:drop "物を投げるな!"
scoreboard objectives add H.Crossbow.Used minecraft.used:crossbow "クロスボウ使った？"
scoreboard objectives add H.Bow.Used minecraft.used:bow "弓使った？"
scoreboard objectives add H.Stick.Used minecraft.used:stick "棒使った？"
scoreboard objectives add H.Potion.Used minecraft.used:lingering_potion "瓶を投げるな!"
scoreboard objectives add H.Coas.Used minecraft.used:carrot_on_a_stick "ニンジン付きの棒なんて使ったの？"

## 飛んでる物の速度
scoreboard objectives add H.Speed dummy "弾速/速度"
scoreboard objectives add H.Return.Count dummy "弾速/速度のコピー"

## 銃
scoreboard objectives add H.Ammo dummy "弾丸の残りは?"
scoreboard objectives add H.MaxAmmo dummy "最大何発まで?"

## 魔法
scoreboard objectives add H.Range dummy "魔法の射程"
scoreboard objectives add H.Blast.Range dummy "魔法の範囲"
scoreboard objectives add H.Charge dummy "チャージ"

## 限定的
scoreboard objectives add H.FallendC.Time dummy "重力魔法の経過時間"

# ForwardSpreaderのload処理
function forward_spreader:core/load

# Deltaのload処理
function player_motion:internal/technical/load

# 疑似個別IDを割り当て
scoreboard objectives add H.Entity.ID dummy "個別のUID"
execute as @a unless score @s H.Entity.ID = @s H.Entity.ID store result score @s H.Entity.ID run scoreboard players add $Hitsuji.Random H.Entity.ID 1
execute as @a unless score @s H.Entity.ID = @s H.Entity.ID store result score @s H.Entity.ID run scoreboard players get $Hitsuji.Random H.Entity.ID

# クールダウンをセット
scoreboard players set @a H.CoolTime 0

# レシピ開放
recipe give @a h_core:asc_pistol
recipe give @a h_core:asc_rifle
recipe give @a sorcery:magic_powder