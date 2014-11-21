module NewsHelper
  def sub_menu_class(n, cate)
    return 'list-group-item active' if n.cate == cate
    'list-group-item'
  end
end
