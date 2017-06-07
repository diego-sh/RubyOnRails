class Antecedente < ApplicationRecord
  before_save :upperCase
  belongs_to :paciente, inverse_of: :antecedente

  validates :Ant_Descripcion, presence: true

  def upperCase
    self.Ant_Descripcion= self.Ant_Descripcion.capitalize
  end
end
