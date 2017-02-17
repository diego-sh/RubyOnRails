class ArticlesController < ApplicationController
   #Ejecutaremos una accion antes de las demas
    before_action :authenticate_user!, except: [:show, :index]
    #mandamos a llamar al articulo por ID antes de las acciones
    before_action :set_article, except: [:index, :new, :create]
    #se accede con el verbo GET
    def index
        #Obtiene todos los registros de la base
        @articles = Article.all
    end
    #GET articles id
    def show
        #Obtiene el registro por un id especificado
       # @article= Article.find(params[:id])
        #Where
        #Article.where("id=? AND titulo= ?", params[:id], params[:titulo])
        @article.update_visita
        @comentario= Comentario.new
    end
    #GET articles/new11
    def new
        @article= Article.new
    end

    #POST /articles
    def create
        @article= current_user.articles.new(article_params);
        if @article.save
        redirect_to @article
        else
        render :new
        end
    end
    def edit
       # @article= Article.find(params[:id])
    end
    
    def update
        #@article.update_attributes({title: 'Nuevo titulo'})
       # @article= Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else   
            render :edit
        end
    end

    def destroy
        #@article= Article.find(params[:id])
        @article.destroy #Destroy elmina el objeto de la BBBDD
        redirect_to articles_path
    end

    # Todo lo que este abajo del prvate es solo para el controlador
    private
    
    def set_article
        @article= Article.find(params[:id])
    end

    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end
   
    # Es para evitar los ataques y q puedan enviar mas datos e insertar en la base
    def article_params
        params.require(:article).permit(:titulo,:cuerpo);
    end

end