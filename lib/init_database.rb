require 'contract_loader'
require 'data_prep_ops'

def load_data
  @client = SODA::Client.new({:domain => "greengov.data.ca.gov", :app_token => ENV["SOCRATA_APP_TOKEN"]})
  offset = 0
  limit = 50000

  while offset < 346018 do

    @response = @client.get("ekkz-4vv6", {
      "$limit" => limit,
      "$offset" => offset
      })

    @response.each do |record|
      purchase = Purchase.new

      purchase.supplier_code = record.supplier_code
      purchase.commodity_title = record.commodity_title
      purchase.segment = record.segment
      purchase.segment_title = record.segment_title
      purchase.calcard = (record.calcard == "YES") ? true : false
      purchase.unit_price = record.unit_price
      purchase.acquisition_method = record.acquisition_method
      purchase.create_date = record.create_date
      purchase.purchase_date = record.purchase_date
      purchase.family = record.family
      purchase.family_title = record.family_title
      purchase.quantity = record.quantity
      purchase.acquisition_type = record.acquisition_type
      purchase.department_name = record.department_name
      purchase.normalized_unspsc = record.normalized_unspsc
      purchase.purchase_order_number = record.purchase_order_number
      purchase.supplier_name = record.supplier_name
      purchase.class_title = record.class_title
      purchase.class_name = record.class
      purchase.item_description = record.item_description
      purchase.item_name = record.item_name
      purchase.total_price = record.total_price
      purchase.fiscal_year = record.fiscal_year
      purchase.classification_codes = record.classification_codes
      purchase.contract_number = record.lpa_number

      purchase.save
    end

    offset = offset + limit
  end
  return "fin"
end

def init_db
  load_data
  load_contracts
  load_unspscs
  create_departments
  check_epp
  check_sabrc
  set_department_purch_counts
  init_display_names
  calculate_potential_epps
end

