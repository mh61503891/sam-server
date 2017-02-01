module BootstrapHelper

  def bs_badge(*args)
    params = args.first || {}
    content_tag(:span, "#{params[:text]}", class:"badge #{params[:class]}")
  end

end
