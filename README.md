# テーブル設計
  
## users テーブル

| Colum         | Type  | Options  |
|:--------------|-------|----------|
| email         | string| NOT NULL |
| password      | string| NOT NULL |
| name          | string| NOT NULL |
| profile       | text  | NOT NULL |
| occupation    | text  | NOT NULL |
| position      | text  | NOT NULL |

### Association

- has_many :comments_users
- has_many :comments, through: :room_users
- has_many :messages

## comments テーブル


| comments       | Type       | Options  |
|:---------------|------------|----------|
| text           | text       | NOT NULL |
| user           | references |          |
| prototype      | references |          |

### Association

- has_many :comments_users
- has_many :users, through: :comments_users
- has_many :prototypes

## prototypesテーブル


| prototypes       | Type        | Options           |
|:---------------------------------------------------|
| title            | string     |                    |
| catch_copy       | text       |                    |
| concept          | text       |                    |
| image            |            | ActiveStorageで実装 |
| user             | references |                    |