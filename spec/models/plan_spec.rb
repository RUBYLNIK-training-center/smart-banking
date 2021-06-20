require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:currency) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:interval) }
    it { is_expected.to validate_presence_of(:trial_period_days) }
    it { is_expected.to validate_presence_of(:statement_desc).is_at_least(20).is_at_most(500) }
  end
end
