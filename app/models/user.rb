class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :microposts, dependent: :destroy
  validates :name, presence: {message: 'を入力してください'}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

def feed
  Micropost.where("user_id = ?", id)
end
end
