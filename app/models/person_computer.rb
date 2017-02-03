class PersonComputer < ApplicationRecord
  belongs_to :person
  belongs_to :computer
  belongs_to :assignment, foreign_key:'computer_assignment_id', class_name:'ComputerAssignment'
end
