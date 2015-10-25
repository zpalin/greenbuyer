class Contract < ActiveRecord::Base
  def self.find text
    recs = UnspscRecord.search(text)

    results = []
    Unspsc.all.each do |unspsc|
      count = recs.where("full_code LIKE '" + unspsc.number + "%'").count
      if count > 0
        results << unspsc.contract
      end
    end
    return results
  end
end
