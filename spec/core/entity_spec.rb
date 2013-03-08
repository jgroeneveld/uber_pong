require_relative '../spec_helper'

describe Core::Entity do
  it "should have the args as instance vars" do
    e = Core::Entity.new(foo: 'a', bar: 'b')
    e.instance_variable_get(:@foo).should == 'a'
    e.instance_variable_get(:@bar).should == 'b'
  end

  it "should call setters if available" do
    class Foo < Core::Entity
      def bar=(x)
        @bar = x+'CALLED'
      end
      def bar
        @bar
      end
    end

    f = Foo.new(bar: 'blub')
    f.bar.should == 'blubCALLED'
  end
end