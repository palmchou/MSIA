class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_page
    page = params[:page]
    page.nil? ? 1 : page.to_i
  end
end