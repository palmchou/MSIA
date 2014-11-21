class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :side_news

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end


  def current_page
    page = params[:page]
    page.nil? ? 1 : page.to_i
  end

  def side_news
    @side_news = News.order(created_at: :desc).limit(5)
  end
end