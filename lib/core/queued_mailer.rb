module Core
  class QueuedMailer
    def send_mail(to, subject, body)
      @queued_mails ||= []
      @queued_mails << {
        to: to,
        subject: subject,
        body: body
      }
    end

    def queued_mails
      @queued_mails || []
    end
  end
end
