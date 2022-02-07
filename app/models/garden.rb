class Garden < ApplicationRecord
  belongs_to :user
  validates :title, :address, :price, :description, presence: true
end
