class Expedient < ApplicationRecord
   has_many :perfils
   validates :name, :person_type, :request_quantity, :document, :request_type, presence: true
end
