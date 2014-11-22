class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :global_info

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

  def current_controller?(names)
    names.include?(current_controller)
  end

  def global_info
    news = News.order(created_at: :desc).limit(5)

    address = MsiaInfo.find_by_slug('address')
    tel = MsiaInfo.find_by_slug('tel')
    fax = MsiaInfo.find_by_slug('fax')
    mail = MsiaInfo.find_by_slug('mail')

    contact_infos = [address, tel, fax, mail]

    @global_info = { news: news, contact_infos: contact_infos }
  end
end