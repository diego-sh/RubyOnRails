class Paciente < ApplicationRecord
    has_one :residencia, inverse_of: :paciente
    accepts_nested_attributes_for :residencia, reject_if: proc { |attributes| attributes[:Res_Sector].blank? }
end
