class DispatchMessagesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, :backtrace => true

  def perform(msg_id)
    #$redis.setbit("global-msg#{msg_id}", 0, 1)
  end
end