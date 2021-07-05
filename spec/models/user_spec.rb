require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:wallets) }
    it { is_expected.to have_many(:subscriptions) }
    it { is_expected.to have_many(:transactions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#lock!' do
    before { subject.lock! }

    it { is_expected.to be_locked }
  end

  describe '#unlock!' do
    before { subject.unlock! }

    it { is_expected.not_to be_locked }
  end
end
