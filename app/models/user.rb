class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable,
      :validatable, password_length: 7..20
  # validates :password_length, length: {minimum: 7}
  
  validates :email, uniqueness: true
  validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  
  
        #  validates :family_name, format: { with: /^[ぁ-んァ-ヶー一-龠]+$/ }


  
# 適用したらログイン機能が反映されないため一旦外してます
  # has_many :products, dependent: :destroy
  # belongs_to :destination, dependent: :destroy
  # belongs_to :card, dependent: :destroy
end
