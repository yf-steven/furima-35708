class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :cost_who_id
    validates :post_from_id
    validates :days_to_post_id
  end
  validates :price, numericarity: {only_integer: true}
  belongs_to :user
end
