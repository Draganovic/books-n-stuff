require 'rails_helper'

RSpec.feature "admin can delete a book" do
  scenario "they remove a book from the app" do
    user = User.create(username: "Bill", password: "123", role: 1)
    book1 = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")
    book2 = Book.create!(title: "The Jungle Book", author: "Some Guy", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"

    expect(current_path).to eq admin_dashboard_path

    click_on "View All Books"

    expect(page).to have_content book1.title

    visit book_path(book1)

    click_on "Delete"

    expect(page).to_not have_content book1.title
    expect(page).to have_content book2.title
  end
end
