require 'spec_helper'

describe ProductsController do

  let(:user) { Factory.create(:user) }
  let(:product) { Factory.create(:product) }
  let(:showroom) { Factory.create(:showroom, :user => user, :products => [product]) }
  let(:current_showroom) { user.current_showroom }

  before do
    sign_in user
  end

  context "#index" do
    it "should render products" do
      get :index, :showroom_id => showroom
      assigns(:showroom).should eq(showroom)
      assigns(:products).should have(1).item
    end

    it "should not raise an error with invalid showroom id" do
      lambda {
        get :index, :showroom_id => "invalid"
      }.should_not raise_error
      response.should redirect_to(showroom_products_path(current_showroom))
    end

    it "should not permit unauthorized user" do
      sign_out user
      get :index, :showroom_id => showroom
      assigns(:products).should be_nil
    end
  end

  context "#show" do
    it "should show product info" do
      get :show, :id => product
      assigns(:product).should eq(product)
    end

    it "should showr product info even if product doesn't belong to user's showroom" do
      public_product = Factory.create(:product)
      get :show, :id => public_product
      response.should be_success
      assigns(:product).should eq(public_product)
    end

    it "should not raise an error with invalid product id" do
      lambda {
        get :show, :showroom_id => showroom, :id => "invlid" 
      }.should_not raise_error
      response.should redirect_to(showroom_products_path(showroom))
    end


    it "should not permit unauthorized user" do
      sign_out user
      get :show, :showroom_id => showroom, :id => product
      assigns(:product).should be_nil
    end
  end

end
