class Empleado < ApplicationRecord
  before_save :upperCase
  belongs_to :persona,inverse_of: :empleado
  
  validates :Emp_Rol, presence: true
  validates :Emp_Rol, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }

  def upperCase
        self.Emp_Rol= self.Emp_Rol.upcase
    end
end
