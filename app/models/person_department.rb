class PersonDepartment < ApplicationRecord
  belongs_to :person
  belongs_to :department
  belongs_to :title
end
