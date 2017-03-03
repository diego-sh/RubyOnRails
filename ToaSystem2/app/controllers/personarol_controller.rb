class PersonarolController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def index
   @personas = Persona.all
  end

  def new
    @persona = Persona.new
    @empleado= Empleado.new
    @persona.empleado=@empleado
  end

  def create2
     raise
   @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @personarol, notice: 'Persona was successfully created.' }
        format.json { render :index, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @personarol, notice: 'Persona was successfully updated.' }
        format.json { render :index, status: :ok, location: @personarol }
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
      params.require(:personarol).permit(:Per_Cedula, :Per_Apellido_Paterno, :Per_Apellido_Materno, :Per_Nombres, :Per_Fecha_Nacimiento, :Per_Telefono, empleado_attributes:[:id, :Emp_Rol])
    end
end
