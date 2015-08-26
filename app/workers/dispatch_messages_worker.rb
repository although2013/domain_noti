class DispatchMessagesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, :backtrace => true

  def perform(msg_id)
    Inbox.transaction do
      User.all.each do |user|
        Inbox.create(:message_id => msg_id, :user_id => user.id)
      end
    end
  end
end