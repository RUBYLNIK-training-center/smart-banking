class TransactionsController < ApplicationController
  include TransactionsHelpers
  include WalletsHelpers

  def new
    @transaction = Transaction.new(fee: 0.99)
    @wallets = current_user.wallets
  end

  def create
    @wallets = current_user.wallets
    sender_wallet = Wallet.find(params[:transaction][:wallet_id])
    reciepent_wallet = Wallet.find_by_wallet_number(params[:transaction][:wallet_reciepent])

    if TransactionsHelpers.wallet_has_money(sender_wallet.amount, params[:transaction][:sum].to_i) && !reciepent_wallet.nil?
      sender_wallet.freeze!
      TransactionsHelpers.withdrawal_of_funds(sender_wallet, params[:transaction][:sum])

      reciepent_wallet.freeze!

      reciepent_wallet = Wallet.find_by_wallet_number(params[:transaction][:wallet_reciepent])

      TransactionsHelpers.money_transfer(reciepent_wallet, params[:transaction][:sum])

      @transaction = current_user.transactions.create(status: true,
                                                      transaction_type: 'Banking',
                                                      sum: params[:transaction][:sum],
                                                      fee: 0.99,
                                                      sender_id: sender_wallet.user_id,
                                                      user_id: reciepent_wallet.user_id,
                                                      wallet_id: params[:transaction][:wallet_id],
                                                      date: Time.current,
                                                      wallet_reciepent: params[:transaction][:wallet_reciepent])
      unfreeze_wallets(sender_wallet, reciepent_wallet)
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    elsif reciepent_wallet.nil?
      redirect_to new_transactions_path, notice: 'You have not completed all the fields!'
    else
      redirect_to new_transactions_path, notice: 'Insufficient funds for transfer!'
    end
  end

  def show
    @transactions = current_user.transactions.page params[:page]
  end

  private

  def unfreeze_wallets(sender_wallet, reciepent_wallet)
    sender_wallet.unfreeze!
    reciepent_wallet.unfreeze!
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :sum, :fee, :wallet_reciepent)
  end
end
