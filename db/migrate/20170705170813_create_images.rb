class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :label
      t.attachment :file
      t.references :blogpost, foreign_key: true

      t.timestamps
    end
  end
end
