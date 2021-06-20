require 'rails_helper'

RSpec.describe Post do
  describe 'associations' do
    it 'has belong to associations', :aggregate_failures do
      expect(subject).to belong_to(:admin_user)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:description)
    end

    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:name).is_at_least(2)
      expect(subject).to validate_length_of(:description).is_at_least(20).is_at_most(500)
    end
  end
end
