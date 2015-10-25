class LeaderboardsController < ApplicationController
  def index
    @epp_spending_leaders = Department.all.sort_by(&:epp_percent).reverse
    @potential_epp_spending_leaders = Department.all.sort_by(&:potential_epp_percent).reverse
  end
end