require 'spec_helper'
require 'core/entity'

module Core

  describe Entity do
    class TestEntity < Entity
      attr_accessor :foo
      attr_accessor :bar
    end

    it "should have the args as instance vars" do
      e = TestEntity.new(foo: 'a', bar: 'b')
      e.instance_variable_get(:@foo).should == 'a'
      e.instance_variable_get(:@bar).should == 'b'
    end

    it "should throw an error if there is no setter" do
      expect {
        TestEntity.new(undefined: 1)
      }.to raise_error(Entity::UndefinedSetter)
    end

    it "should call setters" do
      class MoarTestEntity < TestEntity
        def special=(x)
          @special = x+'CALLED'
        end
        def special
          @special
        end
      end
      f = MoarTestEntity.new(special: 'blub')
      f.special.should == 'blubCALLED'
    end
  end

end