class ProdutosController < ApplicationController

  before_action :set_produto, only: [:edit, :update, :destroy ]
  def index
    @produtos_por_nome =  Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end

  def new
    @produto = Produto.new
    renderiza :new
  end

  def busca
    @nome_a_buscar = params[:nome]
    if @nome_a_buscar == "*"
      @produtos = Produto.where "nome like '%%'"
    else
      @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end
  end

  def edit
    renderiza :edit
  end

  def update
    if @produto.update produto_params
      redirect_to root_url, notice: 'Produto editado com Sucesso.'
    else
      renderiza :edit
    end
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      #flash[:notice] = 'Produto 2222criado com Sucesso.'
      redirect_to root_url, notice: 'Produto criado com Sucesso.'
    else
      renderiza :new
    end
    #redirect_to root_url
  end

  def destroy
    @produto.destroy
    redirect_to root_url, notice: 'Produto excluído com sucesso!'
  end

  private

  def renderiza(view)
    @departamentos = Departamento.all
    render view
  end

  def set_produto
    id = params[:id]
    @produto = Produto.find(id)
  end

  def produto_params
    params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
  end
end
