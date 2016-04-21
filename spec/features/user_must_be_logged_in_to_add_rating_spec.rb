require 'rails_helper'

RSpec.feature 'user must be logged in to add rating' do
  scenario 'they login and then add rating' do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating1 = Rating.create!(score: 3, book_id: book.id)
    rating2 = Rating.create!(score: 2, book_id: book.id)
    rating3 = Rating.create!(score: 4, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content 3.0
    click_on "Rate This Book"

    expect(current_path).to eq login_path
    expect(page).to have_content "Please Login"
  end
end
