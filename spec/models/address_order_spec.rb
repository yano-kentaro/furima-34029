require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:address_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  describe '商品の購入' do
    context '購入情報が保存される' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名のみ空でも保存出来ること' do
        @order.address_line_2 = nil
        expect(@order).to be_valid
      end
    end
    context '購入情報が保存されない' do
      it 'トークンが生成されていなければ保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order.postcode = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号に全角文字が含まれていると保存できないこと' do
        @order.postcode = '１２３-４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is not correct.')
      end
      it '郵便番号にハイフンが含まれていないと保存できないこと' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is not correct.')
      end
      it '郵便番号のハイフンより前が3桁でないと保存できないこと' do
        @order.postcode = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is not correct.')
      end
      it '郵便番号のハイフンより後ろが4桁でないと保存できないこと' do
        @order.postcode = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is not correct.')
      end
      it '都道府県が空だと保存できないこと' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県がid=1だと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order.address_line_1 = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address line 1 can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に全角文字が含まれていると保存できないこと' do
        @order.phone_number = '０１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not correct.')
      end
      it '電話番号が英数混合だと保存できないこと' do
        @order.phone_number = 'abc1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not correct.')
      end
      it '電話番号が10桁より少ないと保存できないこと' do
        @order.phone_number = '012345678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not correct.')
      end
      it '電話番号が11桁より多いと保存できないこと' do
        @order.phone_number = '012345678910'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not correct.')
      end
      it 'user_idが空だと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
