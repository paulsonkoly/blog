class ChangeImagesForCarrierwave < ActiveRecord::Migration[5.1]
  def change
    change_table :images do |t|
      t.remove :file_file_name, :file_content_type, :file_file_size
      t.string :file 
    end
  end
end
