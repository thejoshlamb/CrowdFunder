class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :pledges, through: :projects
  has_many :comments, through: :projects
end
