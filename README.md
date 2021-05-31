# テーブル設計

## usersテーブル

|        column        |   type  |         options         |
| -------------------- | ------- | ----------------------- |
|       nickname       |  string |       null:false        |
|         email        |  string | null:false, unique:true |
|  encrypted_password  |  string |       null:false        |
|      last_name       |  string |       null:false        |
|      first_name      |  string |       null:false        |
|    last_name_kana    |  string |       null:false        |
|   first_name_kana    |  string |       null:false        |
|        birthday      |   date  |       null:false        |


### Association

- has_many :items
- has_many :buy_records

## itemsテーブル

|      column      |     type   |      options     |
| ---------------- | ---------- | ---------------- |
|       name       |    string  |    null:false    |
|       text       |    text    |    null:false    |
|    category_id   |   integer  |    null:false    |
|     status_id    |   integer  |    null:false    |
|    cost_who_id   |   integer  |    null:false    |
|   post_from_id   |   integer  |    null:false    |
|  days_to_post_id |   integer  |    null:false    |
|       price      |   integer  |    null:false    |
|        user      | references | foreign_key:true |

### Association

- belongs_to :user
- has_one :buy_record

## buy_recordsテーブル

|  column |    type    |     options      |
| ------- | ---------- | ---------------- |
|   user  | references | foreign_key:true |
|   item  | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveriesテーブル

|     column     |   type  |   options  |
| -------------- | ------- | ---------- |
|   post_number  |  string | null:false |
|  prefecture_id | integer | null:false |
|      city      |  string | null:false |
| address_number |  string | null:false |
|  building_name |  string | null:false |
|  phone_number  |  string | null:false |

### Association

- belongs_to :buy_record