class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :reference_number
      t.string :description
      t.string :contract_number
      t.date :start_date
      t.date :end_date
      t.string :state_users
      t.boolean :local_agencies
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :url
      t.boolean :epp_compliant
      t.boolean :sabrc_compliant
      t.boolean :sb_dvbe_compliant

      t.timestamps null: false
    end
  end
end
