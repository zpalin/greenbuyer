class HomeController < ApplicationController
  def index
    @summary = Summary.new
    @epp_spending_leaders = Department.all.sort_by(&:epp_percent).reverse[0..4]
  end

  def minor
  end

  def coming_soon
  end
end
