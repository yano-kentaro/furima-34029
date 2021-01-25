# DataBase design

## Users table  
- ### Columns  
|Column|Type|Options|Remarks|
|------|----|-------|-------|
|first_name|string|null: false|devise|
|first_name_kana|string|null: false|devise|
|last_name|string|null: false|devise|
|last_name_kana|string|null: false|devise|
|nickname|string|null: false|devise|
|birth_date|date|null: false|devise|
|email|string|null: false|devise|
|encrypted_password|string|null: false|devise, Regular expression|  
<br>

- ### Association  
  - has_many :items  
  - has_many :orders  
<br>
<br>

## Items table
- ### Columns
|Column|Type|Options|Remarks|
|------|----|-------|-------|
|name|string|null: false||
|explanation|text|null: false||
|price|integer|null: false||
|`user_id`|references|null: false, foreign_key: true||
|( image )|||active_storage|
<br>

- ### Association  
  - belongs_to :user
  - has_one :order
<br>
<br>

## Orders table  
- ### Columns  
|Column|Type|Options|
|------|----|-------|
|`user_id`|references|null: false, foreign_key: true|
|`item_id`|references|null: false, foreign_key: true|  
<br>

- ### Association  
  - belongs_to :user
  - has_one :item  
  - has_one :address
<br>
<br>

## Addresses table  
- ### Columns  
|Column|Type|Options|Remarks|
|------|------|-------|-------|
|postcode|integer|null: false|Regular expression|
|city|string|null: false||
|address_line_1|string|null: false||
|address_line_2|string|null: false||
|phone_number|integer|null: false|Regular expression|
|`prefecture_id`|references|null: false, foreign_key: true||
<br>

- ### Association  
  - has_one :purchase_contract