# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nicknam            | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encryped_password  | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday_year      | day    | null: false |
| birthday_manth     | day    | null: false |
| birthday_day       | day    | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------  | ------------------------------ |
| item-name          | text        | null: false                    |
| picture            | string      | null: false                    |
| price              | integer     | null: false                    |
| explanation        | text        | null: false                    |
| category           | string      | null: false                    |
| condition          | string      | null: false                    |
| postage            | string      | null: false                    |
| last_name_kana     | string      | null: false                    |
| delivery_day       | day         | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## Orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## Addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------  | ------------------------------ |
| postal_code        | string      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | string      | null: false                    |
| street             | string      | null: false                    |
| building            | string      |                                |
| phone              | string      | null: false                    |


### Association

- belongs_to :order