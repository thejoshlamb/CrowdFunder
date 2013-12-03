class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :comments

  def pledge_total
    self.pledges.sum(:amount)
  end
end
