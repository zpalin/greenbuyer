class AddFullCodeToUnspscRecord < ActiveRecord::Migration
  def change
    add_column :unspsc_records, :full_code, :string
  end
end
