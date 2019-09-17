class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :username, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 500 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
