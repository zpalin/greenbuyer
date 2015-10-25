class AddComplianceFieldsToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :epp_compliance, :boolean
    add_column :purchases, :sabrc_compliant, :boolean
  end
end
