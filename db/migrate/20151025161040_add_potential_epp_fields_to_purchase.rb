class AddPotentialEppFieldsToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :potential_epp, :boolean
    add_column :purchases, :potential_contract, :string
  end
end
