# README

## Users

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| kana_last_name        | string  | null: false |
| kana_fist_name        | string  | null: false |
| birth_date            | date    | null: false |


### Association
- has_many :items
- has_many :purchases


## Items

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| name                  | string  | null: false |
| introduction          | text    | null: false |
| genre_id              | integer | null: false |
| item_condition_id     | integer | null: false |  
| shipping_fee_id       | integer | null: false |
| shipping_from_id      | integer | null: false |
| shipping-period_id    | integer | null: false |
| price                 | integer | null: false |
| user                  | integer | null: false, foreign_key: true | 

### Association
- has_one :purchase
- belongs_to :user
- belongs_to :genre
- belongs_to :item_condition
- belongs_to :shipping_address
- belongs_to_active_hash :genre
- belongs_to_active_hash :item_condition


## Purchases

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| user_id               | integer | null: false, foreign_key: true |
| item_id               | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs-to :user
- has_one :shipping_address


## Shipping_addresses

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| post_code             | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| street_number         | string  | null: false |
| building_name         | string  | 
| phone_number          | string  | null: false |
| purchase              | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture




