require 'spec_helper'

describe ShowroomsController do

  let(:user) { Factory.create(:user) }

  before do
    sign_in user
  end

  context "#index" do
    it "should show all showrooms" do
      3.times { Factory.create(:showroom) }
      get :index
      assigns(:showrooms).should have(3).items
    end
  end

  it "should not permit unauthorized user" do
    sign_out user
    get :index
    assigns(:showrooms).should be_nil
    # TODO: refactor to use i18n keys instead of direct strings (if have time)
    flash[:alert].should == "You need to sign in or sign up before continuing."
  end

end
