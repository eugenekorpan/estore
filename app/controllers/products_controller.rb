class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_showroom
  before_filter :find_product, :only => :show

  def index
    @products = @showroom.products.page(params[:page] || 1)
  end

  private

  def find_product
    @product = @showroom.products.find_by_id(params[:id])
    redirect_to showroom_products_path(@showroom), :notice => "Invalid url" unless @product
  end

  def find_showroom
    @showroom = Showroom.find_by_id(params[:showroom_id])
    redirect_to showrooms_path, :notice => "Invalid url" unless @showroom
  end
end
