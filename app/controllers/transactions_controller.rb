class TransactionsController < ApplicationController
  include TransactionsHelpers
  include WalletsHelpers

  def index
    @transactions = current_user.transactions.includes([:wallet]).page params[:page]
  end

  def show
    @transaction = current_user.transactions.find(params[:id])

    send_data(
      @transaction.receipt.render,
      filename: "#{@transaction.created_at.strftime("%Y-%m-%d")}-smartbanking-receipt.pdf",
      type: "application/pdf",
      disposition: :inline
    )
  end

  def new
    @transaction = Transaction.new(fee: 0.99)
    @service = TransactionsHelpers.service(params[:service_id])
    @wallets = current_user.wallets
  end

  def create
    @wallets = current_user.wallets
    sender_wallet = Wallet.find(params[:transaction][:wallet_id])

    reciepent_wallet = TransactionsHelpers.find_by_service_or_wallet_number(params[:service_id],
                                                                            params[:transaction][:wallet_reciepent])

    if TransactionsHelpers.wallet_has_money(sender_wallet.amount,
                                            params[:transaction][:sum].to_i) && reciepent_wallet.present? && params[:transaction][:sum].present?
      sender_wallet.freeze!
      TransactionsHelpers.withdrawal_of_funds(sender_wallet, params[:transaction][:sum])

      reciepent_wallet.freeze!

      sum = WalletsHelpers.currency_convertation(sender_wallet, reciepent_wallet, params[:transaction][:sum])

      TransactionsHelpers.money_transfer(reciepent_wallet, sum.to_f)

      @transaction = current_user.transactions.create(status: true,
                                                      transaction_type: 'Banking',
                                                      sum: params[:transaction][:sum],
                                                      fee: 0.99,
                                                      sender_id: sender_wallet.user_id,
                                                      user_id: reciepent_wallet.user_id,
                                                      wallet_id: params[:transaction][:wallet_id],
                                                      date: Time.current,
                                                      wallet_reciepent: reciepent_wallet.wallet_number,
                                                      service_id: params[:service_id])
      unfreeze_wallets(sender_wallet, reciepent_wallet)
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    elsif reciepent_wallet.nil? || params[:transaction][:sum].empty?
      redirect_to new_transaction_path, notice: 'You have not completed all the fields!'
    else
      redirect_to new_transaction_path, notice: 'Insufficient funds for transfer!'
    end
  end

  private

  def unfreeze_wallets(sender_wallet, reciepent_wallet)
    sender_wallet.unfreeze!
    reciepent_wallet.unfreeze!
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :sum, :fee, :wallet_reciepent, :service_id)
  end
end
