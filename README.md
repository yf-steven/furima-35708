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
|      birth_year      | integer |       null:false        |
|      birth_month     | integer |       null:false        |
|      birth_day       | integer |       null:false        |

### Association

- has_many :items
- has_many :buy_records

## itemsテーブル

|     column    |     type   |      options     |
| ------------- | ---------- | ---------------- |
|      name     |    string  |    null:false    |
|      text     |    text    |    null:false    |
|    category   |   integer  |    null:false    |
|     status    |   integer  |    null:false    |
|    cost_who   |   integer  |    null:false    |
|   post_from   |   integer  |    null:false    |
|  days_to_post |   integer  |    null:false    |
|     price     |   integer  |    null:false    |
|      user     | references | foreign_key:true |

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
|      city      |  string | null:false |
| address_number |  string | null:false |
|  building_name |  string | null:false |
|  phone_number  |  string | null:false |

### Association

- belongs_to :buy_record