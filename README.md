# テーブル設計

## users テーブル

| Column                  | Type   | Options                 |
| ----------------------- | ------ | ----------------------- |
| nickname                | string | null: false             |
| email                   | string | null: false             |
| first_name              | string | null: false             |
| last_name               | string | null: false             |
| first_name_kana         | string | null: false             |
| last_name_kana          | string | null: false             |
| birthday                | date   | null: false             | 

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| item_name               | string  | null: false                    |
| introduction            | string  | null: false                    |
| price                   | integer | null: false                    |
| user_id                 | integer | null: false, foreign_key: true |
| category                | string  | null: false                    | #active_hash
| Items_condition         | string  | null: false                    | #active_hash
| prefecture              | string  | null: false                    |
| estimated_shipping_date | string  | null: false                    | #active_hash

### Association

- belongs_to :users
- has_one :purchase


## images テーブル
| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| item_name               | string  | null: false                    |
| user_id                 | integer | null: false, foreign_key: true |

### Association

- belongs_to :items


## purchase テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| item_name               | string  | null: false                    |
| user_id                 | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping


## shipping テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| postal_code             | integer | null: false                    |
| prefecture              | string  | null: false                    | #active_hash
| city                    | integer | null: false                    |
| street_name             | string  | null: false                    |
| building                | string  | null: false                    | 
| phone_number            | string  | null: false                    | 


### Association

- belongs_to :purchase