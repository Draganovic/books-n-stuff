require 'rails_helper'

RSpec.feature 'user can not delete a book' do
  scenario 'they are on the books page and do not see delete button' do
    user = User.create(username: 'Gary', password: 'apple')
    book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'apple'

    click_on 'Login'

    visit book_path(book)

    expect(page).to_not have_link "Delete"
  end
end
