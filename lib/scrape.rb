require 'net/http'

uri = URI("https://www.bidsync.com/DPX?ac=agencycontview&contid=111893")
res = Net::HTTP.get_response(uri)

re
