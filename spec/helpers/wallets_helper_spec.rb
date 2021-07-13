require 'rails_helper'

RSpec.describe WalletsHelper, type: :helper do
  describe 'when wallet number was parsed' do
    let(:random_wallet_number1) { '5241951696429313' }
    let(:random_wallet_number2) { '2976749052208250' }
    let(:random_wallet_number3) { '9979390774184774' }

    let(:parsed1) { parse_wallet_number(random_wallet_number1) }
    let(:parsed2) { parse_wallet_number(random_wallet_number2) }
    let(:parsed3) { parse_wallet_number(random_wallet_number3) }

    it { expect(parsed1).to eq('5241 - 9516 - 9642 - 9313') }
    it { expect(parsed2).to eq('2976 - 7490 - 5220 - 8250') }
    it { expect(parsed3).to eq('9979 - 3907 - 7418 - 4774') }
  end
end
