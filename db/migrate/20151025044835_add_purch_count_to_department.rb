class AddPurchCountToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :purch_count, :integer
  end
end
