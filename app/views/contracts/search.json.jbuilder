json.array!(@results) do |result|
  json.contract_number result.contract_number
  json.description result.description
  json.url result.url
  json.start_date result.start_date
  json.end_date result.end_date
end