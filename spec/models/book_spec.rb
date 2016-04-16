require 'rails_helper'

RSpec.describe Book, type: :model do
  it "has an average_rating" do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating1 = Rating.create!(score: 2, book_id: book.id)
    rating2 = Rating.create!(score: 4, book_id: book.id)
    rating3 = Rating.create!(score: 3, book_id: book.id)

    expect(book.average_rating).to eq 3
  end
end
