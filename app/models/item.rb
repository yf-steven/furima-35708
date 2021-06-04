class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_who_id
    validates :post_from_id
    validates :days_to_post_id
  end
  
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost_who
  belongs_to :post_from  
  belongs_to :days_to_post
end
