require 'rails_helper'

RSpec.feature 'guest can add book rating when logged in' do
  scenario 'they rate a book on the book show page' do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating3 = Rating.create!(score: 3, book_id: book.id)
    rating1 = Rating.create!(score: 2, book_id: book.id)
    rating2 = Rating.create!(score: 4, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content 3.0
    click_on "Rate This Book"
    fill_in "Score", with: 5
    click_on "Create Rating"
    expect(current_path).to eq book_path(book)
    expect(page).to have_content 3.5
  end
end
