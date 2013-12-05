class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :comments
	has_many :tiers

  def pledge_total
    self.pledges.sum(:amount)
  end

  def pledge_percent
    percent = pledge_total * 100 / self.goal
    percent = 100 if percent >= 100
  end

  mount_uploader :picture, PictureUploader

end