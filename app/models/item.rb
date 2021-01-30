class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :delivery_date_id
      validates :prefecture_id
    end
  end
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :user
  has_one    :order
end
