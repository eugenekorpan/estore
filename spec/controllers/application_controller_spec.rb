require "spec_helper"

describe ApplicationController do

  let(:user) { Factory.create(:user) }
  let!(:showroom) { Factory.create(:showroom, :user => user) }
  let(:admin_user) { Factory.create(:admin_user) }

  before do
    sign_in user
  end

  context "#after_sign_in_path_for" do
    it "should redirect to showroom path after user login" do
      subject.after_sign_in_path_for(user).should == showroom_products_path(user.current_showroom)
    end

    it "should redirect to default path if user is admin" do
      sign_out user
      sign_in admin_user
      subject.after_sign_in_path_for(admin_user).should == root_path
    end
  end

  context "#current_showroom" do
    it "should return showroom of logged in user" do
      subject.current_showroom.should eq(user.current_showroom)
    end

    it "should return nil if user is not logged in" do
      sign_out user
      subject.current_showroom.should be_nil
    end
  end

end
