class Paciente < ApplicationRecord
    before_save :upperCase
    
    has_many :antecedentes, inverse_of: :paciente
    has_many :citas, inverse_of: :paciente

    has_one :residencia, inverse_of: :paciente
    accepts_nested_attributes_for :residencia, reject_if: proc { |attributes| attributes[:Res_Sector].blank? }

    validates :Pac_HC, :Pac_Cedula, uniqueness: { message: "Debe ser Único" }
    validates :Pac_Cedula, :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nombres,
    :Pac_Nacionalidad, presence: true

    validates :Pac_Cedula, :Pac_Telefono, numericality: { only_integer: true }
    validates  :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nacionalidad, 
    format: { with: /\A[a-zA-Z]+\z/, message: "Ingrese solo letras" }
    validates :Pac_Nombres, format: { with: /\A[a-zA-Z\s ]+\z/, message: "Ingrese solo letras" }

    validates :Pac_Pasaporte, numericality: { only_integer: true }, allow_blank: true
    #validates :Pac_Ocupacion, format: { with: /\A[a-zA-Z]+\z/, message: "Ingrese solo letras" }, allow_blank: true
  
  def upperCase
    self.Pac_HC= self.Pac_HC.upcase
    self.Pac_Apellido_Materno= self.Pac_Apellido_Materno.upcase
    self.Pac_Apellido_Paterno= self.Pac_Apellido_Paterno.upcase
    self.Pac_Nombres= self.Pac_Nombres.upcase
    self.Pac_Pasaporte= self.Pac_Pasaporte.upcase
    self.Pac_Nacionalidad= self.Pac_Nacionalidad.upcase
    self.Pac_Ocupacion= self.Pac_Ocupacion.upcase
  end

  def self.search(term)
    if term
        where('Pac_Cedula=?', "#{term}")
    else
        nil
    end
  end
end 
