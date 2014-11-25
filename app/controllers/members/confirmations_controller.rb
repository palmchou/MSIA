class Members::ConfirmationsController < Devise::ConfirmationsController
  before_action :global_info

  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
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
