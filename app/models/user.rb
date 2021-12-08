class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { in: 3..20 }
  validates :age, presence: true, numericality: { only_integer: true, :greater_than => 0, :less_than => 120 }
  validates :nickname, presence: true, length: { in: 3..20 }
  validates :gender, presence: true
  validates :game_id, presence: true, length: { in: 3..20 }
  enum gender: [ '男性', '女性', '他の性別' ]
end
