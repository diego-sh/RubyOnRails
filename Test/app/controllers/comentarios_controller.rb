class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:update, :destroy]
  before_action :set_article
  before_action :authenticate_user!
  


  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = current_user.comentarios.new(comentario_params)
    @comentario.article =@article
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario.article, notice: 'Comentario was successfully created.' }
        format.json { render :show, status: :created, location: @comentario.article }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario.article, notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_article
      @article= Article.find(params[:article_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:user_id, :article_id, :cuerpo)
    end
end
