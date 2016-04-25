require 'rails_helper'

RSpec.feature 'guest can view all books' do
  scenario 'they view every book in the database' do
    book1 = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")
    book2 = Book.create!(title: "A Brave New World", author: "Aldus Huxley", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    visit books_path
    first("a").click
    expect(current_path).to eq book_path(book2)

    within 'h1#title' do
      expect(page).to have_content book2.title
    end
    within '.book_info' do
      expect(page).to have_content book2.author
      expect(page).to have_content book2.average_rating
    end
  end
end
