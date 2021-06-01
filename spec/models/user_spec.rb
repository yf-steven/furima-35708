require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context "ユーザー登録できる時" do
     it '全ての項目が正しく入力されれば登録できる' do
       expect(@user).to be_valid
     end
    end

    context "ユーザー登録できない時" do
     it 'nicknameが空だと登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空だと登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailに@が含まれないと登録できない' do
       @user.email = 'abcdefg'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it '同一のemailは登録できない' do
       @user2 = FactoryBot.create(:user)
       @user.email = @user2.email
       @user.valid?
       expect(@user.errors.full_messages).to include('Email has already been taken')
     end
     it 'passwordが空だと登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが5文字以下だと登録できない' do
       @user.password = 'a1234'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it 'passwordが半角数字だけの場合は登録できない' do
       @user.password = '111111'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
     end
     it 'ppasswordが半角英字だけの場合は登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
     end
     it 'passwordが全角英数字混合の場合は登録できない' do
      @user.password = 'ｔｓ１２３４'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
     end
     it 'password_confirmationが空だと登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordとpassword_confirmationが一致しないと登録できない' do
       @user.password_confirmation = 'abc123'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'last_nameが半角だと登録できない' do
       @user.last_name = 'ｱｱｱｱ'
       @user.valid?
       expect(@user.errors.full_messages).to include('Last name is invalid')
     end
     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'first_nameが半角だと登録できない' do
       @user.first_name = 'ｱｱｱｱ'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name is invalid')
     end
     it 'last_name_kanaが空だと登録できない' do
       @user.last_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it 'last_name_kanaが全角平仮名だと登録できない' do
       @user.last_name_kana = 'あいうえお'
       @user.valid?
       expect(@user.errors.full_messages).to include('Last name kana is invalid')
     end
     it 'last_name_kanaが半角片仮名だと登録できない' do
       @user.last_name_kana = 'ｱｲｳｴｵ'
       @user.valid?
       expect(@user.errors.full_messages).to include('Last name kana is invalid')
     end
     it 'first_name_kanaが空だと登録できない' do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'first_name_kanaが全角平仮名だと登録できない' do
       @user.first_name_kana = 'あいうえお'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it 'first_name_kanaが半角片仮名だと登録できない' do
       @user.first_name_kana = 'ｱｲｳｴｵ'
       @user.valid?
       expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it 'birthdayが空だと登録できない' do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end
end
