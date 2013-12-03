class AddUseridAndProjectidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :project_id, :integer
    add_column :pledges, :user_id, :integer
    add_column :pledges, :project_id, :integer
  end
end
