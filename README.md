# テーブル設計

## user テーブル

| Column            |  Type   | Options
| ------------------------------------------
| nickname          | string  | null: false, unique: true
| email             | string  | null: false, unique: true
| password          | string  | null: false, unique: true
| first_name        | string  | null: false
| last_name         | string  | null: false
| first_name_kana   | string  | null: false
| last_name_kana    | string  | null: false
| birth_day         | integer | null: false
| 

### Association

- has_many : items
- has_many : purchaserecords
- has_many : sending_destinations


## itemsテーブル

| Colum                 |  Type        |  Options    |
|-----------------------|----------------------------|
| name                  | string       | null: false |
| image                 | text         | null: false |
| introduction          | text         | null: false |
| category              | references   | null: false |
| condition             | references   | null: false |
| postage               | references   | null: false |
| shopping_prefecture   | string       | null: false |
| days                  | integer      | null: false |
| price                 | integer      | null: false |
| user_id               | references   | null: false ,foreign_key: true

- belongs_to :user
- has_one :sending_destinations
- has_one :purchase_record


## purchase_recordテーブル

| Colum     |  Type    | Options
|------------------------------------
| buyer     | string   | null: false, 
| user_id   | string   | null: false, foreign_key: true
| item_id   | string   | null: false, foreign_key: true

- belongs_to :user
- belongs_to :item
- has_one :sending_destination



## sending_destinationsテーブル

| Colum         | Type      | Options
|---------------|--------------------------
| postal_code   | integer   | null: false
| prefecture    | string    | null: false
| municipality  | string    | null: false
| address       | string    | null: false
| building name | string    | null: false
| phone_number  | integer   | null: false, unique: true
| item_id       | string    | null: false, foreign_key: true

- belong_to :item 
- belong_to :purchase_record
