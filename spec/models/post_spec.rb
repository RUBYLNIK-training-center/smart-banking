require 'rails_helper'

RSpec.describe Post do
  describe 'associations' do
    it { is_expected.to belong_to(:admin_user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }
    it { is_expected.to validate_length_of(:description).is_at_most(2000) }

    # it { is_expected.to validate_attached_of(:avatar) }

    it { is_expected.to validate_content_type_of(:avatar).allowing('image/png', 'image/jpeg', 'image/jpg') }
    it { is_expected.to validate_content_type_of(:avatar).rejecting('text/plain', 'text/xml') }
  end
end
