class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :blogpost, foreign_key: true

      t.timestamps
    end
  end
end
