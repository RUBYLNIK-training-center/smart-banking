require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'associations' do
    it 'has belong to associations', :aggregate_failures do
      expect(subject).to belong_to(:wallet)
      expect(subject).to belong_to(:category)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
    end

    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:name).is_at_least(2).is_at_most(20)
    end
  end
end
