class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]
  before_action :set_paciente, only: [:new]

  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @cita = Cita.new
    @especialistas=Persona.find_by_sql("SELECT CONCAT(CONCAT(p.Per_Apellido_Paterno,' '), p.Per_Nombres) AS Nombre, m.medico_id, p.persona_id FROM personas p INNER JOIN medicos m on p.persona_id = m.persona_id")
    @paciente=Paciente.search(params[:term])
    if !@paciente
      flash[:notice]='Paciente no existe!!'
    else
      @@pacienteActual=@paciente[0]     
    end
    
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(cita_params)
    @cita.paciente_id=@@pacienteActual.paciente_id
    respond_to do |format|
      if @cita.save
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1
  # PATCH/PUT /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'Cita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params[:id])
    end

    def set_paciente
      @@pacienteActual=nil
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def cita_params
      params.require(:cita).permit(:empleado_id, :medico_id, :Cit_Fecha, :Cit_Hora, :Cit_Motivo, :Cit_Estado, :Cit_Observacion)
    end
end
