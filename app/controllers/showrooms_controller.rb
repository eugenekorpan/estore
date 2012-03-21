class ShowroomsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @showrooms = Showroom.page(params[:page]||1)
  end
end
