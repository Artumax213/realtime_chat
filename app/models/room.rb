class Room < ApplicationRecord
  has_many :conversants, dependent: :destroy
  #validates uniqueness of: name
  validates :name, uniqueness: { case_sensitive: false }
end
