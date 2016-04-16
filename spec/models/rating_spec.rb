require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "has a score" do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating = Rating.create!(score: 4, book_id: book.id)

    expect(rating.score).to eq 4
  end
end
