class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :projects
  has_many :pledges
  has_many :comments, through: :projects

  def pledge_total
    self.pledges.sum(:amount)
  end

end
