class EmpleadosController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def index
    #@empleados=Persona.all
    @empleados = Persona.find_by_sql("SELECT *, e.emp_rol as Rol FROM personas p INNER JOIN empleados e on p.persona_id = e.persona_id;")
  end

  def new
    @persona=Persona.new
    @empleado=Empleado.new
    @persona.empleado=@empleado
  end

  def show
  end

  def edit
  end

  def create
    @persona = Persona.new(persona_params)
    respond_to do |format|
      if @persona.save
        #flash[:notice] = "Guardado Exitoso!"
        #redirect_to @persona
        format.html { redirect_to empleados_path, notice: 'Empleado was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:Per_Cedula, :Per_Apellido_Paterno, :Per_Apellido_Materno, :Per_Nombres, :Per_Fecha_Nacimiento, :Per_Telefono, medico_attributes:[:id, :Med_Especialidad], empleado_attributes:[:id,:Emp_Rol])
    end
end
