class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]

  # GET /horarios
  # GET /horarios.json
  def index
    #@horarios = Horario.all
    @horarios = Horario.find_by_sql("SELECT * ,p.per_apellido_paterno AS apellidop ,p.per_apellido_materno AS apellidom,p.per_nombres AS nombres FROM horarios h JOIN medicos m ON h.medico_id=m.medico_id JOIN personas p ON p.persona_id=m.persona_id")
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
  end

  # GET /horarios/new
  def new
    #@horario = Horario.new
    @horario = Horario.new(:medico_id => params[:param])
  end

  # GET /horarios/1/edit
  def edit
  end

  # POST /horarios
  # POST /horarios.json
  def create
    @horario = Horario.new(horario_params)

    respond_to do |format|
      if @horario.save
        format.html { redirect_to @horario, notice: 'Horario was successfully created.' }
        format.json { render :show, status: :created, location: @horario }
      else
        format.html { render :new }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to @horario, notice: 'Horario was successfully updated.' }
        format.json { render :show, status: :ok, location: @horario }
      else
        format.html { render :edit }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to horarios_url, notice: 'Horario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:medico_id, :Hor_Hora_Inicio, :Hor_Hora_Fin, :Hor_Dia)
    end
end
