# DataBase design

## Users table  
- ### Columns  
|Column|Type|Options|Remarks|
|------|----|-------|-------|
|first_name|string|null: false|devise|
|first_name_kana|string|null: false|devise|
|last_name|string|null: false|devise|
|last_name_kana|string|null: false|devise|
|nickname|string|null: false, unique: true|devise|
|birth_date|date|null: false|devise|
|email|string|null: false, unique: true|devise|
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
|price|integer|integer||
|category|integer|null: false|active_hash|
|condition|integer|null: false|active_hash|
|shpping_charge|integer|null: false|active_hash|
|delivery_date|integer|null: false|active_hash|
|prefecture|integer|null: false|active_hash|
|`user`|references|null: false, foreign_key: true||
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
|`user`|references|null: false, foreign_key: true|
|`item`|references|null: false, foreign_key: true|  
<br>

- ### Association  
  - belongs_to :user
  - belongs_to :item  
  - has_one :address
<br>
<br>

## Addresses table  
- ### Columns  
|Column|Type|Options|Remarks|
|------|------|-------|-------|
|postcode|string|null: false|Regular expression|
|city|string|null: false||
|address_line_1|string|null: false||
|address_line_2|string|||
|phone_number|string|null: false|Regular expression|
|prefecture|integer|null: false|active_hash|
<br>

- ### Association  
  - belongs_to :purchase_contract