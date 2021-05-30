# テーブル設計

## usersテーブル

|   column   |  type  |   options  |
| ---------- | ------ | ---------- |
|  nickname  | string | null:false |
|    email   | string | null:false |
|  password  | string | null:false |
| last_name  | string | null:false |
| first_name | string | null:false |

### Association

- has_many :items
- has_many :buy_records

## itemsテーブル

|  column |     type   |      options     |
| ------- | ---------- | ---------------- |
|   name  |    string  |    null:false    |
|   text  |    text    |    null:false    |
|  price  |   integer  |    null:false    |
| user_id | references | foreign_key:true |

### Association

- belongs_to :user
- has_one :buy_record

## buy_recordsテーブル

|  column |    type    |     options      |
| ------- | ---------- | ---------------- |
| user_id | references | foreign_key:true |
| item_id | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :user
- has_one :delivery

## deliveryテーブル

|     column     |   type  |   options  |
| -------------- | ------- | ---------- |
|    post_name   | integer | null:false |
|      city      |  string | null:false |
| address_number | integer | null:false |
|  building_name |  string | null:false |
|  phone_number  | integer | null:false |

### Association

- belongs_to :buy_records