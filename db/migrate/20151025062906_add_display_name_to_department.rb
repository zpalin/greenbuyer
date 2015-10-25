class AddDisplayNameToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :display_name, :string
  end
end
