class Expedient < ApplicationRecord
   has_many :perfils
   # validates :name, :person_type, :request_quantity, :document, :request_type, presence: true

   validate :cantidad

   def cantidad
      if self.request_quantity > Inventory.first.med.to_i || self.request_quantity > Inventory.first.ct.to_i
         errors.add(:request_quantity, 'No Disponible')
      end
   end 
end
