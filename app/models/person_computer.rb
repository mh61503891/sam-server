class PersonComputer < ApplicationRecord
  belongs_to :person
  belongs_to :computer
  belongs_to :assignment
end
