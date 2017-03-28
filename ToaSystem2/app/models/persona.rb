class Persona < ApplicationRecord
    before_save :upperCase

    belongs_to :usuario, inverse_of: :persona
    has_one :medico, inverse_of: :persona
    has_one :empleado, inverse_of: :persona
    accepts_nested_attributes_for :medico, reject_if: proc { |attributes| attributes[:Med_Especialidad].blank? }
    accepts_nested_attributes_for :empleado, reject_if: proc { |attributes| attributes[:Emp_Rol].blank? }
    
    validates :Per_Cedula, uniqueness: { message: "Cédula ya existente" }
    validates :Per_Cedula, :Per_Apellido_Paterno, :Per_Nombres, presence: true
    validates :Per_Cedula , numericality: { only_integer: true }
    validates :Per_Telefono, numericality: { only_integer: true }, allow_blank: true
    validates :Per_Nombres, format: { with: /\A[a-zA-Z\s ]+\z/, message: "Ingrese solo letras" }
    validates :Per_Apellido_Materno, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }, allow_blank: true
    validates :Per_Apellido_Paterno, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }

    #funcion que permite antes de hacer comit convertir todos los datos a mayusculas
    def upperCase
        self.Per_Apellido_Materno= self.Per_Apellido_Materno.upcase
        self.Per_Apellido_Paterno= self.Per_Apellido_Paterno.upcase
        self.Per_Nombres= self.Per_Nombres.upcase
    end

    private
        def self.updateCodigoUsuario(id,usuario_id)
            persona= self.find(id)
            if persona
                persona.update_attributes(:usuario_id=>usuario_id)
            else
            end
        end
    
end
