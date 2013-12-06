class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :comments
	has_many :tiers

  mount_uploader :picture, PictureUploader

  validates_presence_of :name, :description, :goal, :deadline

  def pledge_total
    self.pledges.sum(:amount)
  end

  def pledge_percent(max)
    pledge = pledge_total * 100 / self.goal
    if pledge >= max
      return max
    else 
      return pledge
    end
  end

end