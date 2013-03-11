# require 'spec_helper'
require 'core/entity'

module Core

  describe Entity do
    class MyEntity < Entity
      property :foo, String
    end


    context "properties" do
      it "should generate a setter" do
        MyEntity.new.should respond_to(:foo=)
      end

      it "should generate a getter" do
        MyEntity.new.should respond_to(:foo)
      end

      it "should store the string" do
        m = MyEntity.new
        m.foo = 'ein test string'
        m.foo.should == 'ein test string'
      end

      xit "should enforce the string type" do
        MyEntity.property(:a_string, String)
        m = MyEntity.new
        m.a_string = 1234
        m.a_string.should == '1234'
      end

      it "should have serial" do
        MyEntity.property(:id, Serial)
        m = MyEntity.new
        m.should respond_to :id
      end
    end


    it "should call setters" do
      class MoarTestEntity < MyEntity
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

    it "should throw an error if there is no setter" do
      expect {
        MyEntity.new(undefined: 1)
      }.to raise_error(Entity::UndefinedSetter)
    end
  end

end