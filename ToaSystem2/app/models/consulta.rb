class Consulta < ApplicationRecord
  belongs_to :cita
  has_many :diagnosticos
  has_many :sintomas, :through=>:diagnosticos


  def self.verificaCreacion(term)
    if term
      where('cita_id=?', "#{term}")
    else
      nil
    end
    

  end
  
end
