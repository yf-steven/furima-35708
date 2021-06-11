class BuyRecordDelivery

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address_number, :building_name, :phone_number, :buy_record_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address_number
    validates :phone_number, format: {with: /\A[0-9]+\Z/}, length: {maximum: 11}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end