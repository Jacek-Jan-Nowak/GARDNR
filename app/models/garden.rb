class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, :address, :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } 
    }

  # i need acces to reviews associated with that garden

  # i need to iterate those reviews with some kind if incrementation

  def number_of_reviews
    # sum = 0
    # reviews.each do |review|
    #   sum += 1
    # end
    # return sum 
    reviews.count
  end

  def self.gardens_with_review
    joins(:reviews)
    # sum = 0 
    # Garden.all.each do |garden|
    #   if garden.reviews.any?
    #     sum += 1
    #   end
    # end
    # sum
  end

  def self.five_star_garden
    joins(:reviews).where(reviews: {rating: 5})
    # SELECT * FROM gardens
    # JOIN reviews ON garden_id = review.garden_id
    # WHERE review.rating = 5 
  end
end

