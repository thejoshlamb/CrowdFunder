class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :pledges
  has_many :comments, through: :projects

  validates_presence_of :username, :email

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def pledge_total
    self.pledges.sum(:amount)
  end

end
