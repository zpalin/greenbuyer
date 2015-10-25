class CreateUnspscs < ActiveRecord::Migration
  def change
    create_table :unspscs do |t|
      t.string :number
      t.string :description
      t.integer :contract_id

      t.timestamps null: false
    end
  end
end
