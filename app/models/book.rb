class Book < ApplicationRecord
  belongs_to :library
  has_many_attached :image
  has_one :book_history

  enum status:[:available,:unavailable]

  validates :title,:isbn,:author,:year,:genre,:no_of_copies,:status,:library_id ,presence: true
  validates :isbn , length: { in: 10..13 }
  validates :year,  length: { is: 4 }
  validates :year,:isbn,:no_of_copies ,numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :isbn,uniqueness: true
  validates :status, inclusion: {in: %w(available unavailable)}
end
