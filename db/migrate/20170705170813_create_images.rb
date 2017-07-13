class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :label
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.references :blogpost, foreign_key: true

      t.timestamps
    end
  end
end
