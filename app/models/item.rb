class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :cost_who_id, numericality: { other_than: 1 }
    validates :post_from_id, numericality: { other_than: 1 }
    validates :days_to_post_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cost_who
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :post_from
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_post

end
