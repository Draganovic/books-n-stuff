class Rating < ActiveRecord::Base
  validates :score, inclusion: 0..5
  belongs_to :book
end
