require 'rails_helper'

RSpec.describe User, type: :model do
  context '#import' do
    it "should return the right name" do
      user = User.new
      allow(user).to receive(:call_api).and_return('[{"name": "Elsa"}]')
      expect(user.import).to eq('Elsa')
    end
  end
end
