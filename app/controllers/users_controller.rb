class UsersController < ApplicationController
  include WalletsHelpers

  def show
    @wallets = WalletsHelpers.unlocked_user_wallets(current_user)
    @currencies = Currency.order(:name)
    @wallet = Wallet.new
  end
end
