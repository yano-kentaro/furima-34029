class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :nickname
    validates :birth_date
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  has_many :items
  has_one  :order
end
