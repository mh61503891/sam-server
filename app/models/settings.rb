class Settings < Settingslogic
  source "#{Rails.root}/sunaba.yml"
  namespace Rails.env
end
