require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能の実装' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品出来る' do
      it '商品画像が1枚添付されている' do
        expect(@item).to be_valid
      end
      it '商品名が記入されている' do
        @item.name = 'test'
        expect(@item).to be_valid
      end
      it '商品説明が記入されている' do
        @item.explanation = 'test'
        expect(@item).to be_valid
      end
      it 'カテゴリー情報が入力されている' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が記入されている' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担先が記入されている' do
        @item.shipping_charge_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域が記入れている' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数が記入されている' do
        @item.delivery_date_id = 2
        expect(@item).to be_valid
      end
      it '販売価格が記入されている' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格が300~9,999,999円の間である' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格が半角数字で記入されている' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品出来ない' do
      it '商品画像が添付されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が記入されていない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が記入されていない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリー情報が入力されていない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が記入されていない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担先が記入されている' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域が記入されていない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が記入されていない' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '販売価格が記入されていない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円より低い' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が9,999,999円より高い' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格が半角数字で記入されていない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
