class HomeController < ApplicationController
  def show
    @posts = Post.limit(5).order('created_at DESC')
  end
  def new
    @post = Post.new
    @posts = Post.all
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Noticia publicada exitosamente!"
      redirect_to '/noticias'
    else
      render "new"
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Noticia editada exitosamente!"
      redirect_to '/noticias'
    else
      flash[:error] = "Hubo un error al editar la noticia."
      redirect_to '/noticias'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Noticia Eliminada exitosamente!"
    redirect_to '/noticias'
  end
  
  def horarios
    @horas = Hora.all
  end
  
  def edit_hora
    @hora = Hora.find(params[:id])
  end
  
  def update_hora
    @hora = Hora.find(params[:id])
    if @hora.update(params.require(:hora).permit(:titulo, :url))
      flash[:success] = "Horario editado exitosamente!"
      redirect_to '/horarios'
    else
      flash[:error] = "Hubo un error al editar el horario."
      redirect_to '/horarios'
    end
  end
  
  private 
    def post_params
      params.require(:post).permit(:titulo, :contenido, :foto)
    end
end
