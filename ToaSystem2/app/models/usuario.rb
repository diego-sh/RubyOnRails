require 'digest/sha1'

class Usuario < ApplicationRecord
  before_save :upperCase

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

  def self.autenticar(user_name,pass)
    usuario= self.find_by_User_Name(user_name)
    if usuario
      #if usuario.Password != Digest::SHA1.hexdigest(pass)
      if usuario.Password != pass
        usuario=nil
      end      
    end
    usuario
  end
  
  
end
