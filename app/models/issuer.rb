class Issuer < User
  has_one_attached :image

  enum status:[:active , :inactive]

  validates :status,:fname,:lname,:balance, presence: true
  validates :status, inclusion: {in: %w(active inactive)}
  validates :balance, numericality: {only_integer: true , greater_than_or_equal_to: 0}
  validates :fname,:lname, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
