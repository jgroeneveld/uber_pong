require "uber_pong/version"

require 'core/queued_mailer'

module UberPong

  def self.mailer
    @mailer || @mailer = Core::QueuedMailer.new
  end

end
