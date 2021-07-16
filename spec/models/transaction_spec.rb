require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:wallet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe '#receipt' do
    subject(:transaction) { build_stubbed(:transaction) }

    let(:receipt_generator) { instance_double(Receipts::ReceiptGenerator) }
    let(:receipt) { OpenStruct.new(id: transaction.id) }

    before do
      expect(Receipts::ReceiptGenerator).to receive(:new).with(transaction).and_return(receipt_generator)
      expect(receipt_generator).to receive(:call).and_return(receipt)
    end

    it 'returns correct attributes' do
      expect(transaction.receipt.id).to eq receipt.id
    end
  end
end
