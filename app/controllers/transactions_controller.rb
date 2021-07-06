class TransactionsController < ApplicationController
  include TransactionsHelpers
  include WalletsHelpers

  def new
    @transaction = Transaction.new
    @wallets = current_user.wallets
    @transaction.fee = 0.99
  end

  def create
    @wallets = current_user.wallets
    sender_wallet = Wallet.find(params[:transaction][:wallet_id])

    if TransactionsHelpers.wallet_has_money(sender_wallet.amount, params[:transaction][:sum].to_i)
      WalletsHelpers.freeze_wallet(sender_wallet)
      TransactionsHelpers.withdrawal_of_funds(sender_wallet, params[:transaction][:sum])

      reciepent_wallet = WalletsHelpers.freeze_wallet(Wallet.find_by_wallet_number(params[:transaction][:wallet_reciepent]))
      TransactionsHelpers.money_transfer(reciepent_wallet, params[:transaction][:sum])

      @transaction = current_user.transactions.create(status: true,
                                                      transaction_type: params[:transaction][:transaction_type],
                                                      sum: params[:transaction][:sum],
                                                      fee: params[:transaction][:fee],
                                                      sender_id: sender_wallet.user_id,
                                                      user_id: reciepent_wallet.user_id,
                                                      wallet_id: params[:transaction][:wallet_id],
                                                      date: Time.now,
                                                      wallet_reciepent: params[:transaction][:wallet_reciepent])

      WalletsHelpers.unfreeze(sender_wallet)
      WalletsHelpers.unfreeze(reciepent_wallet)

      TransactionsHelpers.transaction_creation_prohibited(sender_wallet, reciepent_wallet)

      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    else
      redirect_to new_transactions_path, notice: 'Insufficient funds for transfer!'
    end
  end

  def show; end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :sum, :fee, :wallet_reciepent)
  end
end
