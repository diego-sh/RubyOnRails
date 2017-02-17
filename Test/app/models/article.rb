class Article < ApplicationRecord
    # Para las validaciones que se puede hacer:
    # presence: Hace que el campo sea obligatorio
    # uniqueness que sea único    
    validates :titulo, presence: true, uniqueness: true
    # lenght: minimo debe de tener 20 caracteres
    validates :cuerpo, presence: true, length: {minimum: 20}
    #acceder al id Usuario
    belongs_to :user

    before_create :set_visita
    has_many :comentarios

    def update_visita
        self.update(visita: self.visita + 1)
    end

    private
    def set_visita
        self.visita=0;
    end 
    
end
