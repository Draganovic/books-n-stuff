require 'rails_helper'

RSpec.feature 'guest can view all books' do
  scenario 'they view every book in the database' do
    book1 = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")
    book2 = Book.create!(title: "A Brave New World", author: "Aldus Huxley", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    visit books_path

    expect(page).to have_content book1.title
    expect(page).to have_content book1.author

    expect(page).to have_content book2.title
    expect(page).to have_content book2.author
  end
end
