class WalletsController < ApplicationController
  include WalletFunc

  def new
    @wallet = Wallet.new
    @currencies = currencies
  end

  def create
    @wallet = current_user.wallets.new(currency_id: wallet_params[:currency_id], amount: 0,
                                       wallet_number: create_random_wallet_number,
                                       user_id: current_user.id, locked: false)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to current_user, notice: 'Wallet was successfully created.' }
      else
        format.html { render :new, location: @wallet }
      end
    end
  end

  private

  def wallet_params
    params.require(:wallet).permit(:currency_id)
  end
end
