module ApplicationHelper
  def route_active?(route)
    'active' if current_page?(route)
  end

  def status_label status
    case status
      when 'pending'
        content_tag(:span, status.capitalize, class: 'label label-primary')
      when 'confirmed'
        content_tag(:span, status.capitalize, class: 'label label-success')
      when 'submitted'
        content_tag(:span, status.capitalize, class: 'label label-primary')
      when 'approved'
        content_tag(:span, status.capitalize, class: 'label label-success')
      when 'rejected'
        content_tag(:span, status.capitalize, class: 'label label-danger')
    end
  end
end
