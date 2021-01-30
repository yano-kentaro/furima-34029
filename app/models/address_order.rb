class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :city, :address_line_1, :address_line_2, :phone_number, :prefecture_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'is not correct.' }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A\d{10,11}+\z/, message: 'is not correct.' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, city: city, address_line_1: address_line_1, address_line_2: address_line_2,
                   phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end
