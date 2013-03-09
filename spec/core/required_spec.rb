require 'core/required'

describe Core::Required do
  it "should throw an error when initialized" do
    expect {
      Core::Required.new
    }.to raise_error
  end

  it "should throw an error when used in parameter default and no parameter given" do
    def foo(a=Core::Required.new)
    end

    expect {
      foo()
    }.to raise_error
  end

  it "should not throw an error when used in parameter default and parameter given" do
    def foo(a=Core::Required.new)
    end

    expect {
      foo(1)
    }.not_to raise_error
  end

  it "should throw an error when not filled in an arguments hash" do
    def foo(args={})
      args[:bar] ||= Core::Required.new
    end

    expect {
      foo()
    }.to raise_error
  end

  it "should not throw an error when filled in an arguments hash" do
    def foo(args={})
      args[:bar] ||= Core::Required.new
    end

    expect {
      foo({:bar => 1})
    }.not_to raise_error
  end

  it "should give an clear description what is required on failure" do
    begin
      Core::Required.new(:bar)
    rescue Exception => e
      e.message.should include('a')
    end
  end
end