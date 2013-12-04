class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.integer :amount
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
