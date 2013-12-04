class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :comments
	has_many :tiers
	accept_nested_attributes_for :tiers

  def pledge_total
    self.pledges.sum(:amount)
  end

  def pledge_percent
    pledge_total * 100 / self.goal
  end

end