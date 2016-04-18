require 'rails_helper'

RSpec.feature "user can login" do
  scenario "they are created and login" do
    visit new_user_path

    fill_in "Username", with: "admir"
    fill_in "Password", with: "password1"

    click_on "Create Account"

    expect(page).to have_content "Welcome admir"
  end
end
