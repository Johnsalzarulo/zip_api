module ImportHelper
  require 'csv'

  def get_csv(file_path)
    csv_text = File.open(file_path, "r:ISO-8859-1")
    csv = CSV.parse(csv_text, :headers => true)
    # puts "#TODO - Make this call the requested file in a nice clean method - Calling import helper"
  end
end
