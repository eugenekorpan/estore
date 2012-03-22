require 'spec_helper'

describe 'AdminPages' do

  let(:admin_user) { Factory.create(:admin_user, :password => 'password') }
  let(:user) { Factory.create(:user) }
  let(:product) { Factory.create(:product) }
  let!(:showroom) { Factory.create(:showroom, :user => user, :products => [product]) }

  before do
    post 'admin/login', :admin_user => { :email => admin_user.email, :password => 'password' }
  end

  describe "dashboards" do
    it "should show dashboard" do
      get admin_dashboard_path
      response.status.should be(200)
      response.body.should include("Recent Products")
    end
  end

  describe "products" do
    it "should show products" do
      get admin_products_path
      response.status.should be(200)
      response.body.should include(product.name)
    end

    it "should show product details" do
      get admin_product_path(product)
      response.status.should be(200)
      response.body.should include(product.name)
    end

    it "should show product edit form" do
      get edit_admin_product_path(product)
      response.status.should be(200)
    end
  end

  describe "showrooms" do
    it "shoud show all showrooms" do
      get admin_showrooms_path
      response.status.should be(200)
    end

    it "should show edit showroom form" do
      get edit_admin_showroom_path(showroom)
      response.status.should be(200)
    end
  end

end
