class Library < ApplicationRecord
  has_one :admin
  has_many :books
  has_many :managers

  validates :fine,presence: true
  validates :fine, numericality: {only_integer: true , greater_than_or_equal_to: 0}

end
