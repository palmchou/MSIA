require 'i18n'
I18n.default_locale = 'zh-TW'

RailsAdmin.config do |config|

  ### Popular gems integration

  config.main_app_name = ['澳門軟件行業協會', '站台管理']

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :member
  end
  config.current_user_method(&:current_member)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.included_models = ['Link', 'Member', 'MsiaInfo', 'News']

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'MsiaInfo' do
    list do
      field :name
      field :content
    end
    edit do
      field :name
      field :content, :ck_editor
    end
  end

  config.model 'Link' do
    list do
      field :title
      field :url
    end
  end

  config.model 'News' do
    list do
      field :title
      field :cate do
        formatted_value do
          case bindings[:object].cate
            when News::NOTICE
              '公告通知'
            when News::MSIA
              '協會新聞'
            when News::INDUSTRY
              '行業新聞'
          end
        end
      end
      field :content
      field :created_at
    end
    edit do
      field :title
      field :cate, :enum do
        enum do
          ['1', '2', '3']
        end
      end
      field :content, :ck_editor
    end
  end
end