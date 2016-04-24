require 'rails_helper'

RSpec.feature "admin can add a book" do
  scenario "admin logs in and adds a book" do
    user = User.create(username: "Bob", password: "password", role: 1)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_on "Login"

    expect(current_path).to eq admin_dashboard_path

    click_on "Create a book"

    expect(current_path).to eq new_book_path

    fill_in "Title", with: "Brave new world"
    fill_in "Author", with: "Huxley"
    fill_in "Image" , with:  "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816"

    click_on "Create"

    expect(current_path).to eq books_path

    within ".books" do
      expect(page).to have_content "Brave new world"
    end
  end
end
