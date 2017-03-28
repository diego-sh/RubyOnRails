class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  before_action :flag, only: [:new,:newEmpleado]
  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.find_by_sql("SELECT *,  m.med_especialidad as Especialidad FROM personas p INNER JOIN medicos m on p.persona_id = m.persona_id")
  end

  def indexEmpleado
      @personas = Persona.find_by_sql("SELECT *, e.emp_rol as Rol FROM personas p INNER JOIN empleados e on p.persona_id = e.persona_id;")
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    @medico= Medico.new
    @persona.medico=@medico
    @@isDoctor=true
  end

  def newEmpleado
    @persona = Persona.new
    @empleado=Empleado.new
    @persona.empleado=@empleado
    @@isDoctor=false
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    respond_to do |format|
      if @persona.save
        if(@@isDoctor)
        format.html { redirect_to personas_path, notice: 'Especialista guardado exitosamente!' }
      else        
        flash[:notice] = "Empleado guardado exitosamente!"
        format.html { redirect_to indexEmpleado_personas_path}
        
        #format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
        #format.json { render :show, status: :created, location: @persona }
        end
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        flash[:notice] = "Actualización exitosa.!"
        format.html { redirect_to @persona}
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    #variable global para saber que ingreso Medico o Empleado0
    def flag
      @@isDoctor=false
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:Per_Cedula, :Per_Apellido_Paterno, :Per_Apellido_Materno, :Per_Nombres, :Per_Fecha_Nacimiento, :Per_Telefono, medico_attributes:[:id, :Med_Especialidad], empleado_attributes:[:id,:Emp_Rol])
    end
end
