require 'rails_helper'

RSpec.feature 'guest can view homepage' do
  scenario 'they enter the site and see homepage content' do

    visit root_path

    expect(page).to have_content 'Books n Stuff'

    click_on "All Books"

    expect(current_path).to eq books_path
  end
end
