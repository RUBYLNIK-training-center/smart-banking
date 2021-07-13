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
RSpec.describe AccessToken do
  let(:access_token) do
    described_class.new('test@mail.ru', 'test', 'test')
  end

  describe '.user_fields_exist?' do
    context 'when access token fields were passed' do
      it { expect(access_token.email).to eq('test@mail.ru') }
      it { expect(access_token.name).to eq('test') }
      it { expect(access_token.surname).to eq('test') }
    end
  end

  describe '#info' do
    context '' do
      it { expect(access_token.info).to eq({ 'email' => 'test@mail.ru', 'name' => 'test', 'surname' => 'test' }) }
    end
  end
end
