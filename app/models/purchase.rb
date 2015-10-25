class Purchase < ActiveRecord::Base
	scope :for_year, lambda {|year| where("purchase_date >= ? and purchase_date <= ?", "#{year}-01-01", "#{year}-12-31")}

  def department
    @department ||= Department.where(name: department_name).first
  end

  def contract_url
    Contract.where(contract_number: potential_contract).first.url
  end
end
