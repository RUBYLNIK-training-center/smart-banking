require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  let(:user) { described_class.from_omniauth(access_token) }
  let(:access_token) { AccessToken.new('test@mail.ru', 'test', 'test') }

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

  describe '.from_omniauth' do
    let(:my_test) do
      described_class.first_or_create(email: 'test11@mail.ru', name: 'test', surname: 'test')
    end

    it { expect(user).to eq(my_test) }
  end

  describe 'user email' do
    it { expect(user.email).to eq('test@mail.ru') }
  end

  describe 'user name' do
    it { expect(user.name).to eq('test') }
  end

  describe 'user surname' do
    it { expect(user.surname).to eq('test') }
  end
end
