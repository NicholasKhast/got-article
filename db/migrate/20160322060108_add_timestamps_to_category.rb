class AddTimestampsToCategory < ActiveRecord::Migration
  def change
    add_column(:categories, :created_at, :datetime)
   
  end
end
