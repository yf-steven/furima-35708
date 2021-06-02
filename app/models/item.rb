class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :cost_who_id
    validates :post_from_id
    validates :days_to_post_id
    validates :price, format: { with: /\A[0-9]+\z/ }
  end
  belongs_to :user
  has_one_attached :image
end
