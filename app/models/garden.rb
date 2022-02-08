class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  # geocoded_by :address

  validates :title, :address, :price, presence: true

  # after_validation :geocode, if: :will_save_change_to_address?

  # include PgSearch::Model
  # pg_search_scope :search_by_address,
  #   against: [ :address ],
  #   using: {
  #     tsearch: { prefix: true } 
  #   }
end
