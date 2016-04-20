require 'rails_helper'

RSpec.feature 'user can add book rating between 0 and 5' do
  scenario 'they rate a book between 0 - 5 on the book show page' do
    user = User.create!(username: "Bill", password: "123")
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    rating3 = Rating.create!(score: 3, book_id: book.id)
    rating1 = Rating.create!(score: 2, book_id: book.id)
    rating2 = Rating.create!(score: 4, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content 3.0
    click_on "Rate This Book"

    expect(page).to have_content ""

    fill_in "Score", with: 6
    click_on "Create Rating"
    expect(page).to have_content "Please enter a number between 0 and 5"

    fill_in "Score", with: -7
    click_on "Create Rating"
    expect(page).to have_content "Please enter a number between 0 and 5"

    fill_in "Score", with: 1
    click_on "Create Rating"

    expect(current_path).to eq book_path(book)
    expect(page).to have_content 2.5
  end
end
