class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  # 一人は複数の投稿をする
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 6 }
end
