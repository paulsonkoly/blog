class AddEmailAndNameToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :name, :string, default: ''
    add_column :comments, :email, :string, default: ''
  end
end
