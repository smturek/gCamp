require 'rails_helper'

describe User do

  it 'validates that the user email is unique' do
    User.create!(first_name: "John",
                last_name: "Doe",
                email: "me@example.com",
                password: "test",
                password_confirmation: "test")

    user = User.new(email: "me@example.com")
    user.valid?
    expect(user.errors[:email].present?).to eq(true)

    user.email = "you@example.com"
    user.valid?
    expect(user.errors[:email].present?).to eq(false)

  end

end
