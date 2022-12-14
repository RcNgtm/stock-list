# アプリケーション名
在庫リスト

# アプリケーション概要
使用数を入力することで、現在の在庫数を把握することができるアプリケーション

# URL
https://stocklist-2022.herokuapp.com/

# Basic認証
ユーザー：
admin

pw：
app

# テスト用アカウント　①通常ユーザー
Email：
test_1@test.ad

Password：
test1test1

# テスト用アカウント　②管理者
Email：
admin_test1@test.ad

Password：
test1test1

# 利用方法
① ログイン（ログイン必須の仕様となっています。）

② 入力する在庫の「入力する」ボタンを押下してください。

③ 変動のあった日、変動数を入力し、「保存する」を押下してください。

④ Topページに戻ります。

## 管理者のみが利用可能な機能
・新規ユーザー登録

・新規帳票情報登録

# アプリケーションを作成した背景
現複数の拠点の使用数に応じて、倉庫から発送しているというフローがあります。

帳票が少なくなった際には本社から増刷の手配をしていますが、各拠点の使用数はエクセルで管理しているため、
在庫を確認するには、エクセルの授受を行い、計算をするという工程が必要となります。

アプリケーションを通し、在庫の増減を入力をするだけで状況の確認ができるようにする目的で作成しました。

また、各拠点にはエクセルに弱い人も多いため

・入力欄を間違える

・数式や書式を壊してしまう

・エクセルに対する苦手意識がある 等のことから、

エクセル作業のできる人のみにが作業者となっている状況も改善できると考えました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/12HZikHPaOe1PTmnx8pEd-tpG2kAiMrl2KpEyROhfkZw/edit?usp=sharing)

[洗い出した要件②](https://docs.google.com/presentation/d/1YsgQMyQqlUw5o7HtIiUWMPlc3ExAU4r7tj6sSn7eVWM/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

一覧画面で変更したい在庫数の入力するを押下し、日付と変動数を入力すると一覧画面に戻り、現在の在庫数に反映される。

[![Image from Gyazo](https://i.gyazo.com/0c92951471c091d6143309591231c8e9.gif)](https://gyazo.com/0c92951471c091d6143309591231c8e9)


# 実装希望の機能
・一覧表示画面で、在庫数が基準以下になるとアラートを表示

・一覧表示画面で、商品名か帳票の種類でソート

・使用履歴の一覧をCSVで出力できる機能

・現在の状態だと重複しての登録が可能になっている帳票情報登録の仕様を変更

・1種類づつ数値の登録を行っている仕様を、一括登録できる機能へ変更

・カレンダー形式で、在庫変動を一覧化

# 現在取り組んでいる問題
・在庫変動のカレンダー形式にて一覧化する際に、：Stocksから:movedateと:report_idでsumした結果の表示を想定していました。Rubyでは複合主キーが推奨されていないようなので、別の方法での実装を模索中です。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/38df394e8d033f20322317a77fe84a39.png)](https://gyazo.com/38df394e8d033f20322317a77fe84a39)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/4374c898ab577a9ca6a307d24eaf6f3f.png)](https://gyazo.com/4374c898ab577a9ca6a307d24eaf6f3f)


# 開発環境
Ruby on Rails

# ローカルでの動作方法


# 工夫したポイント
現在の在庫数の確認がしやすく、入力画面も分かりやすくなっています。
商品名ごとに背景色を商品カラーに変え、タグのように見える仕様に設定しました。
→renderに対応できない状態のため、在庫入力画面では入力欄にrequiredを持たせることで空欄での保存を回避しています。


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
