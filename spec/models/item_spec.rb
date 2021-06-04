require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品投稿機能' do
   before do
     @item = FactoryBot.build(:item)
   end

   context '商品投稿できる時' do
    it '全ての項目の入力ができていたら投稿できる' do
      expect(@item).to be_valid
    end
   end

   context '商品投稿できない時' do
    it 'nameが空欄だと投稿できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空欄だと投稿できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが空欄だと投稿できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが1だと投稿できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'status_idが空欄だと投稿できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'status_idが1だと投稿できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it 'cost_who_idが空欄だと投稿できない' do
      @item.cost_who_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost who can't be blank")
    end
    it 'cost_who_idが1だと投稿できない' do
      @item.cost_who_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost who must be other than 1')
    end
    it 'post_from_idが空欄だと投稿できない' do
      @item.post_from_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Post from can't be blank")
    end
    it 'post_from_idが1だと投稿できない' do
      @item.post_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Post from must be other than 1')
    end
    it 'days_to_postが空欄だと投稿できない' do
      @item.days_to_post_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to post can't be blank")
    end
    it 'days_to_postが1だと投稿できない' do
      @item.days_to_post_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to post must be other than 1')
    end
    it 'priceが空欄だと投稿できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと投稿できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが299以下だと投稿できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが10000000以上だと投稿できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceが半角英数字混合していると投稿できない' do
      @item.price = 'abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが半角英字のみでは投稿できない' do
      @item.price = 'abcdef'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '画像が添付されていないと投稿できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'userモデルと紐づいていないと投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
   end
  end
end
