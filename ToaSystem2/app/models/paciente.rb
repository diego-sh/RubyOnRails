class Paciente < ApplicationRecord
    has_one :residencia, inverse_of: :paciente
    accepts_nested_attributes_for :residencia, reject_if: proc { |attributes| attributes[:Res_Sector].blank? }

    validates :Pac_HC, :Pac_Cedula, uniqueness: { message: "Debe ser Único" }
    validates :Pac_HC, :Pac_Cedula, :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nombres,
    :Pac_Nacionalidad, presence: true

    validates :Pac_Cedula, :Pac_Telefono, numericality: { only_integer: true }
    validates  :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nacionalidad, 
    format: { with: /\A[a-zA-Z]+\z/, message: "Ingrese solo letras" }
    validates :Pac_Nombres, format: { with: /\A[a-zA-Z\s ]+\z/, message: "Ingrese solo letras" }

    validates :Pac_Pasaporte, numericality: { only_integer: true }, allow_blank: true
    #validates :Pac_Ocupacion, format: { with: /\A[a-zA-Z]+\z/, message: "Ingrese solo letras" }, allow_blank: true
end 
