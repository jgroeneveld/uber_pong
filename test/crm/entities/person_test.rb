require 'test_helper'
require 'crm/entities/person'

module CRM

  describe Person do

    describe "Class" do
      subject { Person }

      it "should contain a set of possible roles" do
        Person::ROLES.length.must_be :>, 0
      end
    end


    describe "Instance" do
      subject { Person.new first_name: 'peter', last_name: 'mueller', role: :technical, email: 'hans@franz.de' }

      it "should have fields" do
        subject.first_name.must_equal 'peter'
        subject.last_name.must_equal 'mueller'
        subject.role.must_equal :technical
        subject.email.must_equal 'hans@franz.de'
      end

      it "should be agnostic of string or symbol roles" do
        subject.role = 'technical'
        subject.role.must_equal :technical
        subject.role = :technical
        subject.role.must_equal :technical
      end

      it "should have a defined set of possible roles" do
        proc {
          subject.role = :no_possible_role_without_doubt
        }.must_raise RoleNotFound

        subject.role = Person::ROLES.first
        subject.role.must_equal Person::ROLES.first
      end
    end

  end

end