module ApplicationHelper

  def set_title(t)
    site_name = '澳門軟件行業協會'
    title = t.to_s ? "#{t.to_s} - #{site_name}" : site_name
    content_for :page_title, content_tag(:title, title)
  end

  def current_controller?(names)
    names == controller_name
  end

  def current_path
    request.path
  end

  def index_page?
    if current_page?(root_path) || request.path == '/'
      true
    else
      false
    end
  end

  def members_page?
    false
    if current_controller?('registrations') ||
        current_controller?('sessions') ||
        current_controller?('passwords') ||
        current_controller?('confirmations')
      true
    end
  end

  def smart_url_for_member_service
    if member_signed_in?
      url_for members_path
    else
      url_for new_member_registration_path
    end
  end

  def cc(content)
    if I18n.locale.to_s == 'zh-TW'
      Ropencc.conv('simp_to_trad_v', content)
    elsif I18n.locale.to_s == 'zh-CN'
      Ropencc.conv('trad_to_simp', content)
    else
      content
    end
  end
end