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

end