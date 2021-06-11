require 'rails_helper'

RSpec.describe BuyRecordDelivery, type: :model do
  describe '商品購入機能' do
    before do 
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_record_delivery = FactoryBot.build(:buy_record_delivery, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入ができる時' do
      it '全ての項目が正しく入力されていたら購入できる' do
        expect(@buy_record_delivery).to be_valid
      end
      it 'building_nameが空欄でも購入できる' do
        @buy_record_delivery.building_name = ''
        expect(@buy_record_delivery).to be_valid
      end
    end

    context '商品投稿ができない時' do
      it 'post_numberが空欄だと購入できない' do
        @buy_record_delivery.post_number = ''
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが全角数字だと購入できない' do
        @buy_record_delivery.post_number = '０００−００００'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberが半角英字だと購入できない' do
        @buy_record_delivery.post_number = 'abc-defg'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberが半角英数字混合だと購入できない' do
        @buy_record_delivery.post_number = 'abc-1234'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberに - がないと購入できない' do
        @buy_record_delivery.post_number = '1234567'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Post number is invalid')
      end
      it 'cityが空欄だと購入できない' do
        @buy_record_delivery.city = ''
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numberが空欄だと購入できない' do
        @buy_record_delivery.address_number = ''
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空欄だと購入できない' do
        @buy_record_delivery.phone_number = ''
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @buy_record_delivery.phone_number = '００００００００００'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角英字だと購入できない' do
        @buy_record_delivery.phone_number = 'abcdefghijk'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角英数字混合だと購入できない' do
        @buy_record_delivery.phone_number = 'abc1234defg'
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefecture_idが1だと購入できない' do
        @buy_record_delivery.prefecture_id = 1
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'userモデルと紐づいていないと購入できない' do
        @buy_record_delivery.user_id = nil
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemモデルと紐づいていないと購入できない' do
        @buy_record_delivery.item_id = nil
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと登録できない' do
        @buy_record_delivery.token = nil
        @buy_record_delivery.valid?
        expect(@buy_record_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
