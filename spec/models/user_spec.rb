require 'spec_helper'

describe User do

  let(:user) { Factory.build(:user) }

  context "validation" do
    it "should be valid" do
      user.should be_valid
    end

    it "should require first name" do
      user.first_name = nil
      user.should_not be_valid
    end

    it "should require last name" do
      user.last_name = nil
      user.should_not be_valid
    end

    it "should require email" do
      user.email = nil
      user.should_not be_valid
    end

    context "password" do
      let(:user) { Factory.build(:user, :password => nil, :password_confirmation => nil) }
      
      it "should require password and password confirmation" do
        user.should_not be_valid
        user.errors[:password].should_not be_blank
      end

      it "should match password confirmation" do
        user.password = "Password1"
        user.password_confirmation = "password 2"
        user.should_not be_valid
      end
    end
  end

  context "#full_name" do
    it "should have full name" do
      users_name = "#{user.first_name} #{user.last_name}"
      user.full_name.should eq("#{users_name}")
    end
  end

  context "#current_showroom" do
    it "should use lates showroom" do
      Factory.create(:showroom, :user => user)
      latest_showroom = Factory.create(:showroom, :user => user)
      user.current_showroom.should eq(latest_showroom)
    end
  end
end
