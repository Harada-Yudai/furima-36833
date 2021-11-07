# テーブル設計

## users テーブル

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| nickname                   | string | null: false               |
| last_name                  | text   | null: false               |
| first_name                 | text   | null: false               |
| last_kana                  | text   | null: false               |
| first_kana                 | text   | null: false               |
| birth_year                 | string | null: false               |
| birth_month                | string | null: false               |
| birth_day                  | string | null: false               |

### Association

- has_many :items
- has_many :buylogs

## items テーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | ------------------------------- |
| name          | string      | null: false                     |
| info          | text        | null: false                     |
| category      | string      | null: false                     |
| status        | string      | null: false                     |
| ship_pay      | string      | null: false                     |
| ship_from     | string      | null: false                     |
| ship_day      | string      | null: false                     |
| price         | string      | null: false                     |
| user          | references  | null: false, foreign_key: true  |

### Association

- has_one :buylog
- belongs_to :user

## buylogs テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :sendinfo

## sendinfos テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postcode    | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     | null: false                    |
| phone_num   | string     | null: false                    |
| buylog      | references | null: false, foreign_key: true |

### Association

- belongs_to :buylog