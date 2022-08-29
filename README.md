##  usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |

### Association

- has_many: training_menus

##  training_menusテーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| name                          | string     | null: false                    |
| muscle_category_id            | integer    | null: false                    |
| explanation                   | text       | null: false                    |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_many: menu_records 

##  menu_recordsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| date               | date       | null: false                   |
| form_level_id      | integer    | null: false                   |
| weight             | integer    |                               |
| reps               | integer    |                               |
| circuit_menus      | text       |                               |
| memo               | text       |                               |
| training_menu      | references | null:false, foreign_key: true |

### Association
- belongs_to: training_menu
