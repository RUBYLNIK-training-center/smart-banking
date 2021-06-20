require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:rate) }
  end
end
