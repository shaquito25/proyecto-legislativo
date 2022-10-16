class Perfil < ApplicationRecord
    has_many :users
    belongs_to :expedient, optional: true
    
    def isAdmin?
        codigo =="admin"
    end

    def isInv?
        codigo =="inv"
    end
end
