class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = Paciente.find_by_sql("SELECT paciente_id, Pac_HC, Pac_Cedula, Pac_Apellido_Paterno, Pac_Apellido_Materno, Pac_Nombres, Pac_Telefono,TIMESTAMPDIFF(YEAR, Pac_Fecha_Nacimiento,CURDATE()) AS Age FROM pacientes;");
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    @residencia=Residencia.new
    @paciente.residencia=@residencia
  end

  # GET /pacientes/1/edit 
  def edit
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)
    #raise
    respond_to do |format|
      if @paciente.save
        flash[:notice] = "Paciente guardado exitosamente!"
        format.html { redirect_to pacientes_path}
        #format.html { redirect_to @paciente, notice: 'Paciente fue creado satisfactoriamente' }
        #format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        flash[:notice] = "Actualización exitosa.!"
        format.html { redirect_to pacientes_path, notice: 'Paciente fue actualizado satisfactoriamente' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: 'Paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:Pac_HC, :Pac_Cedula, :Pac_Pasaporte, :Pac_Apellido_Paterno, :Pac_Apellido_Materno, :Pac_Nombres, :Pac_Fecha_Nacimiento, :Pac_Nacionalidad, :Pac_Genero, :Pac_Estado_Civil, :Pac_Instruccion, :Pac_Ocupacion, :Pac_Telefono, :Pac_Grupo_Sanguineo,residencia_attributes:[:id,:Res_Sector,:Res_Calle_Principal, :Res_Calle_Secundaria, :Res_Numero_Casa, :Res_Provincia, :Res_Canton])
    end
end
