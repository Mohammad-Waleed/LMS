class BookHistory < ApplicationRecord
  belongs_to :book
  belongs_to :issuer
  validates :book_id,:issuer_id,presence: true
end
