require 'core/queued_mailer'

module Core

  describe QueuedMailer do
    subject { QueuedMailer.new }
    specify { subject.queued_mails.count.should == 0}

    it "should queue a mail" do
      subject.send_mail('hans@harald.de', 'deine nachricht', 'war echt nett <3')
      subject.queued_mails.count.should == 1
    end

    it "should queue several mails" do
      subject.send_mail('hans@harald.de', 'deine nachricht', 'war echt nett <3')
      subject.send_mail('hans2@harald.de', 'deine nachricht2', 'war echt nett2 <3')
      subject.queued_mails.count.should == 2
    end

  end

end
