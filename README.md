## users Table

|Column             |Type    |Options                     |
|-------------------|--------|----------------------------|
|nick_name          |string  |null: false                 |
|email              |string  |null: false, unique: true   |
|encrypted_password |string  |null: false                 |
|last_name          |string  |null: false                 |
|first_name         |string  |null: false                 |
|last_name_kana     |string  |null: false                 |
|first_name_kana    |string  |null: false                 |
|birthday           |date    |null: false                 |

### Association
- has_many :items
- has_many :records


## items Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|name               |string      |null: false                       |
|comment            |text        |null: false                       |
|category_id        |integer     |null: false                       |
|status_id          |integer     |null: false                       |
|fee_id             |integer     |null: false                       |
|area_id            |integer     |null: false                       |
|days_id            |integer     |null: false                       |
|price              |integer     |null: false                       |
|user               |references  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_one :record


## records Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|item               |references  |null: false, foreign_key: true    |
|user               |references  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :item


## addresses Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|add                |string      |null: false                       |
|postal_code        |string      |null: false                       |
|area_id            |string      |null: false                       |
|municipalities     |string      |null: false                       |
|house_number       |string      |null: false                       |
|building           |string      |                                  |
|tel                |string      |null: false                       |
|record             |references  |null: false, foreign_key: true    |

### Association
- belongs_to :record