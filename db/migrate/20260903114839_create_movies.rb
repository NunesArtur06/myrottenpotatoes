class CreateMovies < ActiveRecord::Migration[6.0] # ou versão correspondente do Rails
  def change
    create_table 'movies' do |t| #esses sao os atributos que a tabela movies vai aceitar
      t.string 'title' #titulo
      t.string 'rating' #classificacao
      t.text 'description' #descricao
      t.datetime 'release_date' #data de lancamento
      # Adiciona timestamps para o Rails rastrear criação e alteração automaticamente:
      t.timestamps
    end
  end
end