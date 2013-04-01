require 'test_helper'
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

  describe "NormalVirtus" do
    it "should create getters" do
      NormalVirtus.new.must_respond_to :foo
    end

    it "should create setters" do
      NormalVirtus.new.must_respond_to :foo=
    end

    it "should have a default" do
      NormalVirtus.new.foo.must_equal 'bar'
    end

    it "should coerce number to string" do
      v = NormalVirtus.new foo: 123
      v.foo.must_equal '123'
    end

    it "should not coerce object to string" do
      o = Object.new
      v = NormalVirtus.new foo: o
      v.foo.must_equal o
    end

    it "should not be equal based on attributes" do
      a = NormalVirtus.new foo: 'hans'
      b = NormalVirtus.new foo: 'hans'
      a.wont_equal b
    end
  end

  describe "ValueVirtus" do
    it "should not create setters" do
      ValueVirtus.new.wont_respond_to :foo=
    end

    it "should coerce number to string" do
      v = ValueVirtus.new foo: 123
      v.foo.must_equal '123'
    end

    it "should not coerce object to string" do
      o = Object.new
      v = ValueVirtus.new foo: o
      v.foo.must_equal o
    end

    it "should be equal based on attributes" do
      a = ValueVirtus.new foo: 'hans'
      b = ValueVirtus.new foo: 'hans'
      a.must_equal b
    end
  end

end
