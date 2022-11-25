class Expedient < ApplicationRecord
   has_many :perfils
   belongs_to :inventory
   validates :name, :surname, :person_type, :age, :birth_date, :request_quantity, :document, :email, :request_type, presence: true
end
