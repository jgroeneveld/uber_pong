require 'uber_pong'

describe UberPong do

  it "should have a mailer" do
    UberPong.mailer.should_not be_nil
  end

end