require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:wallets)
      expect(subject).to have_many(:subscriptions)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:age)
    end
  end

  # describe '.from_omniauth' do
    # let(:auth) do
      # { provider: 'google_oauth2',
        # uid: '12345678',
        # info: {
          # email: 'user@mail.ru',
          # name: 'Egor'
        # } }
    # end
# 
    # it 'creates or updates itself from an oauth hash' do
      # described_class.from_omniauth(auth)
      # new_user = described_class.last
      # expect(new_user.provider).to eq('google_oauth2')
      # expect(new_user.uid).to eq('12345678')
      # expect(new_user.email).to eq('user@mail.ru')
      # expect(new_user.name).to eq('Egor')
      # expect(new_user.surname).to eq('Vorobyov')
    # end
  # end
end
