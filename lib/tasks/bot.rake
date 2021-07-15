namespace :bot do
  desc 'start telegram bot poller(dev env only)'
  task start: :environment do
    Telegram::Bot::UpdatesPoller.new(Telegram.bot, TelegramWebhookController).start
  end
end
