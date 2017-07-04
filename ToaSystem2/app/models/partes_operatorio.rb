class PartesOperatorio < ApplicationRecord
  before_save :setFechaParteOperatorio

  belongs_to :prescripcion
  belongs_to :ingreso

  def setFechaParteOperatorio
    self.Pop_Fecha_Parte=Date.today.strftime("%Y-%m-%d")
  end
  
end
