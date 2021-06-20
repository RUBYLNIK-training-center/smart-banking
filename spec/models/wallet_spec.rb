require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
  end
end
