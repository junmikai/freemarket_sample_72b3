class Product < ApplicationRecord
  
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to_active_hash :prefecture

end
