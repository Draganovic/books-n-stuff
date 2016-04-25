class Book < ActiveRecord::Base
  has_many :ratings

  def average_rating
    average = ratings.average(:score) || 0.0
    average.round(1).to_f
  end

  def self.alphabetize
    self.order(title: :asc)
  end

end
