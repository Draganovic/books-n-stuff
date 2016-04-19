require 'rails_helper'

RSpec.feature "user can logout" do
  scenario "they end session by logging out" do
    user = User.create!(username: "Bob", password: "password1")

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: "password1"
    click_button "Login"

    expect(page).to have_content "Welcome Bob"

    click_on "Logout"
  
    expect(page).to_not have_content "Welcome Bob"
  end
end
