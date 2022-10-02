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

### Association
- belongs_to :detail
