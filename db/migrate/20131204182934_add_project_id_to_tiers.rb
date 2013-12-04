class AddProjectIdToTiers < ActiveRecord::Migration
  def change
    add_column :tiers, :project_id, :integer
  end
end
