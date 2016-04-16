class Book < ActiveRecord::Base
  has_many :ratings

  def average_rating
    ratings.average(:score)
  end
end
