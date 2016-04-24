require 'rails_helper'

RSpec.feature "admin can navigate to books path" do
  scenario "they are on dashboard and click link to books" do
    user = User.create(username: "Norm", password: "123", role: 1)

    visit admin_dashboard_path(user)

    click_on "View All Books"

    expect(current_path).to eq books_path
  end
end
