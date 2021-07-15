class TelegramWebhookController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include Telegram::Bot::UpdatesController::CallbackQueryContext
  use_session!

  def start!(value = nil, *)
    save_context :start!

    if value
      case value
      when '📈'
        show_currencies
      when '📄'
        show_faq
      end
    else
      respond_with :message, text: 'Menu', reply_markup: {
        keyboard: [
          ['📈 Currencies'],
          ['📄 FAQ']
        ],
        resize_keyboard: true,
        selective: true
      }
    end
  end

  private

  def show_currencies
    currencies = Currency.all
    text = "Currency - 1 USD\n"

    currencies.each do |currency|
      text << "#{currency.name} - #{currency.rate}\n"
    end

    respond_with :message, text: text, parse_mode: :Markdown
  end

  def show_faq
    respond_with :message, text: 'FAQ HERE', parse_mode: :Markdown
  end
end
