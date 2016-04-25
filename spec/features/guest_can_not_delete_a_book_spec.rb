require 'rails_helper'

RSpec.feature 'guest can not delete a book' do
  scenario 'they are on the books page and do not see delete button' do
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    visit book_path(book)

    expect(page).to_not have_link "Delete"

  end
end
