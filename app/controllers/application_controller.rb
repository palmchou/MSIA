class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?




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



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :member_name << :phone_number << :address << :role << :brief << :show
    devise_parameter_sanitizer.for(:account_update) << :member_name << :phone_number << :address << :role << :brief << :show
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def global_info
    news = News.order(created_at: :desc).limit(5)

    address = MsiaInfo.find_by_slug('address')
    tel = MsiaInfo.find_by_slug('tel')
    fax = MsiaInfo.find_by_slug('fax')
    mail = MsiaInfo.find_by_slug('mail')

    links = Link.limit(5)

    contact_infos = [address, tel, fax, mail]

    @global_info = { news: news, contact_infos: contact_infos, links: links }
  end
end