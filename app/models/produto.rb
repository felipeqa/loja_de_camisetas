class Produto < ApplicationRecord
  validates :nome, length: {minimum: 5}
  validates :descricao, presence: true
  validates :quantidade, presence: true
  validates :preco, presence: true
end
