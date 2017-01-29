module ApplicationHelper
  def error_messages_for(object)
    render "error_messages", object: object
  end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    unless html_tag =~ /^<label/
      "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
    else
      html_tag.html_safe
    end
  end
end
