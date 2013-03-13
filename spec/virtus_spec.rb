require 'virtus'

describe Virtus do
  class NormalVirtus
    include Virtus
    attribute :foo, String, default: 'bar'
  end

  class ValueVirtus
    include Virtus::ValueObject
    attribute :foo, String
  end

  context "NormalVirtus" do
    it "should create getters" do
      NormalVirtus.new.should respond_to :foo
    end

    it "should create setters" do
      NormalVirtus.new.should respond_to :foo=
    end

    it "should have a default" do
      NormalVirtus.new.foo.should == 'bar'
    end

    it "should coerce number to string" do
      v = NormalVirtus.new foo: 123
      v.foo.should == '123'
    end

    it "should not coerce object to string" do
      o = Object.new
      v = NormalVirtus.new foo: o
      v.foo.should == o
    end

    it "shpuld not be equal based on attributes" do
      a = NormalVirtus.new foo: 'hans'
      b = NormalVirtus.new foo: 'hans'
      a.should_not == b
    end
  end

  context "ValueVirtus" do
    it "should not create setters" do
      ValueVirtus.new.should_not respond_to :foo=
    end

    it "should coerce number to string" do
      v = ValueVirtus.new foo: 123
      v.foo.should == '123'
    end

    it "should not coerce object to string" do
      o = Object.new
      v = ValueVirtus.new foo: o
      v.foo.should == o
    end

    it "should be equal based on attributes" do
      a = ValueVirtus.new foo: 'hans'
      b = ValueVirtus.new foo: 'hans'
      a.should == b
    end
  end

end
