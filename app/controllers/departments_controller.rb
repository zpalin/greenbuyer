class DepartmentsController < ApplicationController
  def show
  	@department = Department.find(params[:id])
    @purchases = @department.purchases.where(potential_epp: true).order(purchase_date: :desc)
  end

  def index
    @departments = Department.all
  end
end