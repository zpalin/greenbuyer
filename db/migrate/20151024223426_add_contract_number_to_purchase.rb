class AddContractNumberToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :contract_number, :string
  end
end
