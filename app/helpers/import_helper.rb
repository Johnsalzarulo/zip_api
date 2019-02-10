module ImportHelper
  require 'csv'

  def get_csv
    #TODO need to work on parsing.
    file_path = "public/cbsa_to_msa.csv"
    csv_text = File.open(file_path, "r:ISO-8859-1")
    CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row.to_hash
    end
  end
end
