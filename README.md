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
- has_many :completes
- has_many :meetings

## techniques テーブル

| Column        | Type       | Options                          |
| ------------- | ---------- |--------------------------------- |
| title         | string     | null: false                      |
| priority_id   | integer    | null: false                      |
| description   | text       | null: false                      |
| target_on     | date       | null: false                      |
| completed_on  | date       | null: false                      |
| video         |            | null: false                      |
| user          | references | null: false, foreign_key: true   |
### Association

- belongs_to  :user
- has_many    :completes

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
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## complete テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| completed           | boolean    | null: false, default: false    |
| user                | references | null: false, foreign_key: true |
| technique           | references | null: false, foreign_key: true |

### Association

- belongs_to :user, optional: true
- belongs_to :technique, optional: true