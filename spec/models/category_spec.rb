require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:services)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
    end
  end
end
