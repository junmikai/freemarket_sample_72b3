class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
# 適用したらログイン機能が反映されないため一旦外してます
  # has_many :products, dependent: :destroy
  # belongs_to :destination, dependent: :destroy
  # belongs_to :card, dependent: :destroy
end
