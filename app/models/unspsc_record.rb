class UnspscRecord < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, 
                  :against => [:level_one_description, :level_two_description, :level_three_description, :level_four_description, :full_code],
                  :using => {
                    :tsearch => {:prefix => true}
                  }
end
