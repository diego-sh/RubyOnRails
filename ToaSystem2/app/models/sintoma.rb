class Sintoma < ApplicationRecord
    has_many :diagnosticos
    has_many :consultas, :through=>:diagnosticos

    validates :Sin_Region_Anatomica, presence: true

    #def upperCase
     #   self.Sin_Region_Anatomica= self.Sin_Region_Anatomica.capitalize
    #end
end
