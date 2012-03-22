class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_showroom, :only => :index
  before_filter :find_product, :only => :show

  def index
    @products = @showroom.products.page(params[:page] || 1)
  end

  private

  def find_product
    # product is public thus it shouldn't be scoped with @showroom
    @product = Product.find_by_id(params[:id])
    redirect_to_default unless @product
  end

  def find_showroom
    @showroom = Showroom.find_by_id(params[:showroom_id])
    redirect_to_default if @showroom.blank? || !current_user.showrooms.include?(@showroom)
  end
end
