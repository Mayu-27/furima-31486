# README

## Users

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | text    | null: false |
| password              | integer | null: false |
| password_confirmation | integer | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| kana_last_name        | string  | null: false |
| kana_fist_name        | string  | null: false |
| birth_date            | date    | null: false |


### Association
- has_many :items
- has_many :likes
- has_one :credit_cards


## Items

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| name                  | string  | null: false |
| image                 | text    | null: false |
| introduction          | text    | null: false |
| genre                 | string  | null: false |
| item_condition        | string  | null: false |
| shipping_fee          | integer | null: false |
| shipping_from         | string  | null: false |
| shipping-period       | string  | null: false |
| price                 | integer | null: false |

### Association
- has_many :likes
- has_one :purchases
- belongs_to :users
- belongs_to :genre
- belongs_to :item_conditions
- belongs_to :shipping_addresses
- belongs_to_active_hash :genre
- belongs_to_active_hash :item_conditions


## Purchases

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| user_id               | integer | null: false |
| purchased_item        | string  | null: false |

### Association
- has_one :items


## Shipping_addresses

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| post_code             | integer | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| street_number         | text    | null: false |
| building_name         | text    | 
| phone_number          | integer | null: false |
| purchase_id           | references | null: false, foreign_key: true | 

### Association
- has_many :items
- belongs_to :prefecture
- belongs_to_active_hash :prefecture




