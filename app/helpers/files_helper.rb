require 'csv'

module FilesHelper
  def get_random_row
    rows = CSV.readlines(Rails.root.join('app', 'files', 'quotes.csv'))
    headers, row_attrs = rows.shift, rows.sample
    headers.each_with_index.map do |header, index|
      [header, row_attrs[index] || '']
    end.to_h
  end
end
