# テーブル設計

## user テーブル

| Column             |  Type   | Options                    |
|--------------------|---------|----------------------------|
| nickname           | string  | null: false, unique: true  | 
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false, unique: true  |
| first_name         | string  | null: false                |
| last_name          | string  | null: false                |
| first_name_kana    | string  | null: false                |
| last_name_kana     | string  | null: false                |
| birth_day          | date    | null: false                |


### Association

- has_many : items
- has_many : purchases


## itemsテーブル

| Colum          |  Type        |  Options                          |
|----------------|--------------|-----------------------------------|
| name           | string       | null: false                       |
| introduction   | text         | null: false                       |
| category_id    | integer      | null: false                       |
| condition_id   | integer      | null: false                       |
| postage_id     | integer      | null: false                       |
| prefecture_id  | integer      | null: false                       |
| days_id        | integer      | null: false                       |
| price          | integer      | null: false                       |
| user           | references   | null: false ,foreign_key: true    |

### Association

- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Colum        |  Type       | Options                        |
|--------------|-------------|--------------------------------|
| user         | references  | null: false, foreign_key: true |
| item         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping



## shippingテーブル

| Colum                  | Type        | Options                         |
|------------------------|-------------|---------------------------------|
| postal_code            | string      | null: false                     |
| prefecture_id          | integer     | null: false                     |
| city                   | string      | null: false                     |
| address                | string      | null: false                     |
| building_name          | string      |                                 |
| phone_number           | string      | null: false                     |
| purchase               | references  | null: false, foreign_key: true  |

### Association

- belongs_to :purchase
