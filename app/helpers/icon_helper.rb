module IconHelper

  def icon_people(options = {})
    font_awesome_icon('users', options)
  end

  def icon_computers(options = {})
    font_awesome_icon('desktop', options)
  end

  def icon_applications(options = {})
    font_awesome_icon('cogs', options)
  end

  def icon_licenses(options = {})
    font_awesome_icon('bookmark', options)
  end

  private

    def font_awesome_icon(names, options)
      if options[:text]
        fa_icon(names, text:options[:text])
      else
        fa_icon(names)
      end
    end

end
