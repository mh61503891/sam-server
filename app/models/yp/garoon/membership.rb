class Yp::Garoon::Membership < ApplicationRecord

  belongs_to :group, class_name:'Yp::Garoon::Group'
  belongs_to :person, class_name:'Yp::Garoon::Group'

end
