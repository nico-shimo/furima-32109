# テーブル設計

## user テーブル

| Column             |  Type   | Options                    |
| ----------------------------------------------------------|
| nickname           | string  | null: false, unique: true  | 
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false, unique: true  |
| first_name         | string  | null: false                |
| last_name          | string  | null: false                |
| first_name_kana    | string  | null: false                |
| last_name_kana     | string  | null: false                |
| birth_day          | integer | null: false                |
| 

### Association

- has_many : items
- has_many : purchase_records


## itemsテーブル

| Colum                    |  Type        |  Options                          |
|--------------------------|--------------------------------------------------|
| name                     | string       | null: false                       |
| introduction             | text         | null: false                       |
| category_id              | integer      | null: false                       |
| condition_id             | integer      | null: false                       |
| postage_id               | integer      | null: false                       |
| shopping_prefecture_id   | integer      | null: false                       |
| days_id                  | integer      | null: false                       |
| price                    | integer      | null: false                       |
| user                     | references   | null: false ,foreign_key: true    |

### Association

- belongs_to :user
- has_one :purchase_record


## purchase_recordテーブル

| Colum        |  Type       | Options                        |
|--------------|-------------|--------------------------------|
| user         | references  | null: false, foreign_key: true |
| item         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sending_destination



## sending_destinationsテーブル

| Colum                  | Type        | Options                         |
|------------------------|-------------|---------------------------------|
| postal_code            | string      | null: false                     |
| shopping_prefecture_id | integer     | null: false                     |
| municipality           | string      | null: false                     |
| address                | string      | null: false                     |
| building_name          | string      |                                 |
| phone_number           | string      | null: false, unique: true       |
| purchase_record        | references  | null: false, foreign_key: true  |

### Association

- belong_to :purchase_record
