require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#default_url_options' do
    context 'is expected to have an locale' do
      it { expect(described_class.default_url_options).to eq({}) }
    end
  end

  describe '#extract_locale' do
    context 'is expected to have an locale' do
      it {
        expect(described_class.default_url_options).to eq(I18n.available_locales.map(&:to_s).include?('en') ? {} : nil)
      }
    end
  end
end
