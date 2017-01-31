class PersonApplication < ApplicationRecord
  belongs_to :person
  belongs_to :application
  belongs_to :assignment
end
