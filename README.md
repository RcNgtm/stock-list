# アプリケーション名
在庫リスト

# アプリケーション概要
使用数を入力することで、現在の在庫数を把握することができるアプリケーション

# URL
https://stocklist-2022.herokuapp.com/

# テスト用アカウント
email:
test_1@test.ad

pw:
test1test1

# 利用方法
① ログイン（ログイン必須の仕様となっています。）

② 入力する在庫の「入力する」ボタンを押下してください。

③ 変動のあった日、変動数を入力し、「保存する」を押下してください。

④ Topページに戻ります。

# アプリケーションを作成した背景
現複数の拠点の使用数に応じて、倉庫から発送しているというフローがあります。

帳票が少なくなった際には本社から増刷の手配をしていますが、各拠点の使用数はエクセルで管理しているため、
在庫を確認するには、エクセルの授受を行い、計算をするという工程が必要となります。

アプリケーションを通し、在庫の増減を入力をするだけで状況の確認ができるようにする目的で作成しました。

また、各拠点にはエクセルに弱い人も多いため

・入力欄を間違える

・数式や書式を壊してしまう

・エクセルに対する苦手意識がある　等のことから、

エクセル作業のできる人のみにが作業者となっている状況も改善できると考えました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/12HZikHPaOe1PTmnx8pEd-tpG2kAiMrl2KpEyROhfkZw/edit?usp=sharing)

[洗い出した要件②](https://docs.google.com/presentation/d/1YsgQMyQqlUw5o7HtIiUWMPlc3ExAU4r7tj6sSn7eVWM/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

一覧画面で変更したい在庫数の入力するを押下し、日付と変動数を入力すると一覧画面に戻り、現在の在庫数に反映される。

[![Image from Gyazo](https://i.gyazo.com/54c986bbabeb89c0883aeed2de82adde.gif)](https://gyazo.com/54c986bbabeb89c0883aeed2de82adde)


# 実装希望の機能
・管理者のみがアクセスできるページ（帳票の種類、帳票の情報、ユーザー登録画面）の作成と遷移の設定

・1種類づつ数値の登録を行っている仕様を、一括登録できる機能

・カレンダー形式で、在庫変動を一覧化

・一覧をCSVで出力できる機能

・在庫数が基準以下になるとアラートを出す

# 現在取り組んでいる問題
・在庫変動一覧の実装：Stocksからを:movedateと:report_idでsumした結果の表示について。Rubyでは複合主キーが推奨されていないようで、方法を模索中。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/38df394e8d033f20322317a77fe84a39.png)](https://gyazo.com/38df394e8d033f20322317a77fe84a39)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/4374c898ab577a9ca6a307d24eaf6f3f.png)](https://gyazo.com/4374c898ab577a9ca6a307d24eaf6f3f)


# 開発環境
Ruby on Rails

# ローカルでの動作方法


# 工夫したポイント
現在の在庫数の確認がしやすく、入力画面も分かりやすくなっています。


# テーブル設計
## users テーブル
| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| name                | string  | null: false                |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |

### Association
- has_many :stocks

## stocks テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| movedate            | date       | null: false                    |
| num                 | integer    | null: false                    |
| report_id           | references | null: false, foreign_key: true |
| user_id             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :report

## reports テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | string     | null: false                    |
| detail_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :detail
- has_many :stocks

## details テーブル
| Column              | Type    | Options          |
| ------------------- | ------- | ---------------- |
| reportname          | string  | null: false      |
| deadline            | integer | null: false      |
- has_many :reports
