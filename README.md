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
- has_many :purchases


## items テーブル

| Column                     | Type    | Options                        |
| -------------------------- | ------  | ------------------------------ |
| name                       | string  | null: false                    |
| introduction               | text    | null: false                    |
| price                      | integer | null: false                    |
| user_id                    | integer | null: false, foreign_key: true |
| category_id                | string  | null: false                    | #active_hash
| condition_id               | string  | null: false                    | #active_hash
| shipping_cost              | integer | null: false                    |
| prefecture _id             | integer | null: false                    | #active_hash
| estimated_shipping_date_id | string  | null: false                    | #active_hash

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| item_id                 | integer | null: false, foreign_key: true |
| user_id                 | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shipping テーブル

| Column                  | Type    | Options                        |
| ----------------------- | ------  | ------------------------------ |
| purchase_id             | integer | null: false, foreign_key: true |
| postal_code             | string  | null: false                    | #ハイフンをつける可能性があるためStringを使用
| prefecture_id           | integer | null: false                    | #active_hash
| city                    | integer | null: false                    | 
| street_name             | string  | null: false                    |
| building                | string  |                                | 
| phone_number            | string  | null: false                    | 


### Association

- belongs_to :purchase