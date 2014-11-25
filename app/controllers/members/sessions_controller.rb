class Members::SessionsController < Devise::SessionsController
  before_action :global_info

# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
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
