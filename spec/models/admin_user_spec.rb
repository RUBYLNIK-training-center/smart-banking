require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts) }
  end
end
