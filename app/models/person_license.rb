class PersonLicense < ApplicationRecord
  belongs_to :person
  belongs_to :license
  belongs_to :assignment
end
