## users Table

|Column             |Type    |Options                     |
|-------------------|--------|----------------------------|
|nick_name          |string  |null: false                 |
|email              |string  |null: false, unique: true   |
|password           |string  |null: false                 |
|encrypted_password |string  |null: false                 |
|last_name          |string  |null: false                 |
|first_name         |string  |null: false                 |
|last_name_kana     |string  |null: false                 |
|first_name_kana    |string  |null: false                 |
|birthday           |string  |null: false                 |

### Association
- has_many :items
- has_many :records


## items Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|name               |string      |null: false                       |
|comment            |string      |null: false                       |
|category           |string      |null: false                       |
|status             |string      |null: false                       |
|fee                |string      |null: false                       |
|area               |string      |null: false                       |
|days               |string      |null: false                       |
|price              |string      |null: false                       |
|image              |string      |null: false                       |
|user_id            |references  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_one :record


## records Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|item_id            |references  |null: false, foreign_key: true    |
|user_id            |references  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :item


## addresses Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|add                |string      |null: false                       |
|postal_code        |string      |null: false                       |
|pref               |string      |null: false                       |
|municipalities     |string      |null: false                       |
|house_number       |string      |null: false                       |
|building           |string      |                                  |
|tel                |string      |null: false                       |
|record_id          |references  |null: false, foreign_key: true    |

### Association
- belongs_to :record