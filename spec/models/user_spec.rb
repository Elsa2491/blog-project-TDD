require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user' do
    # expect(User.count).to eq (1)
    user = build(:user)
    user.save
    expect(User.count).to eq(1)
  end
end
