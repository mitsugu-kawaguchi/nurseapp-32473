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
- has_many :posts
- has_many :comments

## techniques テーブル

| Column        | Type       | Options                          |
| ------------- | ---------- |--------------------------------- |
| title         | string     | null: false                      |
| priority_id   | integer    | null: false                      |
| description   | text       | null: false                      |
| target_at     | datetime   | null: false                      |
| completed_at  | datetime   | null: false                      |
| completed     | boolean    |                                  |
| video         |            | null: false                      |
| user          | references | null: false, foreign_key: true   |
### Association

- belongs_to  :user

## post テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## comment テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| post             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## meeting テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| start_time       | datetime   | null: false                    |

