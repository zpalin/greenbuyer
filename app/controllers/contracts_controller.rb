class ContractsController < ApplicationController
  def find
    
  end

  def search
    search_terms = params[:q]
    @results = Contract.find(search_terms)
  end
end