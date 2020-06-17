class User < ApplicationRecord
  def self.inheritance_column
    nil
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
