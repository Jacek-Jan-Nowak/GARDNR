class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :gardens
  has_many :bookings
  # has_many :reviews, through: :gardens, dependent: :destroy
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
