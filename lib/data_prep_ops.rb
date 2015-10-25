def check_epp

  Contract.where(epp_compliant: true).each do |cont|
    Purchase.where(contract_number: cont.contract_number).each do |p|
      unless p.nil?
        p.epp_compliant = true
        p.save
      end
    end
  end
end

def check_sabrc
  Contract.where(sabrc_compliant: true).each do |cont|
    Purchase.where(contract_number: cont.contract_number).each do |p|
      unless p.nil?
        p.sabrc_compliant = true
        p.save
      end
    end
  end
end

def create_departments
  departments = Purchase.group(:department_name).count
  departments.each do |key, val|
    dept = Department.new
    dept.name = key
    dept.save
  end
end

def set_department_purch_counts
  departments = Purchase.group(:department_name).count
  departments.each do |key, val|
    dept = Department.find_or_create_by(name: key)
    dept.purch_count = val
    dept.save
  end
end

def init_display_names
  Department.all.each do |dep|

    index = dep.name.index(',')

    if index.nil?
      dep.display_name =  dep.name
    else
      dep.display_name = "#{dep.name[index+2..dep.name.length-1]} #{dep.name[0..index-1]}"
    end

    dep.save
  end
end

def calculate_potential_epps
  Unspsc.all.each do |unspsc|
    Purchase.where("(epp_compliant = false or epp_compliant IS NULL) AND (potential_epp IS NULL)").where("normalized_unspsc LIKE '" + unspsc.number + "%'").each do |p|
      unless p.purchase_date.nil?
        if (p.purchase_date > unspsc.contract.start_date) && (p.purchase_date < unspsc.contract.end_date)
          p.potential_epp = true
          p.potential_contract = unspsc.contract.contract_number
          p.save
        end
      end
    end
  end
end

