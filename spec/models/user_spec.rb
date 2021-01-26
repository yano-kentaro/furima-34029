require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録出来るとき' do
      it 'ニックネームが記入されている' do
        @user.nickname = 'ken'
        expect(@user).to be_valid
      end
      it 'メールアドレスが記入されている' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it '重複しているメールアドレスではない' do
        @user.email = 'test1@test1'
        @another_user = FactoryBot.build(:user)
        @another_user.email = 'test2@test2'
        expect(@another_user).to be_valid
      end
      it 'メールアドレスに@が含まれている' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'パスワードが記入されている' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードは6文字以上である' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードは半角英数文字混合である' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードは確認用も含めて２回記入されている' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードと確認用パスワードが一致する' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は姓名ともに記入されている' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は全角(漢字・ひらがな・カタカナ)で記載されている' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは姓名どちらもカタカナで記入されている' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
      it '生年月日が記入されている' do
        @user.birth_date = 'Mar, 28 Mar 1986'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できないとき' do
      it 'ニックネームが記入されていない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが記入されていない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複しているメールアドレスではない' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@が含まれていない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが記入されていない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは6文字以上でない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは確認用も含めて２回記入されていない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードと確認用パスワードが一致しない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名は姓が記入されていない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it 'ユーザー本名は名が記入されていない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'ユーザー本名の姓が全角(漢字・ひらがな・カタカナ)で記載されていない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名の名が全角(漢字・ひらがな・カタカナ)で記載されていない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名のフリガナは姓がカタカナで記入されていない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'ユーザー本名のフリガナは名がカタカナで記入されていない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が記入されていない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
