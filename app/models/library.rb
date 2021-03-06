class Library < ApplicationRecord
  has_one :admin
  has_many :books
  has_many :managers
  has_many :issuers

  validates :fine,presence: true
  validates :fine, numericality: { greater_than_or_equal_to: 0}
end
