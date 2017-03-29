class Medico < ApplicationRecord
  before_save :upperCase
  belongs_to :persona,inverse_of: :medico
<<<<<<< HEAD
  has_many :citas, inverse_of: :medico
=======
  has_many :horarios

>>>>>>> origin/master
  validates :Med_Especialidad, presence: true
  validates :Med_Especialidad, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }
  
  def upperCase
        self.Med_Especialidad= self.Med_Especialidad.upcase
  end

end
