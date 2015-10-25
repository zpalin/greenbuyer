class AddIndexesToSearch < ActiveRecord::Migration
  def change
    add_index :unspscs, :number
    add_index :unspsc_records, :full_code
  end
end
