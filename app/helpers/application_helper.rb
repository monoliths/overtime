module ApplicationHelper
  def route_active?(route)
    'active' if current_page?(route)
  end
end
