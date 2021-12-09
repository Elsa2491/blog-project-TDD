require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user' do
    user = build(:user)
    user.save
    expect(User.count).to eq(2)
  end
end
