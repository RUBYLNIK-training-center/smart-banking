require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it 'has belong to associations', :aggregate_failures do
      expect(subject).to belong_to(:user)
    end
  end
end
