class Produto < ApplicationRecord
  validates :nome, presence: true
  validates :descricao, presence: true
  validates :quantidade, presence: true
  validates :preco, presence: true
end
