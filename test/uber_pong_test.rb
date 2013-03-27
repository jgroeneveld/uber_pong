require 'test_helper'
require 'uber_pong'

describe UberPong do

  it "should have a mailer" do
    UberPong.mailer.wont_be_nil
  end

end