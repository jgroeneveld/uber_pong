require 'spec_helper'
require 'crm/entities/person'

module CRM

  describe Person do

    context "Class" do
      subject { Person }

      it "should contain a set of possible roles" do
        Person::ROLES.length.should > 0
      end
    end


    context "Instance" do
      subject { Person.new first_name: 'peter', last_name: 'mueller', role: :technical, email: 'hans@franz.de' }

      it "should have fields" do
        subject.first_name.should == 'peter'
        subject.last_name.should == 'mueller'
        subject.role.should == :technical
        subject.email.should == 'hans@franz.de'
      end

      it "should be agnostic of string or symbol roles" do
        subject.role = 'technical'
        subject.role.should == :technical
        subject.role = :technical
        subject.role.should == :technical
      end

      it "should have a defined set of possible roles" do
        expect { subject.role = :no_possible_role_without_doubt }.to raise_error Person::UnknownRole

        subject.role = Person::ROLES.first
        subject.role.should == Person::ROLES.first
      end
    end

  end

end