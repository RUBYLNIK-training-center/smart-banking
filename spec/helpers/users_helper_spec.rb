require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  describe '.user_fields_exist?' do
    let(:user) do
      User.create(email: 'test13@mail.ru', name: 'test', surname: 'test', passport_number: 'MP18237462')
    end

    context 'when user fields were passed' do
      it { expect(user_fields_exist?(user)).to eq(true) }
    end
  end
end
