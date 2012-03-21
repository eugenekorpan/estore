require 'spec_helper'

describe AdminUser do
  it "should be valid" do
    Factory.build(:admin_user).should be_valid
  end
end
