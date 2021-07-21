class WalletsController < ApplicationController
  include WalletsHelpers

  def new
    @wallet = Wallet.new
    @currencies = WalletsHelpers.currencies
  end

  def create
    @wallet = current_user.wallets.create(currency_id: params[:currency_id], amount: 100,
                                          wallet_number: WalletsHelpers.create_random_wallet_number,
                                          user_id: current_user.id, locked: false)
    redirect_to users_url, notice: 'Wallet was successfully created.'
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  private

  def wallet_params
    params.require(:wallet).permit(:currency_id)
  end
end
