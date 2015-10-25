class AddCorrectComplianceFieldsToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :epp_compliant, :boolean
  end
end
