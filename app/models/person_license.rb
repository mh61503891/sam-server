class PersonLicense < ApplicationRecord
  belongs_to :user
  belongs_to :license
end
