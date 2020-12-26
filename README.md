# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nursing_history    | integer | null: false               |
| ward_id            | integer | null: false               |

### Association

- has_many :techniques
- has_many :manuals

## techniques テーブル

| Column        | Type       | Options                          |
| ------------- | ---------- |--------------------------------- |
| title         | string     | null: false                      |
| priority_id   | integer    | null: false                      |
| description   | text       | null: false                      |
| target_at     | datetime   | null: false                      |
| completed_at  | datetime   | null: false                      |
| completed     | boolean    | null: false                      |
| user          | references | null: false, foreign_key: true   |

### Association

- belongs_to  :user
- has_one     :manual
- has_many    :plans

## manual テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| priority_id         | integer    | null: false                    |
| description         | text       | null: false                    |
| technique           | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :technique
- has_one_attached :movies

## plan テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| care_time        | time       |                                |
| technique        | references | null: false, foreign_key: true |

### Association

- belongs_to :technique
