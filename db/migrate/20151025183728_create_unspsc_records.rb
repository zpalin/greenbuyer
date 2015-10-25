class CreateUnspscRecords < ActiveRecord::Migration
  def change
    create_table :unspsc_records do |t|
      t.string :level_one
      t.string :level_two
      t.string :level_three
      t.string :level_four
      t.string :level_one_description
      t.string :level_two_description
      t.string :level_three_description
      t.string :level_four_description

      t.timestamps null: false
    end
  end
end
