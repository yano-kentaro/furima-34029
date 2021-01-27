class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :delivery_date_id
      validates :prefecture_id
    end
  end
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
end
