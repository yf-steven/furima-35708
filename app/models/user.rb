class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password,
             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  with_options presence: true do
   validates :nickname   
   validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
   validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   validates :birthday
  end
  has_many :items  
end
