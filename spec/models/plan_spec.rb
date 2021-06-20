require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to belong_to(:currency)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:amount)
      expect(subject).to validate_presence_of(:interval)
      expect(subject).to validate_presence_of(:trial_period_days)
      expect(subject).to validate_length_of(:statement_desc).is_at_least(20).is_at_most(500)
    end
  end
end
