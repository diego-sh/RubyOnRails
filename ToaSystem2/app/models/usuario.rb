require 'digest/sha1'

class Usuario < ApplicationRecord
  before_save :encrypt, :upperCase

  belongs_to :perfil, inverse_of: :usuario
  has_one :persona, inverse_of: :usuario

  #:encryptar password
  def encrypt
    self.Password= Digest::SHA1.hexdigest(self.Password)
  end

  def estadoActivo
    self.Estado= "ACTIVO"
  end

  def upperCase
    self.User_Name= self.User_Name.upcase  
  end

  private
  def self.stateUpdate(idUsuario,state)
    usuario=self.find(idUsuario)
    if usuario
      usuario.update_attributes(:Estado=>state)
    end
  end

  
  
end
