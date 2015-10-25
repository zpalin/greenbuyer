class Summary
  def total_spending
  	Purchase.sum(:total_price)
  end

  def non_epp_spending
    total_spending - epp_spending - potential_epp_spending
  end

  def potential_epp_spending
    Purchase.where(potential_epp: true).sum(:total_price)
  end

  def epp_spending
  	Purchase.where(epp_compliant: true).sum(:total_price)
  end

  def epp_percent
  	(epp_spending / total_spending) * 100
  end

  def sabrc_spending
  	Purchase.where(sabrc_compliant: true).sum(:total_price)
  end

  def sabrc_percent
  	(sabrc_spending / total_spending) * 100
  end

  def total_spending_by_year(year)
  	Purchase.for_year(year).sum(:total_price)
  end

  def non_epp_spending_by_year(year)
    total_spending_by_year(year) - epp_spending_by_year(year) - potential_epp_spending_by_year(year)
  end

  def epp_spending_by_year(year)
  	Purchase.for_year(year).where(epp_compliant: true).sum(:total_price)
  end

  def epp_percent_by_year(year)
  	(epp_spending_by_year(year) / total_spending_by_year(year)) * 100
  end

  def sabrc_spending_by_year(year)
  	Purchase.for_year(year).where(sabrc_compliant: true).sum(:total_price)
  end

  def sabrc_percent_by_year(year)
  	(sabrc_spending_by_year(year) / total_spending_by_year(year)) * 100
  end

  def potential_epp_spending_by_year(year)
    Purchase.for_year(year).where(potential_epp: true).sum(:total_price)
  end
end