class AddFieldsToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :supplier_code, :string
    add_column :purchases, :commodity_title, :string
    add_column :purchases, :segment, :string
    add_column :purchases, :segment_title, :string
    add_column :purchases, :calcard, :boolean
    add_column :purchases, :unit_price, :decimal
    add_column :purchases, :acquisition_method, :string
    add_column :purchases, :create_date, :date
    add_column :purchases, :purchase_date, :date
    add_column :purchases, :family, :string
    add_column :purchases, :family_title, :string
    add_column :purchases, :quantity, :integer
    add_column :purchases, :acquisition_type, :string
    add_column :purchases, :department_name, :string
    add_column :purchases, :normalized_unspsc, :string
    add_column :purchases, :purchase_order_number, :string
    add_column :purchases, :supplier_name, :string
    add_column :purchases, :class_title, :string
    add_column :purchases, :class_name, :string
    add_column :purchases, :item_description, :string
    add_column :purchases, :item_name, :string
    add_column :purchases, :total_price, :decimal
    add_column :purchases, :fiscal_year, :string
    add_column :purchases, :classification_codes, :string

    add_index :purchases, :department_name
  end
end
