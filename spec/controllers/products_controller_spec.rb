require 'spec_helper'

describe ProductsController do

  let(:user) {Factory.create(:user)}

  before do
    controller.stub!(:authenticate_user!).and_return(true)
    controller.stub!(:current_user).and_return(:user)
  end

  context "#index" do
    it "should render products" do
      get :index
      assigns(:products).should_not be_nil
    end
  end

end
