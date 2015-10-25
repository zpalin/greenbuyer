require 'csv'

def load_contracts
  contracts_csv = CSV.read("/Users/zacpalin/Documents/contractsnew.csv")

  contracts_csv.each do |row| 
    contract = Contract.new
    contract.reference_number = row[0]
    contract.description = row[1]
    contract.contract_number = row[2]
    contract.url = row[3]
    contract.start_date = Date.strptime(row[17], '%m/%d/%y')
    contract.end_date = Date.strptime(row[18], '%m/%d/%y')
    contract.state_users = row[20]
    contract.local_agencies = yes_no_to_bool row[21]
    contract.contact_name = row[22]
    contract.contact_email = row[23]
    contract.contact_phone = row[24]
    contract.sb_dvbe_compliant = yes_no_to_bool row[26]
    contract.epp_compliant = yes_no_to_bool row[27]
    contract.sabrc_compliant = yes_no_to_bool row[28]

    contract.save

    for i in 4..16
      unless row[i].nil?
        unspsc = Unspsc.new
        unspsc.contract_id = contract.id
        unspsc.number = row[i]
        unspsc.save
      end
    end

  end
end

def yes_no_to_bool val
  retval = nil

  (val.upcase == 'YES') ? retval = true : retval = false

  return retval
end

def load_unspscs
  unspscs_csv = CSV.read("/Users/zacpalin/Documents/unspscs.csv")

  unspscs_csv.each do |row| 
    uns = UnspscRecord.new
    uns.level_one = row[0]
    uns.level_two = row[2]
    uns.level_three = row[4]
    uns.level_four = row[6]
    uns.full_code = row[8]
    uns.level_one_description = row[1]
    uns.level_two_description = row[3]
    uns.level_three_description = row[5]
    uns.level_four_description     = row[7]

    uns.save
  end  
end