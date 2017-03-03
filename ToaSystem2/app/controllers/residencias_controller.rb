class ResidenciasController < ApplicationController
  before_action :set_residencia, only: [:show, :edit, :update, :destroy]

  # GET /residencias
  # GET /residencias.json
  def index
    @residencias = Residencia.all
  end

  # GET /residencias/1
  # GET /residencias/1.json
  def show
  end

  # GET /residencias/new
  def new
    @residencia = Residencia.new
  end

  # GET /residencias/1/edit
  def edit
  end

  # POST /residencias
  # POST /residencias.json
  def create
    @residencia = Residencia.new(residencia_params)

    respond_to do |format|
      if @residencia.save
        format.html { redirect_to @residencia, notice: 'Residencia was successfully created.' }
        format.json { render :show, status: :created, location: @residencia }
      else
        format.html { render :new }
        format.json { render json: @residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residencias/1
  # PATCH/PUT /residencias/1.json
  def update
    respond_to do |format|
      if @residencia.update(residencia_params)
        format.html { redirect_to @residencia, notice: 'Residencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @residencia }
      else
        format.html { render :edit }
        format.json { render json: @residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residencias/1
  # DELETE /residencias/1.json
  def destroy
    @residencia.destroy
    respond_to do |format|
      format.html { redirect_to residencias_url, notice: 'Residencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residencia
      @residencia = Residencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residencia_params
      params.require(:residencia).permit(:paciente_id, :Res_Sector, :Res_Calle_Principal, :Res_Calle_Secundaria, :Res_Numero_Casa, :Res_Provincia, :Res_Canton, :creado_at, :actualizado_at, :user_id)
    end
end
