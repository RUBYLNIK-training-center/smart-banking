require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it 'has belong to associations', :aggregate_failures do
      expect(subject).to belong_to(:wallet)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:date)
    end
  end
end
