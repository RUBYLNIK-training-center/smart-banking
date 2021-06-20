require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:wallet) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }
  end
end
