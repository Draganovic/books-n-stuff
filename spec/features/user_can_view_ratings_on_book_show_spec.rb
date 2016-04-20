require 'rails_helper'

RSpec.feature 'user can view ratings on a books page' do
  scenario 'they are on a books show' do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating3 = Rating.create!(score: 3, book_id: book.id)
    rating1 = Rating.create!(score: 2, book_id: book.id)
    rating2 = Rating.create!(score: 4, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content book.average_rating
  end
end
