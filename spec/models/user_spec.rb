require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username and password" do
    expect(User.new(username: "Hank", password: "password")).to be_valid
  end

  it "is valid with username, password and role" do
    expect(User.new(username: "Hank", password: "password", role: 1)).to be_valid
  end
end
