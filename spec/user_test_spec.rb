require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Name test' do
    it 'Should have a name' do
      user = User.new(name: '')
      expect(user.valid?).to eq(false)
    end
  end
end
