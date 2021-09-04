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
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :fee
- belongs_to_active_hash :area
- belongs_to_active_hash :days


## records Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|item               |references  |null: false, foreign_key: true    |
|user               |references  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses Table

|Column             |Type        |Options                           |
|-------------------|------------|----------------------------------|
|postal_code        |string      |null: false                       |
|area_id            |integer     |null: false                       |
|municipalities     |string      |null: false                       |
|house_number       |string      |null: false                       |
|building           |string      |                                  |
|tel                |string      |null: false                       |
|record             |references  |null: false, foreign_key: true    |

### Association
- belongs_to :record