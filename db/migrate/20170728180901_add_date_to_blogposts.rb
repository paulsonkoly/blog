class AddDateToBlogposts < ActiveRecord::Migration[5.1]
  def change
    add_column :blogposts, :date, :date
    add_index :blogposts, :date
  end
end
