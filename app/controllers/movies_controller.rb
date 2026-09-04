class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id] # recupera o ID da rota URI
    @movie = Movie.find(id) # busca o filme no banco pelo ID
  end

  def new
    # Renderiza a view 'new' por padrão
  end

  def create
    @movie = Movie.create!(params.require(:movie).permit(:title, :rating, :release_date, :description))
    flash[:notice] = "#{@movie.title} foi criado com sucesso!"
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    movie_params = params.require(:movie).permit(:title, :rating, :description, :release_date)
    @movie.update!(movie_params)

    # Define mensagem temporária e redireciona para os detalhes do filme
    flash[:notice] = "O filme '#{@movie.title}' foi atualizado com sucesso!"
    redirect_to movie_path(@movie)
  end

  def DELETE
    @movie = Movie.find(params[:id])
    @movie.destroy
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "O filme '#{@movie.title}' foi excluído com sucesso."
    redirect_to movies_path
  end
end
