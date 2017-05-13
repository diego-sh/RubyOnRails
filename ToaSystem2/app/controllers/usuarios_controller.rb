class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :set_persona, only: [:new]
  before_action :idPersona, only: [:create, :new]
  before_action :flagEditar, only: [:edit]
  before_action :set_persona_by_usuario, only: [:edit]
  layout "security", only: [:login]

  # Para saltar el filtro de comprobar si ya est alogeado
  skip_before_filter :comprobar_login, :only=>[:login]



  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.find_by_sql("SELECT p.persona_id, p.Per_Cedula AS Cedula,CONCAT(CONCAT(p.Per_Apellido_Paterno,' '),p.Per_Apellido_Materno )AS Apellidos, p.Per_Nombres AS Nombres,u.usuario_id ,u.User_Name AS Username, pf.Nombre_perfil AS Perfil FROM personas p INNER JOIN usuarios u ON p.usuario_id=u.usuario_id INNER JOIN perfiles pf ON pf.perfil_id=u.perfil_id")
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @perfiles=Perfil.all
    @personas= Persona.all
    @usuario = Usuario.new
    @perfil=Perfil.new
    @usuario.perfil=@perfil
  end

  # GET /usuarios/1/edit
  def edit
    @perfiles=Perfil.all
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    #@usuario= Usuario.new(params[:perfil][:0], params[:usuario][:User_Name], params[:usuario][:Password])
    respond_to do |format|
      if @usuario.save
        Usuario.stateUpdate(@usuario.usuario_id,params[:usuario][:Estado])
        Persona.updateCodigoUsuario(@@id_persona, @usuario.usuario_id)
        #personAux=Persona.find(@@id_persona)
        format.html { redirect_to usuarios_path, notice: 'Usuario creado exitosamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    if request.post?
      usuario= Usuario.autenticar(params[:usuario][:User_Name], params[:usuario][:Password])
      if usuario        
        session[:usuario]= usuario
        persona=Persona.find_by_usuario_id(usuario.usuario_id)
        session[:persona]=persona
        session[:menus]=Usuario.find_by_sql("SELECT m.menu_id, m.menu_nombre, m.menu_icono, m.menu_path 
        FROM perfiles p INNER JOIN perfil_menus pm ON p.perfil_id=pm.perfil_id 
        INNER JOIN menus m ON pm.menu_id=m.menu_id WHERE p.perfil_id="+usuario.perfil_id.to_s)
        flash[:notice] = "Ingreso satisfactorio!"
        redirect_to root_path
      else
        #otras cosas
        flash[:notice] = "Error en el usuario o contraseña.\n Intentelo nuevamente!"
      end      
    end    
  end

  def logout
    session[:usuario]=nil
    flash[:notice]="Sesión cerrada correctamente"
    redirect_to login_usuarios_path
  end
  
  

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        Usuario.stateUpdate(@usuario.usuario_id,params[:usuario][:Estado])
        format.html { redirect_to usuarios_path, notice: 'Usuario actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def set_persona
      @persona= Persona.find(params[:id])
      @@id_persona=@persona.persona_id
    end

    def set_persona_by_usuario
      @persona= Persona.find_by(usuario_id:@usuario.usuario_id)
    end
    

    def idPersona
      @@id_persona
    end

    def flagEditar
      @editar=true
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:perfil_id,:User_Name, :Password, :Estado)
    end
end
