class ProdutosController < ApplicationController
  def index
    @produtos_por_nome =  Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end

  def new
    @produto = Produto.new
  end

  def busca
    @nome_a_buscar = params[:nome]
    if @nome_a_buscar == "*"
      @produtos = Produto.where "nome like '%%'"
    else
      @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end
  end

  def create
    valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
    @produto = Produto.new valores
    if @produto.save
      #flash[:notice] = 'Produto 2222criado com Sucesso.'
      redirect_to root_url, notice: 'Produto criado com Sucesso.'
    else
      render :new
    end
    #redirect_to root_url
  end

  def destroy
    id = params[:id]
    @produto = Produto.destroy id
    redirect_to root_url, notice: 'Produto excluído com sucesso!'
  end
end
