class Persona < ApplicationRecord
    has_one :medico, inverse_of: :persona
    has_one :empleado, inverse_of: :persona
    accepts_nested_attributes_for :medico, reject_if: proc { |attributes| attributes[:Med_Especialidad].blank? }
    accepts_nested_attributes_for :empleado, reject_if: proc { |attributes| attributes[:Emp_Rol].blank? }
end
