require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:rate)
    end
  end
end
