class Garden < ApplicationRecord
  belongs_to :user

  has_many_attached :photos
  
  validates :title, :address, :price, :description, presence: true
end
