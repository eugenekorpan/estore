class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if user_signed_in?
      showroom_products_path
    else
      super
    end
  end

  def redirect_to_default
    redirect_to showroom_products_path, :notice => I18n.t('flash_messages.no_page_found')
  end

  def current_showroom
    current_user.current_showroom if current_user
  end

  helper_method :current_showroom
end
