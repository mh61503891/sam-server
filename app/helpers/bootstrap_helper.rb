module BootstrapHelper

  def bs_badge(number)
    content_tag(:span, number, class:'badge')
  end

end
