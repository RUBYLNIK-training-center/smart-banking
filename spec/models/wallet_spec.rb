require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:transactions)
      expect(subject).to belong_to(:currency)
      expect(subject).to belong_to(:user)
    end

    describe 'validations' do
      it 'has presence validate', :aggregate_failures do
        expect(subject).to validate_presence_of(:amount)
      end
    end
  end
end
