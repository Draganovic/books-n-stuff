require 'rails_helper'

RSpec.feature "user can login" do
  scenario "they are registered and then login" do
    user = User.create!(username: "Bob", password: "password1")

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: "password1"
    click_button "Login"

    expect(page).to have_content "Welcome Bob"
  end
end
