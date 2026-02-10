class Contact < ApplicationRecord
  belongs_to :user

  belongs_to :contactable, polymorphic: true

  validates :contactable_id, uniqueness: { scope: [:user_id, :contactable_type] }
end
