require 'minitest/reporters'


class MyReporter < MiniTest::Reporters::ProgressReporter
  def print_info(e, name = true)
    print pad("#{e.exception.class.to_s}: ") if name
    e.message.each_line { |line| puts pad(line) }
    trace = filter_backtrace(e.backtrace)
    trace.each { |line| puts pad(line) }
  end
end



# spec like
# MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new
# progress bar
MiniTest::Reporters.use! MyReporter.new