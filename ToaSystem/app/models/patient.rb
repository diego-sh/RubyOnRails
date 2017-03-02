class Patient < ApplicationRecord
    validates :PAC_CEDULA,
        :presence => true,
        :length => { is: 10 }
    
    validates_format_of :PAC_APELLIDO_PATERNO, :PAC_APELLIDO_MATERNO, :PAC_NOMBRES, :PAC_NACIONALIDAD, :PAC_OCUPACION, 
        :with => /\A[a-zA-Z]+\z/,
        :message => "Por favor ingrese unicamente letras"

    validates :PAC_TELEFONO,
        :numericality => true

    has_many :appointment

end
