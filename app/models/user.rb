class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy
  has_many :conversants, dependent: :destroy
  # admin_groups is not a physical table but rather an association name used in the users
  # model to facilitates the relationship between users and groups where users act as admin
  has_many :admin_groups, class_name: "Group", foreign_key: "admin_id"

  # define associations for added users and groups separately
  has_many :added_users, through: :contacts, source: :contactable, source_type: "User"
  has_many :added_groups, through: :contacts, source: :contactable, source_type: "Group"

end
