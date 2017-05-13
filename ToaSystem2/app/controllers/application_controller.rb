class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :comprobar_login


  private
  def comprobar_login
    unless session[:usuario]
      redirect_to :controller=>"usuarios", :action=>"login"
    end
    
  end
  
end
