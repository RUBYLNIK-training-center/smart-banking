class UsersController < ApplicationController
  include WalletsHelpers

  def show
    @wallets = Wallet.unlocked_user_wallets(current_user)
    @currencies = Currency.order(:name)
    @wallet = Wallet.new
  end
end
