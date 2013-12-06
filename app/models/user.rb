class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

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
